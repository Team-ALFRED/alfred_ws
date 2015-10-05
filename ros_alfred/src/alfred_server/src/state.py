#!/usr/bin/env python

import roslib; 
import rospy
import smach
import smach_ros

class Idle(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes = ['set_goal', 'error'], output_keys = ['goal', 'item'])
    def execute(self, ud):
        # listen for msg from server
        rospy.sleep(2.0)
        ud.goal = (10.0, 12.5)
        ud.item = 'water'
        return 'set_goal'

class SetGoal(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes = ['goal_reached', 'error'], input_keys = ['goal', 'item'], output_keys = ['goal', 'item'])
    def execute(self, ud):
        rospy.loginfo('[SetGoal] goal = {} with item = {}'.format(ud.goal, ud.item))
        # set goal and wait for us to get there
        rospy.sleep(2.0)
        return 'goal_reached'

class Dispense(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes = ['dispensed', 'error'], input_keys = ['goal','item'], output_keys = ['goal'])
    def execute(self, ud):
        rospy.loginfo('[Dispense] goal = {} with item = {}'.format(ud.goal, ud.item))
        rospy.sleep(5.0)
        return 'dispensed'

class Deliver(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes = ['goal_reached', 'error'], input_keys = ['goal'])
    def execute(self, ud):
        rospy.loginfo('[Deliver] goal = {}'.format(ud.goal))
        rospy.sleep(2.0)
        return 'goal_reached'

class Return(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes = ['goal_reached', 'error'])
    def execute(self, ud):
        rospy.loginfo('[Return] Going home...')
        rospy.sleep(2.0)
        return 'goal_reached'

def main():
    rospy.init_node('smach_movement_machine')

    # Create a SMACH state machine
    sm = smach.StateMachine(outcomes=['succeeded'])

    # Open the container
    with sm:
        # Add states to the container
        smach.StateMachine.add('IDLE',     Idle(),     {'error':'RETURN', 'set_goal':     'SETGOAL'})
        smach.StateMachine.add('SETGOAL',  SetGoal(),  {'error':'RETURN', 'goal_reached': 'DISPENSE'})
        smach.StateMachine.add('DISPENSE', Dispense(), {'error':'RETURN', 'dispensed':    'DELIVER'})
        smach.StateMachine.add('DELIVER',  Deliver(),  {'error':'RETURN', 'goal_reached': 'RETURN'})
        smach.StateMachine.add('RETURN',   Return(),   {'error':'RETURN', 'goal_reached': 'IDLE'})

    # Execute SMACH plan
    outcome = sm.execute()

if __name__ == '__main__':
    main()
