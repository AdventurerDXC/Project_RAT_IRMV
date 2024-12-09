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
  :slots (_legID _rollAng _pitchAng1 _pitchAng2 ))

(defmethod inv_kinematics::servo_pos
  (:init
   (&key
    ((:legID __legID) 0)
    ((:rollAng __rollAng) 0.0)
    ((:pitchAng1 __pitchAng1) 0.0)
    ((:pitchAng2 __pitchAng2) 0.0)
    )
   (send-super :init)
   (setq _legID (round __legID))
   (setq _rollAng (float __rollAng))
   (setq _pitchAng1 (float __pitchAng1))
   (setq _pitchAng2 (float __pitchAng2))
   self)
  (:legID
   (&optional __legID)
   (if __legID (setq _legID __legID)) _legID)
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
    ;; int64 _legID
    8
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
     ;; int64 _legID
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _legID (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _legID) (= (length (_legID . bv)) 2)) ;; bignum
              (write-long (ash (elt (_legID . bv) 0) 0) s)
              (write-long (ash (elt (_legID . bv) 1) -1) s))
             ((and (class _legID) (= (length (_legID . bv)) 1)) ;; big1
              (write-long (elt (_legID . bv) 0) s)
              (write-long (if (>= _legID 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _legID s)(write-long (if (>= _legID 0) 0 #xffffffff) s)))
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
   ;; int64 _legID
#+(or :alpha :irix6 :x86_64)
      (setf _legID (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _legID (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64 _rollAng
     (setq _rollAng (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitchAng1
     (setq _pitchAng1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitchAng2
     (setq _pitchAng2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get inv_kinematics::servo_pos :md5sum-) "9869e38db82380d0fa3c5aff4375b3b3")
(setf (get inv_kinematics::servo_pos :datatype-) "inv_kinematics/servo_pos")
(setf (get inv_kinematics::servo_pos :definition-)
      "int64 legID
float64 rollAng
float64 pitchAng1
float64 pitchAng2
")



(provide :inv_kinematics/servo_pos "9869e38db82380d0fa3c5aff4375b3b3")


