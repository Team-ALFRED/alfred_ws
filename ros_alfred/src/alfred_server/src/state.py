#!/usr/bin/env python

from actionlib.action_client import * 
from actionlib_msgs.msg import *
from move_base_msgs.msg import * 
from std_msgs.msg import *
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
pub = None

# /move_base/result
# 2 - goal cancelled
# 3 - goal reached
# 4 - no path found

def set_goal_callback(msg):
    rospy.loginfo("[Callback] Item request: [goal:{}, item:{}, uid:{}]".format(msg.goal, msg.item, msg.uid))
    fifo.put(msg)

def hard_stop_callback(msg):
    rospy.loginfo("Get hard stop request: {}".format(msg))

    hard_stop = rospy.Publisher('/move_base/cancel', GoalID, queue_size=10)
    hard_stop.publish(GoalID())

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
        smach.State.__init__(self, outcomes = ['set_goal', 'error'], output_keys = ['goal', 'item', 'uid'])
    def execute(self, ud):
        msg = fifo.get(block=True)

        ud.goal = msg.goal
        ud.item = msg.item
        ud.uid = msg.uid
        return 'set_goal'

class SetGoal(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes = ['goal_reached', 'error'], input_keys = ['goal', 'item', 'uid'], output_keys = ['goal', 'item', 'uid'])
    def execute(self, ud):
        speak("ok boss")
        rospy.loginfo('[SetGoal] goal:{}, item:{}, uid:{}'.format(ud.goal, ud.item, ud.uid))

        move(0.0, 0.0)
        msg = rospy.wait_for_message("/move_base/result", MoveBaseActionResult, timeout=MOVEMENT_TIMEOUT)

        if msg.status.status == 3:
            return 'goal_reached'
        else:
            res = ItemResult()
            res.dispensed = 0
            res.error = "Could not find valid delivery path"
            pub.publish(res)
            return 'error'

class Dispense(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes = ['dispensed', 'error'], input_keys = ['goal','item', 'uid'], output_keys = ['goal', 'uid'])
    def execute(self, ud):
        speak("ordering your item")
        rospy.loginfo('[Dispense] goal:{}, item:{}, uid:{}'.format(ud.goal, ud.item, ud.uid))

        dispenser.req(ud.item)
        if dispenser.ack():
          return 'dispensed'
        else:
          res = ItemResult()
          res.dispensed = 0
          res.error = "Could not dispense item"
          pub.publish(res)
          return 'error'

class Deliver(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes = ['goal_reached', 'error'], input_keys = ['goal', 'uid'])
    def execute(self, ud):
        speak("here I come")
        rospy.loginfo('[Deliver] goal:{}, uid:{}'.format(ud.goal, ud.uid))

        move(*ud.goal)
        msg = rospy.wait_for_message("/move_base/result", MoveBaseActionResult, timeout=MOVEMENT_TIMEOUT)

        if msg.status.status == 3:
          res = ItemResult()
          res.dispensed = 1
          res.uid = ud.uid
          res.error = ""
          pub.publish(res)

          rospy.sleep(5.0)
          return 'goal_reached'
        else:
          res = ItemResult()
          res.dispensed = 1
          res.uid = ud.uid
          res.error = "Could not find valid delivery path"
          pub.publish(res)
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
    global pub

    rospy.init_node('smach_movement_machine')
    rospy.Subscriber("/alfred_server/set_goal", ItemRequest, set_goal_callback)
    rospy.Subscriber("/alfred_server/hard_stop", String, hard_stop_callback)
    pub = rospy.Publisher('/alfred_server/result', ItemResult, queue_size=10)

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

