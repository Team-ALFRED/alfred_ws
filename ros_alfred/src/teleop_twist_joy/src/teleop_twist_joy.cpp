/**
Software License Agreement (BSD)

\authors   Mike Purvis <mpurvis@clearpathrobotics.com>
\copyright Copyright (c) 2014, Clearpath Robotics, Inc., All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that
the following conditions are met:
 * Redistributions of source code must retain the above copyright notice, this list of conditions and the
   following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the
   following disclaimer in the documentation and/or other materials provided with the distribution.
 * Neither the name of Clearpath Robotics nor the names of its contributors may be used to endorse or promote
   products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WAR-
RANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, IN-
DIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#include "geometry_msgs/Twist.h"
#include "ros/ros.h"
#include "sensor_msgs/Joy.h"
#include "teleop_twist_joy/teleop_twist_joy.h"

#include <map>
#include <string>


namespace teleop_twist_joy
{
/**
 * Internal members of class. This is the pimpl idiom, and allows more flexibility in adding
 * parameters later without breaking ABI compatibility, for robots which link TeleopTwistJoy
 * directly into base nodes.
 */
struct TeleopTwistJoy::Impl
{
  void joyCallback(const sensor_msgs::Joy::ConstPtr& joy);

  ros::Subscriber joy_sub;
  ros::Publisher cmd_vel_pub;

  int enable_button;
  int enable_turbo_button;
  int left_button;
  int right_button;
  int forward_button;
  int backward_button;
  int help_button;
  int linear_increase_button;
  int linear_decrease_button;
  int angular_increase_button;
  int angular_decrease_button;

  double linear_start_speed; 
  double angular_start_speed; 

  std::map<int, double> move_bindings_map;
  std::map<int, double> speed_bindings_map;  

  std::map<std::string, int> axis_linear_map;
  std::map<std::string, double> scale_linear_map;
  std::map<std::string, double> scale_linear_turbo_map;

  std::map<std::string, int> axis_angular_map;
  std::map<std::string, double> scale_angular_map;
  std::map<std::string, double> scale_angular_turbo_map;

  bool sent_disable_msg;
};

//Usage message
const char *text =
"\nPS3 CONTROLS FOR ALFRED\n"
"------------------------\n"
"D-Pad Controls Movement:\n"
"        [Forw]\n"
"\n"
"  [Left]      [Right]\n"
"\n"
"        [Back]\n"
"------------------------\n"
"Triangle : Increase Linear Speed\n"
"X        : Decrease Linear Speed\n"
"Square   : Increase Angular Speed\n"
"Circle   : Decrease Angular Speed\n"
"Start    : Help\n"
"------------------------\n"
"Anything Else : Stop\n"
"------------------------\n" 
"CTRL-C to quit\n"
"------------------------\n";

/**
 * Constructs TeleopTwistJoy.
 * \param nh NodeHandle to use for setting up the publisher and subscriber.
 * \param nh_param NodeHandle to use for searching for configuration parameters.
 */
TeleopTwistJoy::TeleopTwistJoy(ros::NodeHandle* nh, ros::NodeHandle* nh_param)
{
  pimpl_ = new Impl;

  pimpl_->cmd_vel_pub = nh->advertise<geometry_msgs::Twist>("cmd_vel", 1, true);
  pimpl_->joy_sub = nh->subscribe<sensor_msgs::Joy>("joy", 1, &TeleopTwistJoy::Impl::joyCallback, pimpl_);

  nh_param->getParam("linear_start_speed", pimpl_->linear_start_speed);
  nh_param->getParam("angular_start_speed", pimpl_->angular_start_speed);
  nh_param->getParam("enable_button", pimpl_->enable_button);
  nh_param->getParam("enable_turbo_button", pimpl_->enable_turbo_button);
  nh_param->getParam("left_button", pimpl_->left_button);
  nh_param->getParam("right_button", pimpl_->right_button);
  nh_param->getParam("forward_button", pimpl_->forward_button);
  nh_param->getParam("backward_button", pimpl_->backward_button);
  nh_param->getParam("help_button", pimpl_->help_button);
  nh_param->getParam("linear_increase_button", pimpl_->linear_increase_button);
  nh_param->getParam("linear_decrease_button", pimpl_->linear_decrease_button);
  nh_param->getParam("angular_increase_button", pimpl_->angular_increase_button);
  nh_param->getParam("angular_decrease_button", pimpl_->angular_decrease_button);

  pimpl_->move_bindings_map[pimpl_->forward_button] = pimpl_->linear_start_speed; 
  pimpl_->move_bindings_map[pimpl_->backward_button] = (pimpl_->linear_start_speed * -1);
  pimpl_->move_bindings_map[pimpl_->left_button] = pimpl_->angular_start_speed;
  pimpl_->move_bindings_map[pimpl_->right_button] = (pimpl_->angular_start_speed * -1);

  pimpl_->speed_bindings_map[pimpl_->linear_increase_button] = 1.001;
  pimpl_->speed_bindings_map[pimpl_->linear_decrease_button] = 0.009;
  pimpl_->speed_bindings_map[pimpl_->angular_increase_button] = 1.001;
  pimpl_->speed_bindings_map[pimpl_->angular_decrease_button] = 0.009;

  if (nh_param->getParam("axis_linear", pimpl_->axis_linear_map))
  {
    nh_param->getParam("axis_linear", pimpl_->axis_linear_map);
    nh_param->getParam("scale_linear", pimpl_->scale_linear_map);
    nh_param->getParam("scale_linear_turbo", pimpl_->scale_linear_turbo_map);
  }
  else
  {
    nh_param->param<int>("axis_linear", pimpl_->axis_linear_map["x"], 1);
    nh_param->param<double>("scale_linear", pimpl_->scale_linear_map["x"], 0.5);
    nh_param->param<double>("scale_linear_turbo", pimpl_->scale_linear_turbo_map["x"], 1.0);
  }

  if (nh_param->getParam("axis_angular", pimpl_->axis_angular_map))
  {
    nh_param->getParam("axis_angular", pimpl_->axis_angular_map);
    nh_param->getParam("scale_angular", pimpl_->scale_angular_map);
  }
  else
  {
    nh_param->param<int>("axis_angular", pimpl_->axis_angular_map["yaw"], 0);
    nh_param->param<double>("scale_angular", pimpl_->scale_angular_map["yaw"], 0.5);
    nh_param->param<double>("scale_angular_turbo",
        pimpl_->scale_angular_turbo_map["yaw"], pimpl_->scale_angular_map["yaw"]);
  }

  //ROS_INFO_NAMED("TeleopTwistJoy", "Teleop enable button %i.", pimpl_->enable_button);
  //ROS_INFO_COND_NAMED(pimpl_->enable_turbo_button >= 0, "TeleopTwistJoy",
  //    "Turbo on button %i.", pimpl_->enable_turbo_button);

  for (std::map<std::string, int>::iterator it = pimpl_->axis_linear_map.begin();
      it != pimpl_->axis_linear_map.end(); ++it)
  {
    //ROS_INFO_NAMED("TeleopTwistJoy", "Linear axis %s on %i at scale %f.",
    //it->first.c_str(), it->second, pimpl_->scale_linear_map[it->first]);
    //ROS_INFO_COND_NAMED(pimpl_->enable_turbo_button >= 0, "TeleopTwistJoy",
    //    "Turbo for linear axis %s is scale %f.", it->first.c_str(), pimpl_->scale_linear_turbo_map[it->first]);
  }

  for (std::map<std::string, int>::iterator it = pimpl_->axis_angular_map.begin();
      it != pimpl_->axis_angular_map.end(); ++it)
  {
    //ROS_INFO_NAMED("TeleopTwistJoy", "Angular axis %s on %i at scale %f.",
    //it->first.c_str(), it->second, pimpl_->scale_angular_map[it->first]);
  }

  pimpl_->sent_disable_msg = false;
  //print startup message
  printf("%s", text);
  std::cout << "\nCurrent Speeds: Linear_Speed: " << pimpl_->move_bindings_map[pimpl_->forward_button] 
            << "  Angular_Speed: " << pimpl_->move_bindings_map[pimpl_->left_button] << "\n";
}
  
void TeleopTwistJoy::Impl::joyCallback(const sensor_msgs::Joy::ConstPtr& joy_msg)
{
  // Initializes with zeros by default.
  geometry_msgs::Twist cmd_vel_msg;
  if (joy_msg->buttons[help_button]) 
  {
    //print startup message
    printf("%s", text);
  }
  else if (joy_msg->buttons[linear_increase_button]) 
  {
    move_bindings_map[forward_button] = move_bindings_map[forward_button] * speed_bindings_map[linear_increase_button];
std::cout << "\nCurrent Speeds: Linear_Speed: " << move_bindings_map[forward_button] 
              << "Angular_Speed: " << move_bindings_map[left_button] << "\n";
  } 
  else if (joy_msg->buttons[linear_decrease_button])
  {
    move_bindings_map[backward_button] = move_bindings_map[backward_button] * speed_bindings_map[linear_decrease_button];
  }
  else if (joy_msg->buttons[angular_increase_button])
  {
    move_bindings_map[left_button] = move_bindings_map[left_button] * speed_bindings_map[angular_increase_button];
  }
  else if (joy_msg->buttons[angular_decrease_button])
  {
    move_bindings_map[right_button] = move_bindings_map[right_button] * speed_bindings_map[angular_decrease_button];
  }
  //move forward
  else if (joy_msg->buttons[forward_button]) 
  {
    cmd_vel_msg.linear.x = move_bindings_map[forward_button];   
  }  
  //move backwards
  else if (joy_msg->buttons[backward_button]) 
  {
    cmd_vel_msg.linear.x = move_bindings_map[backward_button];
  }
  //move left
  else if (joy_msg->buttons[left_button]) 
  {
    cmd_vel_msg.angular.z = move_bindings_map[left_button];
  }
  //move right
  else if (joy_msg->buttons[right_button]) 
  {
    cmd_vel_msg.angular.z = move_bindings_map[right_button];
  }
  else
  {
    // When enable button is released, immediately send a single no-motion command
    // in order to stop the robot.
    if (!sent_disable_msg)
    {
      cmd_vel_pub.publish(cmd_vel_msg);
      sent_disable_msg = true;
    }
  }
  cmd_vel_msg.linear.y = 0; 
  cmd_vel_msg.linear.z = 0;
  cmd_vel_msg.angular.x = 0;
  cmd_vel_msg.angular.y = 0;
  cmd_vel_pub.publish(cmd_vel_msg);
  sent_disable_msg = false; 
  if (joy_msg->buttons[linear_increase_button] || joy_msg->buttons[linear_decrease_button] ||
        joy_msg->buttons[angular_increase_button] || joy_msg->buttons[angular_decrease_button])
  {
    std::cout << "\nCurrent Speeds: Linear_Speed: " << move_bindings_map[forward_button] 
              << "Angular_Speed: " << move_bindings_map[left_button] << "\n";
  }
}
}  // namespace teleop_twist_joy
//if (enable_turbo_button >= 0 && joy_msg->buttons[enable_turbo_button])
//{
//  if (axis_linear_map.find("x") != axis_linear_map.end())
//  {
//    cmd_vel_msg.linear.x = joy_msg->axes[axis_linear_map["x"]] * scale_linear_turbo_map["x"];
//  }
//  if (axis_linear_map.find("y") != axis_linear_map.end())
//  {
//    cmd_vel_msg.linear.y = joy_msg->axes[axis_linear_map["y"]] * scale_linear_turbo_map["y"];
//  }
//  if  (axis_linear_map.find("z") != axis_linear_map.end())
//  {
//    cmd_vel_msg.linear.z = joy_msg->axes[axis_linear_map["z"]] * scale_linear_turbo_map["z"];
//  }
//  if  (axis_angular_map.find("yaw") != axis_angular_map.end())
//  {
//    cmd_vel_msg.angular.z = joy_msg->axes[axis_angular_map["yaw"]] * scale_angular_turbo_map["yaw"];
//  }
//  if  (axis_angular_map.find("pitch") != axis_angular_map.end())
//  {
//    cmd_vel_msg.angular.y = joy_msg->axes[axis_angular_map["pitch"]] * scale_angular_turbo_map["pitch"];
//  }
//  if  (axis_angular_map.find("roll") != axis_angular_map.end())
//  {
//    cmd_vel_msg.angular.x = joy_msg->axes[axis_angular_map["roll"]] * scale_angular_turbo_map["roll"];
//  }

//  cmd_vel_pub.publish(cmd_vel_msg);
//  sent_disable_msg = false;
//}
//else if (joy_msg->buttons[enable_button])
//{
//  if  (axis_linear_map.find("x") != axis_linear_map.end())
//  {
//    cmd_vel_msg.linear.x = joy_msg->axes[axis_linear_map["x"]] * scale_linear_map["x"];
//  }
//  if  (axis_linear_map.find("x") != axis_linear_map.end())
//  {
//    cmd_vel_msg.linear.y = joy_msg->axes[axis_linear_map["y"]] * scale_linear_map["y"];
//  }
//  if  (axis_linear_map.find("z") != axis_linear_map.end())
//  {
//    cmd_vel_msg.linear.z = joy_msg->axes[axis_linear_map["z"]] * scale_linear_map["z"];
//  }
//  if  (axis_angular_map.find("yaw") != axis_angular_map.end())
//  {
//    cmd_vel_msg.angular.z = joy_msg->axes[axis_angular_map["yaw"]] * scale_angular_map["yaw"];
//  }
//  if  (axis_angular_map.find("pitch") != axis_angular_map.end())
//  {
//    cmd_vel_msg.angular.y = joy_msg->axes[axis_angular_map["pitch"]] * scale_angular_map["pitch"];
//  }
//  if  (axis_angular_map.find("roll") != axis_angular_map.end())
//  {
//    cmd_vel_msg.angular.x = joy_msg->axes[axis_angular_map["roll"]] * scale_angular_map["roll"];
//  }

//  cmd_vel_pub.publish(cmd_vel_msg);
//  sent_disable_msg = false;
//}


