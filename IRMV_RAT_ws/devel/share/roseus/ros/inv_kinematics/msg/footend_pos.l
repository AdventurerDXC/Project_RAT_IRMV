;; Auto-generated. Do not edit!


(when (boundp 'inv_kinematics::footend_pos)
  (if (not (find-package "INV_KINEMATICS"))
    (make-package "INV_KINEMATICS"))
  (shadow 'footend_pos (find-package "INV_KINEMATICS")))
(unless (find-package "INV_KINEMATICS::FOOTEND_POS")
  (make-package "INV_KINEMATICS::FOOTEND_POS"))

(in-package "ROS")
;;//! \htmlinclude footend_pos.msg.html


(defclass inv_kinematics::footend_pos
  :super ros::object
  :slots (_footend_FL _footend_FR _footend_BL _footend_BR ))

(defmethod inv_kinematics::footend_pos
  (:init
   (&key
    ((:footend_FL __footend_FL) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:footend_FR __footend_FR) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:footend_BL __footend_BL) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:footend_BR __footend_BR) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _footend_FL __footend_FL)
   (setq _footend_FR __footend_FR)
   (setq _footend_BL __footend_BL)
   (setq _footend_BR __footend_BR)
   self)
  (:footend_FL
   (&optional __footend_FL)
   (if __footend_FL (setq _footend_FL __footend_FL)) _footend_FL)
  (:footend_FR
   (&optional __footend_FR)
   (if __footend_FR (setq _footend_FR __footend_FR)) _footend_FR)
  (:footend_BL
   (&optional __footend_BL)
   (if __footend_BL (setq _footend_BL __footend_BL)) _footend_BL)
  (:footend_BR
   (&optional __footend_BR)
   (if __footend_BR (setq _footend_BR __footend_BR)) _footend_BR)
  (:serialization-length
   ()
   (+
    ;; float32[] _footend_FL
    (* 4    (length _footend_FL)) 4
    ;; float32[] _footend_FR
    (* 4    (length _footend_FR)) 4
    ;; float32[] _footend_BL
    (* 4    (length _footend_BL)) 4
    ;; float32[] _footend_BR
    (* 4    (length _footend_BR)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _footend_FL
     (write-long (length _footend_FL) s)
     (dotimes (i (length _footend_FL))
       (sys::poke (elt _footend_FL i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _footend_FR
     (write-long (length _footend_FR) s)
     (dotimes (i (length _footend_FR))
       (sys::poke (elt _footend_FR i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _footend_BL
     (write-long (length _footend_BL) s)
     (dotimes (i (length _footend_BL))
       (sys::poke (elt _footend_BL i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _footend_BR
     (write-long (length _footend_BR) s)
     (dotimes (i (length _footend_BR))
       (sys::poke (elt _footend_BR i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _footend_FL
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _footend_FL (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _footend_FL i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _footend_FR
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _footend_FR (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _footend_FR i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _footend_BL
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _footend_BL (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _footend_BL i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _footend_BR
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _footend_BR (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _footend_BR i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get inv_kinematics::footend_pos :md5sum-) "9e96999e07cf2518ba50b0eeed74e99c")
(setf (get inv_kinematics::footend_pos :datatype-) "inv_kinematics/footend_pos")
(setf (get inv_kinematics::footend_pos :definition-)
      "# 四足机器狗的落脚点坐标，各数组长度为3
float32[] footend_FL  # 左前腿
float32[] footend_FR  # 右前腿
float32[] footend_BL  # 左后腿
float32[] footend_BR  # 右后腿
")



(provide :inv_kinematics/footend_pos "9e96999e07cf2518ba50b0eeed74e99c")


