; Auto-generated. Do not edit!


(cl:in-package bwi_kr_execution-msg)


;//! \htmlinclude ExecutePlanAction.msg.html

(cl:defclass <ExecutePlanAction> (roslisp-msg-protocol:ros-message)
  ((action_goal
    :reader action_goal
    :initarg :action_goal
    :type bwi_kr_execution-msg:ExecutePlanActionGoal
    :initform (cl:make-instance 'bwi_kr_execution-msg:ExecutePlanActionGoal))
   (action_result
    :reader action_result
    :initarg :action_result
    :type bwi_kr_execution-msg:ExecutePlanActionResult
    :initform (cl:make-instance 'bwi_kr_execution-msg:ExecutePlanActionResult))
   (action_feedback
    :reader action_feedback
    :initarg :action_feedback
    :type bwi_kr_execution-msg:ExecutePlanActionFeedback
    :initform (cl:make-instance 'bwi_kr_execution-msg:ExecutePlanActionFeedback)))
)

(cl:defclass ExecutePlanAction (<ExecutePlanAction>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecutePlanAction>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecutePlanAction)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bwi_kr_execution-msg:<ExecutePlanAction> is deprecated: use bwi_kr_execution-msg:ExecutePlanAction instead.")))

(cl:ensure-generic-function 'action_goal-val :lambda-list '(m))
(cl:defmethod action_goal-val ((m <ExecutePlanAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bwi_kr_execution-msg:action_goal-val is deprecated.  Use bwi_kr_execution-msg:action_goal instead.")
  (action_goal m))

(cl:ensure-generic-function 'action_result-val :lambda-list '(m))
(cl:defmethod action_result-val ((m <ExecutePlanAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bwi_kr_execution-msg:action_result-val is deprecated.  Use bwi_kr_execution-msg:action_result instead.")
  (action_result m))

(cl:ensure-generic-function 'action_feedback-val :lambda-list '(m))
(cl:defmethod action_feedback-val ((m <ExecutePlanAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bwi_kr_execution-msg:action_feedback-val is deprecated.  Use bwi_kr_execution-msg:action_feedback instead.")
  (action_feedback m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecutePlanAction>) ostream)
  "Serializes a message object of type '<ExecutePlanAction>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_goal) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_result) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'action_feedback) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecutePlanAction>) istream)
  "Deserializes a message object of type '<ExecutePlanAction>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_goal) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_result) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'action_feedback) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecutePlanAction>)))
  "Returns string type for a message object of type '<ExecutePlanAction>"
  "bwi_kr_execution/ExecutePlanAction")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecutePlanAction)))
  "Returns string type for a message object of type 'ExecutePlanAction"
  "bwi_kr_execution/ExecutePlanAction")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecutePlanAction>)))
  "Returns md5sum for a message object of type '<ExecutePlanAction>"
  "8262f837932420512276af1a2c985478")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecutePlanAction)))
  "Returns md5sum for a message object of type 'ExecutePlanAction"
  "8262f837932420512276af1a2c985478")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecutePlanAction>)))
  "Returns full string definition for message of type '<ExecutePlanAction>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%ExecutePlanActionGoal action_goal~%ExecutePlanActionResult action_result~%ExecutePlanActionFeedback action_feedback~%~%================================================================================~%MSG: bwi_kr_execution/ExecutePlanActionGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%ExecutePlanGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: bwi_kr_execution/ExecutePlanGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%AspRule[] aspGoal~%~%================================================================================~%MSG: bwi_kr_execution/AspRule~%AspFluent[] head~%AspFluent[] body~%~%================================================================================~%MSG: bwi_kr_execution/AspFluent~%string name~%string[] variables~%uint32 timeStep~%~%================================================================================~%MSG: bwi_kr_execution/ExecutePlanActionResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%ExecutePlanResult result~%~%================================================================================~%MSG: actionlib_msgs/GoalStatus~%GoalID goal_id~%uint8 status~%uint8 PENDING         = 0   # The goal has yet to be processed by the action server~%uint8 ACTIVE          = 1   # The goal is currently being processed by the action server~%uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing~%                            #   and has since completed its execution (Terminal State)~%uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)~%uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due~%                            #    to some failure (Terminal State)~%uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,~%                            #    because the goal was unattainable or invalid (Terminal State)~%uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing~%                            #    and has not yet completed execution~%uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,~%                            #    but the action server has not yet confirmed that the goal is canceled~%uint8 RECALLED        = 8   # The goal received a cancel request before it started executing~%                            #    and was successfully cancelled (Terminal State)~%uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be~%                            #    sent over the wire by an action server~%~%#Allow for the user to associate a string with GoalStatus for debugging~%string text~%~%~%================================================================================~%MSG: bwi_kr_execution/ExecutePlanResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%================================================================================~%MSG: bwi_kr_execution/ExecutePlanActionFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%ExecutePlanFeedback feedback~%~%================================================================================~%MSG: bwi_kr_execution/ExecutePlanFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecutePlanAction)))
  "Returns full string definition for message of type 'ExecutePlanAction"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%ExecutePlanActionGoal action_goal~%ExecutePlanActionResult action_result~%ExecutePlanActionFeedback action_feedback~%~%================================================================================~%MSG: bwi_kr_execution/ExecutePlanActionGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalID goal_id~%ExecutePlanGoal goal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: actionlib_msgs/GoalID~%# The stamp should store the time at which this goal was requested.~%# It is used by an action server when it tries to preempt all~%# goals that were requested before a certain time~%time stamp~%~%# The id provides a way to associate feedback and~%# result message with specific goal requests. The id~%# specified must be unique.~%string id~%~%~%================================================================================~%MSG: bwi_kr_execution/ExecutePlanGoal~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%AspRule[] aspGoal~%~%================================================================================~%MSG: bwi_kr_execution/AspRule~%AspFluent[] head~%AspFluent[] body~%~%================================================================================~%MSG: bwi_kr_execution/AspFluent~%string name~%string[] variables~%uint32 timeStep~%~%================================================================================~%MSG: bwi_kr_execution/ExecutePlanActionResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%ExecutePlanResult result~%~%================================================================================~%MSG: actionlib_msgs/GoalStatus~%GoalID goal_id~%uint8 status~%uint8 PENDING         = 0   # The goal has yet to be processed by the action server~%uint8 ACTIVE          = 1   # The goal is currently being processed by the action server~%uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing~%                            #   and has since completed its execution (Terminal State)~%uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)~%uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due~%                            #    to some failure (Terminal State)~%uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,~%                            #    because the goal was unattainable or invalid (Terminal State)~%uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing~%                            #    and has not yet completed execution~%uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,~%                            #    but the action server has not yet confirmed that the goal is canceled~%uint8 RECALLED        = 8   # The goal received a cancel request before it started executing~%                            #    and was successfully cancelled (Terminal State)~%uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be~%                            #    sent over the wire by an action server~%~%#Allow for the user to associate a string with GoalStatus for debugging~%string text~%~%~%================================================================================~%MSG: bwi_kr_execution/ExecutePlanResult~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%================================================================================~%MSG: bwi_kr_execution/ExecutePlanActionFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%Header header~%actionlib_msgs/GoalStatus status~%ExecutePlanFeedback feedback~%~%================================================================================~%MSG: bwi_kr_execution/ExecutePlanFeedback~%# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecutePlanAction>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_goal))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_result))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'action_feedback))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecutePlanAction>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecutePlanAction
    (cl:cons ':action_goal (action_goal msg))
    (cl:cons ':action_result (action_result msg))
    (cl:cons ':action_feedback (action_feedback msg))
))
