; Auto-generated. Do not edit!


(cl:in-package bwi_kr_execution-msg)


;//! \htmlinclude ExecutePlanFeedback.msg.html

(cl:defclass <ExecutePlanFeedback> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ExecutePlanFeedback (<ExecutePlanFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecutePlanFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecutePlanFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bwi_kr_execution-msg:<ExecutePlanFeedback> is deprecated: use bwi_kr_execution-msg:ExecutePlanFeedback instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecutePlanFeedback>) ostream)
  "Serializes a message object of type '<ExecutePlanFeedback>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecutePlanFeedback>) istream)
  "Deserializes a message object of type '<ExecutePlanFeedback>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecutePlanFeedback>)))
  "Returns string type for a message object of type '<ExecutePlanFeedback>"
  "bwi_kr_execution/ExecutePlanFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecutePlanFeedback)))
  "Returns string type for a message object of type 'ExecutePlanFeedback"
  "bwi_kr_execution/ExecutePlanFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecutePlanFeedback>)))
  "Returns md5sum for a message object of type '<ExecutePlanFeedback>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecutePlanFeedback)))
  "Returns md5sum for a message object of type 'ExecutePlanFeedback"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecutePlanFeedback>)))
  "Returns full string definition for message of type '<ExecutePlanFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecutePlanFeedback)))
  "Returns full string definition for message of type 'ExecutePlanFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecutePlanFeedback>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecutePlanFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecutePlanFeedback
))
