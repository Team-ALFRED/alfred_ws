#!/usr/bin/python
from actionlib.action_client import *
from move_base_msgs.msg import *

rospy.init_node('move_base_client')
ac = ActionClient('move_base', MoveBaseAction)
ac.wait_for_server()
rospy.loginfo("Got move_base client")

goal = MoveBaseGoal()
goal.target_pose.pose.position.x = 0.0
goal.target_pose.pose.position.y = 0.0
goal.target_pose.pose.orientation.w = 1.0
goal.target_pose.header.frame_id = 'map'

rospy.loginfo("Sending goal")
ac.send_goal(goal)
ac.wait_for_server()
rospy.loginfo("Goal reached")
