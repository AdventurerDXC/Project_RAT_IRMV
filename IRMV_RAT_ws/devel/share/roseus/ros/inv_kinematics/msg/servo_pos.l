;; Auto-generated. Do not edit!


(when (boundp 'inv_kinematics::servo_pos)
  (if (not (find-package "INV_KINEMATICS"))
    (make-package "INV_KINEMATICS"))
  (shadow 'servo_pos (find-package "INV_KINEMATICS")))
(unless (find-package "INV_KINEMATICS::SERVO_POS")
  (make-package "INV_KINEMATICS::SERVO_POS"))

(in-package "ROS")
;;//! \htmlinclude servo_pos.msg.html


(defclass inv_kinematics::servo_pos
  :super ros::object
  :slots (_servo_FL _servo_FR _servo_BL _servo_BR ))

(defmethod inv_kinematics::servo_pos
  (:init
   (&key
    ((:servo_FL __servo_FL) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:servo_FR __servo_FR) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:servo_BL __servo_BL) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:servo_BR __servo_BR) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _servo_FL __servo_FL)
   (setq _servo_FR __servo_FR)
   (setq _servo_BL __servo_BL)
   (setq _servo_BR __servo_BR)
   self)
  (:servo_FL
   (&optional __servo_FL)
   (if __servo_FL (setq _servo_FL __servo_FL)) _servo_FL)
  (:servo_FR
   (&optional __servo_FR)
   (if __servo_FR (setq _servo_FR __servo_FR)) _servo_FR)
  (:servo_BL
   (&optional __servo_BL)
   (if __servo_BL (setq _servo_BL __servo_BL)) _servo_BL)
  (:servo_BR
   (&optional __servo_BR)
   (if __servo_BR (setq _servo_BR __servo_BR)) _servo_BR)
  (:serialization-length
   ()
   (+
    ;; float32[] _servo_FL
    (* 4    (length _servo_FL)) 4
    ;; float32[] _servo_FR
    (* 4    (length _servo_FR)) 4
    ;; float32[] _servo_BL
    (* 4    (length _servo_BL)) 4
    ;; float32[] _servo_BR
    (* 4    (length _servo_BR)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _servo_FL
     (write-long (length _servo_FL) s)
     (dotimes (i (length _servo_FL))
       (sys::poke (elt _servo_FL i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _servo_FR
     (write-long (length _servo_FR) s)
     (dotimes (i (length _servo_FR))
       (sys::poke (elt _servo_FR i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _servo_BL
     (write-long (length _servo_BL) s)
     (dotimes (i (length _servo_BL))
       (sys::poke (elt _servo_BL i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _servo_BR
     (write-long (length _servo_BR) s)
     (dotimes (i (length _servo_BR))
       (sys::poke (elt _servo_BR i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _servo_FL
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _servo_FL (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _servo_FL i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _servo_FR
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _servo_FR (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _servo_FR i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _servo_BL
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _servo_BL (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _servo_BL i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _servo_BR
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _servo_BR (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _servo_BR i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get inv_kinematics::servo_pos :md5sum-) "227a6f2238ca813c514b004a793abc3a")
(setf (get inv_kinematics::servo_pos :datatype-) "inv_kinematics/servo_pos")
(setf (get inv_kinematics::servo_pos :definition-)
      "# 四足机器狗的舵机目标角度，各数组长度为3
float32[] servo_FL  # 左前腿
float32[] servo_FR  # 右前腿
float32[] servo_BL  # 左后腿
float32[] servo_BR  # 右后腿
")



(provide :inv_kinematics/servo_pos "227a6f2238ca813c514b004a793abc3a")


