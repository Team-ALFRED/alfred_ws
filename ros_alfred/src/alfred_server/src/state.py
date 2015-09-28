#!/usr/bin/env python
"""
Description:
    Create a two-state state machine where one state writes to userdata and
    the other state reads from userdata, and spews a message to rosout.

Usage:
    $> ./user_data.py

Output:
    [INFO] : State machine starting in initial state 'SET' with userdata: 
        []
    [INFO] : State machine transitioning 'SET':'set_it'-->'GET'
    [INFO] : >>> GOT DATA! x = True
    [INFO] : State machine terminating 'GET':'got_it':'succeeded'
"""

import roslib; roslib.load_manifest('smach_tutorials')
import rospy
import smach
import smach_ros

class Idle(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes = ['set_goal', 'error'], output_keys = ['goal'])
    def execute(self, ud):
        # listen for msg from server
        ud.goal = (10.0, 12.5)
        return 'set_goal'

class SetGoal(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes = ['goal_reached', 'error'], input_keys = ['goal'], output_keys = ['goal'])
    def execute(self, ud):
        rospy.loginfo('[SetGoal] goal = '+str(ud.goal))
        # set goal and wait for us to get there
        rospy.sleep(2.0)
        return 'goal_reached'

class Dispense(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes = ['dispensed', 'error'], input_keys = ['goal'], output_keys = ['goal'])
    def execute(self, ud):
        rospy.loginfo('[Dispense] goal = '+str(ud.goal))
        rospy.sleep(5.0)
        return 'dispensed'

class Deliver(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes = ['goal_reached', 'error'], input_keys = ['goal'])
    def execute(self, ud):
        rospy.loginfo('[Deliver] goal = '+str(ud.goal))
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
        smach.StateMachine.add('SET', Setter(), {'set_it':'GET'})
        smach.StateMachine.add('GET', Getter(), {'got_it':'succeeded'})

    # Execute SMACH plan
    outcome = sm.execute()

if __name__ == '__main__':
    main()
