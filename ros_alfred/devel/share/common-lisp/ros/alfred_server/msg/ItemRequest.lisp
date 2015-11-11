; Auto-generated. Do not edit!


(cl:in-package alfred_server-msg)


;//! \htmlinclude ItemRequest.msg.html

(cl:defclass <ItemRequest> (roslisp-msg-protocol:ros-message)
  ((item
    :reader item
    :initarg :item
    :type cl:string
    :initform "")
   (goal
    :reader goal
    :initarg :goal
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (uid
    :reader uid
    :initarg :uid
    :type cl:integer
    :initform 0))
)

(cl:defclass ItemRequest (<ItemRequest>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ItemRequest>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ItemRequest)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name alfred_server-msg:<ItemRequest> is deprecated: use alfred_server-msg:ItemRequest instead.")))

(cl:ensure-generic-function 'item-val :lambda-list '(m))
(cl:defmethod item-val ((m <ItemRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alfred_server-msg:item-val is deprecated.  Use alfred_server-msg:item instead.")
  (item m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <ItemRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alfred_server-msg:goal-val is deprecated.  Use alfred_server-msg:goal instead.")
  (goal m))

(cl:ensure-generic-function 'uid-val :lambda-list '(m))
(cl:defmethod uid-val ((m <ItemRequest>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alfred_server-msg:uid-val is deprecated.  Use alfred_server-msg:uid instead.")
  (uid m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ItemRequest>) ostream)
  "Serializes a message object of type '<ItemRequest>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'item))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'item))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'goal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'goal))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'uid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'uid)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ItemRequest>) istream)
  "Deserializes a message object of type '<ItemRequest>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'item) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'item) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'goal) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'goal)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'uid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'uid)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ItemRequest>)))
  "Returns string type for a message object of type '<ItemRequest>"
  "alfred_server/ItemRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ItemRequest)))
  "Returns string type for a message object of type 'ItemRequest"
  "alfred_server/ItemRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ItemRequest>)))
  "Returns md5sum for a message object of type '<ItemRequest>"
  "d873a8a72ebd09beb386e3eb9ef262fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ItemRequest)))
  "Returns md5sum for a message object of type 'ItemRequest"
  "d873a8a72ebd09beb386e3eb9ef262fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ItemRequest>)))
  "Returns full string definition for message of type '<ItemRequest>"
  (cl:format cl:nil "string item~%float64[] goal~%uint32 uid~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ItemRequest)))
  "Returns full string definition for message of type 'ItemRequest"
  (cl:format cl:nil "string item~%float64[] goal~%uint32 uid~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ItemRequest>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'item))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'goal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ItemRequest>))
  "Converts a ROS message object to a list"
  (cl:list 'ItemRequest
    (cl:cons ':item (item msg))
    (cl:cons ':goal (goal msg))
    (cl:cons ':uid (uid msg))
))
