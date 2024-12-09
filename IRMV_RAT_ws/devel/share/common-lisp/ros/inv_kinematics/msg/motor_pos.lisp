; Auto-generated. Do not edit!


(cl:in-package inv_kinematics-msg)


;//! \htmlinclude motor_pos.msg.html

(cl:defclass <motor_pos> (roslisp-msg-protocol:ros-message)
  ((rollAng
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

(cl:defclass motor_pos (<motor_pos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motor_pos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motor_pos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name inv_kinematics-msg:<motor_pos> is deprecated: use inv_kinematics-msg:motor_pos instead.")))

(cl:ensure-generic-function 'rollAng-val :lambda-list '(m))
(cl:defmethod rollAng-val ((m <motor_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inv_kinematics-msg:rollAng-val is deprecated.  Use inv_kinematics-msg:rollAng instead.")
  (rollAng m))

(cl:ensure-generic-function 'pitchAng1-val :lambda-list '(m))
(cl:defmethod pitchAng1-val ((m <motor_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inv_kinematics-msg:pitchAng1-val is deprecated.  Use inv_kinematics-msg:pitchAng1 instead.")
  (pitchAng1 m))

(cl:ensure-generic-function 'pitchAng2-val :lambda-list '(m))
(cl:defmethod pitchAng2-val ((m <motor_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader inv_kinematics-msg:pitchAng2-val is deprecated.  Use inv_kinematics-msg:pitchAng2 instead.")
  (pitchAng2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motor_pos>) ostream)
  "Serializes a message object of type '<motor_pos>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motor_pos>) istream)
  "Deserializes a message object of type '<motor_pos>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motor_pos>)))
  "Returns string type for a message object of type '<motor_pos>"
  "inv_kinematics/motor_pos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motor_pos)))
  "Returns string type for a message object of type 'motor_pos"
  "inv_kinematics/motor_pos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motor_pos>)))
  "Returns md5sum for a message object of type '<motor_pos>"
  "5ad27313b2960340abbf9c4777f37f7a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motor_pos)))
  "Returns md5sum for a message object of type 'motor_pos"
  "5ad27313b2960340abbf9c4777f37f7a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motor_pos>)))
  "Returns full string definition for message of type '<motor_pos>"
  (cl:format cl:nil "float64 rollAng~%float64 pitchAng1~%float64 pitchAng2~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motor_pos)))
  "Returns full string definition for message of type 'motor_pos"
  (cl:format cl:nil "float64 rollAng~%float64 pitchAng1~%float64 pitchAng2~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motor_pos>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motor_pos>))
  "Converts a ROS message object to a list"
  (cl:list 'motor_pos
    (cl:cons ':rollAng (rollAng msg))
    (cl:cons ':pitchAng1 (pitchAng1 msg))
    (cl:cons ':pitchAng2 (pitchAng2 msg))
))
