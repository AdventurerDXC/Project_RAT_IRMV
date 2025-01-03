; Auto-generated. Do not edit!


(cl:in-package penu-msg)


;//! \htmlinclude PreCmd.msg.html

(cl:defclass <PreCmd> (roslisp-msg-protocol:ros-message)
  ((pre_cmd1
    :reader pre_cmd1
    :initarg :pre_cmd1
    :type cl:fixnum
    :initform 0)
   (pre_cmd2
    :reader pre_cmd2
    :initarg :pre_cmd2
    :type cl:fixnum
    :initform 0)
   (pre_cmd3
    :reader pre_cmd3
    :initarg :pre_cmd3
    :type cl:fixnum
    :initform 0)
   (pre_cmd4
    :reader pre_cmd4
    :initarg :pre_cmd4
    :type cl:fixnum
    :initform 0))
)

(cl:defclass PreCmd (<PreCmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PreCmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PreCmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name penu-msg:<PreCmd> is deprecated: use penu-msg:PreCmd instead.")))

(cl:ensure-generic-function 'pre_cmd1-val :lambda-list '(m))
(cl:defmethod pre_cmd1-val ((m <PreCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader penu-msg:pre_cmd1-val is deprecated.  Use penu-msg:pre_cmd1 instead.")
  (pre_cmd1 m))

(cl:ensure-generic-function 'pre_cmd2-val :lambda-list '(m))
(cl:defmethod pre_cmd2-val ((m <PreCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader penu-msg:pre_cmd2-val is deprecated.  Use penu-msg:pre_cmd2 instead.")
  (pre_cmd2 m))

(cl:ensure-generic-function 'pre_cmd3-val :lambda-list '(m))
(cl:defmethod pre_cmd3-val ((m <PreCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader penu-msg:pre_cmd3-val is deprecated.  Use penu-msg:pre_cmd3 instead.")
  (pre_cmd3 m))

(cl:ensure-generic-function 'pre_cmd4-val :lambda-list '(m))
(cl:defmethod pre_cmd4-val ((m <PreCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader penu-msg:pre_cmd4-val is deprecated.  Use penu-msg:pre_cmd4 instead.")
  (pre_cmd4 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PreCmd>) ostream)
  "Serializes a message object of type '<PreCmd>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pre_cmd1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pre_cmd1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pre_cmd2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pre_cmd2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pre_cmd3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pre_cmd3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pre_cmd4)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pre_cmd4)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PreCmd>) istream)
  "Deserializes a message object of type '<PreCmd>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pre_cmd1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pre_cmd1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pre_cmd2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pre_cmd2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pre_cmd3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pre_cmd3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'pre_cmd4)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'pre_cmd4)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PreCmd>)))
  "Returns string type for a message object of type '<PreCmd>"
  "penu/PreCmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PreCmd)))
  "Returns string type for a message object of type 'PreCmd"
  "penu/PreCmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PreCmd>)))
  "Returns md5sum for a message object of type '<PreCmd>"
  "21ac01ccfc8745d307c8c5b188f365f9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PreCmd)))
  "Returns md5sum for a message object of type 'PreCmd"
  "21ac01ccfc8745d307c8c5b188f365f9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PreCmd>)))
  "Returns full string definition for message of type '<PreCmd>"
  (cl:format cl:nil "# pressure control command~%uint16 pre_cmd1~%uint16 pre_cmd2~%uint16 pre_cmd3~%uint16 pre_cmd4~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PreCmd)))
  "Returns full string definition for message of type 'PreCmd"
  (cl:format cl:nil "# pressure control command~%uint16 pre_cmd1~%uint16 pre_cmd2~%uint16 pre_cmd3~%uint16 pre_cmd4~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PreCmd>))
  (cl:+ 0
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PreCmd>))
  "Converts a ROS message object to a list"
  (cl:list 'PreCmd
    (cl:cons ':pre_cmd1 (pre_cmd1 msg))
    (cl:cons ':pre_cmd2 (pre_cmd2 msg))
    (cl:cons ':pre_cmd3 (pre_cmd3 msg))
    (cl:cons ':pre_cmd4 (pre_cmd4 msg))
))
