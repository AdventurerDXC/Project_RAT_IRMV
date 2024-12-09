; Auto-generated. Do not edit!


(cl:in-package inv_kinematics-msg)


;//! \htmlinclude servo_pos.msg.html

(cl:defclass <servo_pos> (roslisp-msg-protocol:ros-message)
  ((legID
    :reader legID
    :initarg :legID
    :type cl:integer
    :initform 0)
   (rollAng
    :reader rollAng
    :initarg :rollAng
    :type cl:float
    :initform 0.0)
   (pitchAng1
    :reader pitchAng1
    :initarg :pitchAng1
    :type cl:float
    :initform 0.0)
   (pitchAng2
    :reader pitchAng2
    :initarg :pitchAng2
    :type cl:float
    :initform 0.0))
)

(cl:defclass servo_pos (<servo_pos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <servo_pos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'servo_pos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name inv_kinematics-msg:<servo_pos> is deprecated: use inv_kinematics-msg:servo_pos instead.")))

(cl:ensure-generic-function 'legID-val :lambda-list '(m))
(cl:defmethod legID-val ((m <servo_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inv_kinematics-msg:legID-val is deprecated.  Use inv_kinematics-msg:legID instead.")
  (legID m))

(cl:ensure-generic-function 'rollAng-val :lambda-list '(m))
(cl:defmethod rollAng-val ((m <servo_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inv_kinematics-msg:rollAng-val is deprecated.  Use inv_kinematics-msg:rollAng instead.")
  (rollAng m))

(cl:ensure-generic-function 'pitchAng1-val :lambda-list '(m))
(cl:defmethod pitchAng1-val ((m <servo_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inv_kinematics-msg:pitchAng1-val is deprecated.  Use inv_kinematics-msg:pitchAng1 instead.")
  (pitchAng1 m))

(cl:ensure-generic-function 'pitchAng2-val :lambda-list '(m))
(cl:defmethod pitchAng2-val ((m <servo_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inv_kinematics-msg:pitchAng2-val is deprecated.  Use inv_kinematics-msg:pitchAng2 instead.")
  (pitchAng2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <servo_pos>) ostream)
  "Serializes a message object of type '<servo_pos>"
  (cl:let* ((signed (cl:slot-value msg 'legID)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'rollAng))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pitchAng1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pitchAng2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <servo_pos>) istream)
  "Deserializes a message object of type '<servo_pos>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'legID) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rollAng) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitchAng1) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitchAng2) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<servo_pos>)))
  "Returns string type for a message object of type '<servo_pos>"
  "inv_kinematics/servo_pos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'servo_pos)))
  "Returns string type for a message object of type 'servo_pos"
  "inv_kinematics/servo_pos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<servo_pos>)))
  "Returns md5sum for a message object of type '<servo_pos>"
  "9869e38db82380d0fa3c5aff4375b3b3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'servo_pos)))
  "Returns md5sum for a message object of type 'servo_pos"
  "9869e38db82380d0fa3c5aff4375b3b3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<servo_pos>)))
  "Returns full string definition for message of type '<servo_pos>"
  (cl:format cl:nil "int64 legID~%float64 rollAng~%float64 pitchAng1~%float64 pitchAng2~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'servo_pos)))
  "Returns full string definition for message of type 'servo_pos"
  (cl:format cl:nil "int64 legID~%float64 rollAng~%float64 pitchAng1~%float64 pitchAng2~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <servo_pos>))
  (cl:+ 0
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <servo_pos>))
  "Converts a ROS message object to a list"
  (cl:list 'servo_pos
    (cl:cons ':legID (legID msg))
    (cl:cons ':rollAng (rollAng msg))
    (cl:cons ':pitchAng1 (pitchAng1 msg))
    (cl:cons ':pitchAng2 (pitchAng2 msg))
))
