#!/usr/bin/env python
import roslib; roslib.load_manifest('teleop_twist_keyboard')
import rospy

from geometry_msgs.msg import Twist

import sys, select, termios, tty

msg = """
Reading from the keyboard  and Publishing to Twist!
---------------------------
Moving around:
   u    i    o
   j    k    l
   m    ,    .

w/s : increase/decrease only linear speed by 10%
a/d : increase/decrease only angular speed by 10%
q/e : increase/decrease max speeds by 10%
 h  : for help

anything else : stop

CTRL-C to quit
"""

moveBindings = {
		'i':(1,0),
		'o':(.5,-.5),
		'j':(0,.25),
		'l':(0,-.25),
		'u':(.5,.5),
		',':(-.5,0),
		'.':(-.5,.5),
		'm':(-.5,-.5),
	       }

speedBindings={
		'q':(1.1,1.1),
		'e':(.9,.9),
		'w':(1.1,1),
		's':(.9,1),
		'a':(1,1.1),
		'd':(1,.9),
	      }

helpBinding={ 'h':(1), }

#ry:
# from sensor_msgs.msg import Joy
#xcept ImportError:
# from joy.msg import Joy

def getKey():
	tty.setraw(sys.stdin.fileno())
	select.select([sys.stdin], [], [], 0)
	key = sys.stdin.read(1)
	termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
	return key

speed = .25
turn = .25

def vels(speed,turn):
	return "currently:\tspeed %s\tturn %s " % (speed,turn)

# def joyCallback(joy):
#   "invoked every time a joystick message arrives"
#   rospy.logdebug('joystick input:\n' + str(joy))

if __name__=="__main__":
  settings = termios.tcgetattr(sys.stdin)
pub = rospy.Publisher('cmd_vel_safe', Twist, queue_size=10)
rospy.init_node('teleop_twist_keyboard')
#oy = rospy.Subscriber('joy', Joy, joyCallback)

x = 0
th = 0
status = 0

try:
  print msg
  print vels(speed,turn)
  while(1):
#   if joy.buttons[1]:
#     print "yes"
    key = getKey()
    if key in moveBindings.keys():
      x = moveBindings[key][0]
      th = moveBindings[key][1]
    else:
      x = 0
      th = 0
      if (key == '\x03'):
        break
    if key in speedBindings.keys():
      speed = speed * speedBindings[key][0]
      turn = turn * speedBindings[key][1]
      print vels(speed,turn)
    elif key in helpBinding.keys():
      print msg      
    else:
      twist = Twist()
      twist.linear.x = x*speed; twist.linear.y = 0; twist.linear.z = 0
      twist.angular.x = 0; twist.angular.y = 0; twist.angular.z = th*turn
      pub.publish(twist)

except:
	print e

finally:
  twist = Twist()
  twist.linear.x = 0; twist.linear.y = 0; twist.linear.z = 0
  twist.angular.x = 0; twist.angular.y = 0; twist.angular.z = 0
  pub.publish(twist)
  termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)


