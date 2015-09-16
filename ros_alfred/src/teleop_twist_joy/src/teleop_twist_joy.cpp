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
    double decrease_speed;
    double increase_speed;

    bool sent_disable_msg;
    
    std::map<int, double> move_bindings_map;   
  };

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
    nh_param->getParam("decrease_speed", pimpl_->decrease_speed);
    nh_param->getParam("increase_speed", pimpl_->increase_speed);
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

    pimpl_->sent_disable_msg = false;

    //print startup message
    printf("%sCURRENT_SPEEDS: LINEAR_SPEED: %.2f  ANGULAR_SPEED: %.2f\n", text, pimpl_->move_bindings_map[pimpl_->forward_button], pimpl_->move_bindings_map[pimpl_->left_button]);
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
      move_bindings_map[forward_button] = move_bindings_map[forward_button] + increase_speed;
    } 
    else if (joy_msg->buttons[linear_decrease_button])
    {
     // move_bindings_map[backward_button] = move_bindings_map[backward_button] - decrease_speed;
      move_bindings_map[forward_button] = move_bindings_map[forward_button] - decrease_speed;
    }
    else if (joy_msg->buttons[angular_increase_button])
    {
      move_bindings_map[left_button] = move_bindings_map[left_button] + increase_speed;
      move_bindings_map[right_button] = move_bindings_map[right_button] - decrease_speed;
    }
    else if (joy_msg->buttons[angular_decrease_button])
    {
      move_bindings_map[right_button] = move_bindings_map[right_button] + decrease_speed;
      move_bindings_map[left_button] = move_bindings_map[left_button] - decrease_speed;
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
      printf("CURRENT_SPEEDS:  LINEAR_SPEED: %.2f  ANGULAR_SPEED: %.2f\n", move_bindings_map[forward_button], move_bindings_map[left_button]);
    }
  }
} 

