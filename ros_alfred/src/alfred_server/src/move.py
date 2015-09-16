#!/usr/bin/python
from actionlib.action_client import *
from move_base_msgs.msg import *

rospy.init_node('move_base_client')
ac = ActionClient('move_base', MoveBaseAction)
ac.wait_for_server()

goal = MoveBaseGoal()

goal.target_pose.pose.position.x = 0.0
goal.target_pose.pose.position.y = 0.0
goal.target_pose.pose.orientation.w = 1.0

goal.target_pose.header.frame_id = 'map'

ac.send_goal(goal)
ac.wait_for_server()

