;; Auto-generated. Do not edit!


(when (boundp 'inv_kinematics::motor_pos)
  (if (not (find-package "INV_KINEMATICS"))
    (make-package "INV_KINEMATICS"))
  (shadow 'motor_pos (find-package "INV_KINEMATICS")))
(unless (find-package "INV_KINEMATICS::MOTOR_POS")
  (make-package "INV_KINEMATICS::MOTOR_POS"))

(in-package "ROS")
;;//! \htmlinclude motor_pos.msg.html


(defclass inv_kinematics::motor_pos
  :super ros::object
  :slots (_rollAng _pitchAng1 _pitchAng2 ))

(defmethod inv_kinematics::motor_pos
  (:init
   (&key
    ((:rollAng __rollAng) 0.0)
    ((:pitchAng1 __pitchAng1) 0.0)
    ((:pitchAng2 __pitchAng2) 0.0)
    )
   (send-super :init)
   (setq _rollAng (float __rollAng))
   (setq _pitchAng1 (float __pitchAng1))
   (setq _pitchAng2 (float __pitchAng2))
   self)
  (:rollAng
   (&optional __rollAng)
   (if __rollAng (setq _rollAng __rollAng)) _rollAng)
  (:pitchAng1
   (&optional __pitchAng1)
   (if __pitchAng1 (setq _pitchAng1 __pitchAng1)) _pitchAng1)
  (:pitchAng2
   (&optional __pitchAng2)
   (if __pitchAng2 (setq _pitchAng2 __pitchAng2)) _pitchAng2)
  (:serialization-length
   ()
   (+
    ;; float64 _rollAng
    8
    ;; float64 _pitchAng1
    8
    ;; float64 _pitchAng2
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _rollAng
       (sys::poke _rollAng (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitchAng1
       (sys::poke _pitchAng1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitchAng2
       (sys::poke _pitchAng2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _rollAng
     (setq _rollAng (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitchAng1
     (setq _pitchAng1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitchAng2
     (setq _pitchAng2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get inv_kinematics::motor_pos :md5sum-) "5ad27313b2960340abbf9c4777f37f7a")
(setf (get inv_kinematics::motor_pos :datatype-) "inv_kinematics/motor_pos")
(setf (get inv_kinematics::motor_pos :definition-)
      "float64 rollAng
float64 pitchAng1
float64 pitchAng2
")



(provide :inv_kinematics/motor_pos "5ad27313b2960340abbf9c4777f37f7a")


