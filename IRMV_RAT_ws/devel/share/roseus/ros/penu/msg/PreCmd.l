;; Auto-generated. Do not edit!


(when (boundp 'penu::PreCmd)
  (if (not (find-package "PENU"))
    (make-package "PENU"))
  (shadow 'PreCmd (find-package "PENU")))
(unless (find-package "PENU::PRECMD")
  (make-package "PENU::PRECMD"))

(in-package "ROS")
;;//! \htmlinclude PreCmd.msg.html


(defclass penu::PreCmd
  :super ros::object
  :slots (_pre_cmd1 _pre_cmd2 _pre_cmd3 _pre_cmd4 ))

(defmethod penu::PreCmd
  (:init
   (&key
    ((:pre_cmd1 __pre_cmd1) 0)
    ((:pre_cmd2 __pre_cmd2) 0)
    ((:pre_cmd3 __pre_cmd3) 0)
    ((:pre_cmd4 __pre_cmd4) 0)
    )
   (send-super :init)
   (setq _pre_cmd1 (round __pre_cmd1))
   (setq _pre_cmd2 (round __pre_cmd2))
   (setq _pre_cmd3 (round __pre_cmd3))
   (setq _pre_cmd4 (round __pre_cmd4))
   self)
  (:pre_cmd1
   (&optional __pre_cmd1)
   (if __pre_cmd1 (setq _pre_cmd1 __pre_cmd1)) _pre_cmd1)
  (:pre_cmd2
   (&optional __pre_cmd2)
   (if __pre_cmd2 (setq _pre_cmd2 __pre_cmd2)) _pre_cmd2)
  (:pre_cmd3
   (&optional __pre_cmd3)
   (if __pre_cmd3 (setq _pre_cmd3 __pre_cmd3)) _pre_cmd3)
  (:pre_cmd4
   (&optional __pre_cmd4)
   (if __pre_cmd4 (setq _pre_cmd4 __pre_cmd4)) _pre_cmd4)
  (:serialization-length
   ()
   (+
    ;; uint16 _pre_cmd1
    2
    ;; uint16 _pre_cmd2
    2
    ;; uint16 _pre_cmd3
    2
    ;; uint16 _pre_cmd4
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _pre_cmd1
       (write-word _pre_cmd1 s)
     ;; uint16 _pre_cmd2
       (write-word _pre_cmd2 s)
     ;; uint16 _pre_cmd3
       (write-word _pre_cmd3 s)
     ;; uint16 _pre_cmd4
       (write-word _pre_cmd4 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _pre_cmd1
     (setq _pre_cmd1 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _pre_cmd2
     (setq _pre_cmd2 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _pre_cmd3
     (setq _pre_cmd3 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _pre_cmd4
     (setq _pre_cmd4 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get penu::PreCmd :md5sum-) "21ac01ccfc8745d307c8c5b188f365f9")
(setf (get penu::PreCmd :datatype-) "penu/PreCmd")
(setf (get penu::PreCmd :definition-)
      "# pressure control command
uint16 pre_cmd1
uint16 pre_cmd2
uint16 pre_cmd3
uint16 pre_cmd4





")



(provide :penu/PreCmd "21ac01ccfc8745d307c8c5b188f365f9")


