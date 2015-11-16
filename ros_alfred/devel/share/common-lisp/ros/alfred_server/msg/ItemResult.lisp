; Auto-generated. Do not edit!


(cl:in-package alfred_server-msg)


;//! \htmlinclude ItemResult.msg.html

(cl:defclass <ItemResult> (roslisp-msg-protocol:ros-message)
  ((dispensed
    :reader dispensed
    :initarg :dispensed
    :type cl:fixnum
    :initform 0)
   (error
    :reader error
    :initarg :error
    :type cl:string
    :initform "")
   (uid
    :reader uid
    :initarg :uid
    :type cl:integer
    :initform 0))
)

(cl:defclass ItemResult (<ItemResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ItemResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ItemResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name alfred_server-msg:<ItemResult> is deprecated: use alfred_server-msg:ItemResult instead.")))

(cl:ensure-generic-function 'dispensed-val :lambda-list '(m))
(cl:defmethod dispensed-val ((m <ItemResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alfred_server-msg:dispensed-val is deprecated.  Use alfred_server-msg:dispensed instead.")
  (dispensed m))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <ItemResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alfred_server-msg:error-val is deprecated.  Use alfred_server-msg:error instead.")
  (error m))

(cl:ensure-generic-function 'uid-val :lambda-list '(m))
(cl:defmethod uid-val ((m <ItemResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader alfred_server-msg:uid-val is deprecated.  Use alfred_server-msg:uid instead.")
  (uid m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ItemResult>) ostream)
  "Serializes a message object of type '<ItemResult>"
  (cl:let* ((signed (cl:slot-value msg 'dispensed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'uid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'uid)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ItemResult>) istream)
  "Deserializes a message object of type '<ItemResult>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dispensed) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'error) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'uid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'uid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'uid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'uid)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ItemResult>)))
  "Returns string type for a message object of type '<ItemResult>"
  "alfred_server/ItemResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ItemResult)))
  "Returns string type for a message object of type 'ItemResult"
  "alfred_server/ItemResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ItemResult>)))
  "Returns md5sum for a message object of type '<ItemResult>"
  "b07242a1ff28014216fedf5e24fe3ffb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ItemResult)))
  "Returns md5sum for a message object of type 'ItemResult"
  "b07242a1ff28014216fedf5e24fe3ffb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ItemResult>)))
  "Returns full string definition for message of type '<ItemResult>"
  (cl:format cl:nil "int8 dispensed~%string error~%uint32 uid~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ItemResult)))
  "Returns full string definition for message of type 'ItemResult"
  (cl:format cl:nil "int8 dispensed~%string error~%uint32 uid~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ItemResult>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'error))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ItemResult>))
  "Converts a ROS message object to a list"
  (cl:list 'ItemResult
    (cl:cons ':dispensed (dispensed msg))
    (cl:cons ':error (error msg))
    (cl:cons ':uid (uid msg))
))
