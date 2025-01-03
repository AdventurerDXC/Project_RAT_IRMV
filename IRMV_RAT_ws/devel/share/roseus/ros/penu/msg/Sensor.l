;; Auto-generated. Do not edit!


(when (boundp 'penu::Sensor)
  (if (not (find-package "PENU"))
    (make-package "PENU"))
  (shadow 'Sensor (find-package "PENU")))
(unless (find-package "PENU::SENSOR")
  (make-package "PENU::SENSOR"))

(in-package "ROS")
;;//! \htmlinclude Sensor.msg.html


(defclass penu::Sensor
  :super ros::object
  :slots (_pre_FB1 _pre_FB2 _pre_FB3 _pre_FB4 _len_FB1 _len_FB2 _len_FB3 _len_FB4 ))

(defmethod penu::Sensor
  (:init
   (&key
    ((:pre_FB1 __pre_FB1) 0.0)
    ((:pre_FB2 __pre_FB2) 0.0)
    ((:pre_FB3 __pre_FB3) 0.0)
    ((:pre_FB4 __pre_FB4) 0.0)
    ((:len_FB1 __len_FB1) 0.0)
    ((:len_FB2 __len_FB2) 0.0)
    ((:len_FB3 __len_FB3) 0.0)
    ((:len_FB4 __len_FB4) 0.0)
    )
   (send-super :init)
   (setq _pre_FB1 (float __pre_FB1))
   (setq _pre_FB2 (float __pre_FB2))
   (setq _pre_FB3 (float __pre_FB3))
   (setq _pre_FB4 (float __pre_FB4))
   (setq _len_FB1 (float __len_FB1))
   (setq _len_FB2 (float __len_FB2))
   (setq _len_FB3 (float __len_FB3))
   (setq _len_FB4 (float __len_FB4))
   self)
  (:pre_FB1
   (&optional __pre_FB1)
   (if __pre_FB1 (setq _pre_FB1 __pre_FB1)) _pre_FB1)
  (:pre_FB2
   (&optional __pre_FB2)
   (if __pre_FB2 (setq _pre_FB2 __pre_FB2)) _pre_FB2)
  (:pre_FB3
   (&optional __pre_FB3)
   (if __pre_FB3 (setq _pre_FB3 __pre_FB3)) _pre_FB3)
  (:pre_FB4
   (&optional __pre_FB4)
   (if __pre_FB4 (setq _pre_FB4 __pre_FB4)) _pre_FB4)
  (:len_FB1
   (&optional __len_FB1)
   (if __len_FB1 (setq _len_FB1 __len_FB1)) _len_FB1)
  (:len_FB2
   (&optional __len_FB2)
   (if __len_FB2 (setq _len_FB2 __len_FB2)) _len_FB2)
  (:len_FB3
   (&optional __len_FB3)
   (if __len_FB3 (setq _len_FB3 __len_FB3)) _len_FB3)
  (:len_FB4
   (&optional __len_FB4)
   (if __len_FB4 (setq _len_FB4 __len_FB4)) _len_FB4)
  (:serialization-length
   ()
   (+
    ;; float64 _pre_FB1
    8
    ;; float64 _pre_FB2
    8
    ;; float64 _pre_FB3
    8
    ;; float64 _pre_FB4
    8
    ;; float64 _len_FB1
    8
    ;; float64 _len_FB2
    8
    ;; float64 _len_FB3
    8
    ;; float64 _len_FB4
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _pre_FB1
       (sys::poke _pre_FB1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pre_FB2
       (sys::poke _pre_FB2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pre_FB3
       (sys::poke _pre_FB3 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pre_FB4
       (sys::poke _pre_FB4 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _len_FB1
       (sys::poke _len_FB1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _len_FB2
       (sys::poke _len_FB2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _len_FB3
       (sys::poke _len_FB3 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _len_FB4
       (sys::poke _len_FB4 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _pre_FB1
     (setq _pre_FB1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pre_FB2
     (setq _pre_FB2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pre_FB3
     (setq _pre_FB3 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pre_FB4
     (setq _pre_FB4 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _len_FB1
     (setq _len_FB1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _len_FB2
     (setq _len_FB2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _len_FB3
     (setq _len_FB3 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _len_FB4
     (setq _len_FB4 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get penu::Sensor :md5sum-) "8eea295248949e2a5a16594e9f20e338")
(setf (get penu::Sensor :datatype-) "penu/Sensor")
(setf (get penu::Sensor :definition-)
      "# pressure measurement
float64 pre_FB1
float64 pre_FB2
float64 pre_FB3
float64 pre_FB4
# cable measurement
float64 len_FB1
float64 len_FB2
float64 len_FB3
float64 len_FB4









")



(provide :penu/Sensor "8eea295248949e2a5a16594e9f20e338")


