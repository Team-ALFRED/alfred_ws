#!/usr/bin/env python

from actionlib.action_client import * 
from move_base_msgs.msg import * 
from alfred_server.msg import *
import dispenser
import roslib
import rospy
import smach
import smach_ros

from Queue import Queue
import signal
import os

ORIGIN = [-50, -50]
MOVEMENT_TIMEOUT = 300

fifo = Queue()

def set_goal_callback(msg):
    rospy.loginfo("[Callback] Item request: [goal: {}, item: {}]".format(msg.goal, msg.item))
    fifo.put(msg)

# move function
def move(x, y):
    ac = ActionClient('move_base', MoveBaseAction)
    ac.wait_for_server()
    rospy.loginfo("Got move_base client")

    goal = MoveBaseGoal()
    goal.target_pose.pose.position.x = x
    goal.target_pose.pose.position.y = y
    goal.target_pose.pose.orientation.w = 1.0
    goal.target_pose.header.frame_id = 'map'

    ac.send_goal(goal)
    ac.wait_for_server()

def speak(msg):
  os.system('espeak -a 20 -s 120 "{}"'.format(msg))

class Idle(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes = ['set_goal', 'error'], output_keys = ['goal', 'item'])
    def execute(self, ud):
        msg = fifo.get(block=True)

        ud.goal = msg.goal
        ud.item = msg.item
        return 'set_goal'

class SetGoal(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes = ['goal_reached', 'error'], input_keys = ['goal', 'item'], output_keys = ['goal', 'item'])
    def execute(self, ud):
        speak("ok boss")
        rospy.loginfo('[SetGoal] goal = {} with item = {}'.format(ud.goal, ud.item))

        move(0.0, 0.0)
        msg = rospy.wait_for_message("/move_base/result", MoveBaseActionResult, timeout=MOVEMENT_TIMEOUT)

        if msg.status.status == 3:
            return 'goal_reached'
        else:
            return 'error'

class Dispense(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes = ['dispensed', 'error'], input_keys = ['goal','item'], output_keys = ['goal'])
    def execute(self, ud):
        speak("ordering your item")
        rospy.loginfo('[Dispense] goal = {} with item = {}'.format(ud.goal, ud.item))

        dispenser.req(ud.item)
        if dispenser.ack():
          return 'dispensed'
        else:
          return 'error'

class Deliver(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes = ['goal_reached', 'error'], input_keys = ['goal'])
    def execute(self, ud):
        speak("here I come")
        rospy.loginfo('[Deliver] goal = {}'.format(ud.goal))

        move(*ud.goal)
        msg = rospy.wait_for_message("/move_base/result", MoveBaseActionResult, timeout=MOVEMENT_TIMEOUT)

        if msg.status.status == 3:
          rospy.sleep(5.0)
          return 'goal_reached'
        else:
          return 'error'

class Return(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes = ['goal_reached', 'error'])
    def execute(self, ud):
        speak("I'm going home!")
        rospy.loginfo('[Return] Going home...')

        move(0.0, 0.0)
        msg = rospy.wait_for_message("/move_base/result", MoveBaseActionResult, timeout=MOVEMENT_TIMEOUT)

        if msg.status.status == 3:
          return 'goal_reached'
        else:
          rospy.loginfo('Return] Could not return... giving up...')
          return 'error'

def main():
    rospy.init_node('smach_movement_machine')
    rospy.Subscriber("/alfred_server/set_goal", ItemRequest, set_goal_callback)

    # Create a SMACH state machine
    sm = smach.StateMachine(outcomes=['succeeded'])
    sis = smach_ros.IntrospectionServer('server_name', sm, '/SM_ROOT')
    sis.start()

    # Open the container
    with sm:
        # Add states to the container
        smach.StateMachine.add('IDLE',     Idle(),     {'error':'RETURN', 'set_goal':     'SETGOAL'})
        smach.StateMachine.add('SETGOAL',  SetGoal(),  {'error':'RETURN', 'goal_reached': 'DISPENSE'})
        smach.StateMachine.add('DISPENSE', Dispense(), {'error':'RETURN', 'dispensed':    'DELIVER'})
        smach.StateMachine.add('DELIVER',  Deliver(),  {'error':'RETURN', 'goal_reached': 'RETURN'})
        smach.StateMachine.add('RETURN',   Return(),   {'error':'IDLE',   'goal_reached': 'IDLE'})

    # Execute SMACH plan
    outcome = sm.execute()

def signal_handler(signal, frame):
    sys.exit(0)

if __name__ == "__main__":
    signal.signal(signal.SIGINT, signal_handler)
    main()

