; Auto-generated. Do not edit!


(cl:in-package penu-msg)


;//! \htmlinclude LenCmd.msg.html

(cl:defclass <LenCmd> (roslisp-msg-protocol:ros-message)
  ((len_cmd1
    :reader len_cmd1
    :initarg :len_cmd1
    :type cl:fixnum
    :initform 0)
   (len_cmd2
    :reader len_cmd2
    :initarg :len_cmd2
    :type cl:fixnum
    :initform 0)
   (len_cmd3
    :reader len_cmd3
    :initarg :len_cmd3
    :type cl:fixnum
    :initform 0)
   (len_cmd4
    :reader len_cmd4
    :initarg :len_cmd4
    :type cl:fixnum
    :initform 0))
)

(cl:defclass LenCmd (<LenCmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LenCmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LenCmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name penu-msg:<LenCmd> is deprecated: use penu-msg:LenCmd instead.")))

(cl:ensure-generic-function 'len_cmd1-val :lambda-list '(m))
(cl:defmethod len_cmd1-val ((m <LenCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader penu-msg:len_cmd1-val is deprecated.  Use penu-msg:len_cmd1 instead.")
  (len_cmd1 m))

(cl:ensure-generic-function 'len_cmd2-val :lambda-list '(m))
(cl:defmethod len_cmd2-val ((m <LenCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader penu-msg:len_cmd2-val is deprecated.  Use penu-msg:len_cmd2 instead.")
  (len_cmd2 m))

(cl:ensure-generic-function 'len_cmd3-val :lambda-list '(m))
(cl:defmethod len_cmd3-val ((m <LenCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader penu-msg:len_cmd3-val is deprecated.  Use penu-msg:len_cmd3 instead.")
  (len_cmd3 m))

(cl:ensure-generic-function 'len_cmd4-val :lambda-list '(m))
(cl:defmethod len_cmd4-val ((m <LenCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader penu-msg:len_cmd4-val is deprecated.  Use penu-msg:len_cmd4 instead.")
  (len_cmd4 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LenCmd>) ostream)
  "Serializes a message object of type '<LenCmd>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'len_cmd1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'len_cmd1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'len_cmd2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'len_cmd2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'len_cmd3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'len_cmd3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'len_cmd4)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'len_cmd4)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LenCmd>) istream)
  "Deserializes a message object of type '<LenCmd>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'len_cmd1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'len_cmd1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'len_cmd2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'len_cmd2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'len_cmd3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'len_cmd3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'len_cmd4)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'len_cmd4)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LenCmd>)))
  "Returns string type for a message object of type '<LenCmd>"
  "penu/LenCmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LenCmd)))
  "Returns string type for a message object of type 'LenCmd"
  "penu/LenCmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LenCmd>)))
  "Returns md5sum for a message object of type '<LenCmd>"
  "0df90e8fef6c46a006fc379e47a36ad2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LenCmd)))
  "Returns md5sum for a message object of type 'LenCmd"
  "0df90e8fef6c46a006fc379e47a36ad2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LenCmd>)))
  "Returns full string definition for message of type '<LenCmd>"
  (cl:format cl:nil "# length control command~%uint16 len_cmd1~%uint16 len_cmd2~%uint16 len_cmd3~%uint16 len_cmd4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LenCmd)))
  "Returns full string definition for message of type 'LenCmd"
  (cl:format cl:nil "# length control command~%uint16 len_cmd1~%uint16 len_cmd2~%uint16 len_cmd3~%uint16 len_cmd4~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LenCmd>))
  (cl:+ 0
     2
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LenCmd>))
  "Converts a ROS message object to a list"
  (cl:list 'LenCmd
    (cl:cons ':len_cmd1 (len_cmd1 msg))
    (cl:cons ':len_cmd2 (len_cmd2 msg))
    (cl:cons ':len_cmd3 (len_cmd3 msg))
    (cl:cons ':len_cmd4 (len_cmd4 msg))
))
