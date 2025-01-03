;; Auto-generated. Do not edit!


(when (boundp 'penu::LenCmd)
  (if (not (find-package "PENU"))
    (make-package "PENU"))
  (shadow 'LenCmd (find-package "PENU")))
(unless (find-package "PENU::LENCMD")
  (make-package "PENU::LENCMD"))

(in-package "ROS")
;;//! \htmlinclude LenCmd.msg.html


(defclass penu::LenCmd
  :super ros::object
  :slots (_len_cmd1 _len_cmd2 _len_cmd3 _len_cmd4 ))

(defmethod penu::LenCmd
  (:init
   (&key
    ((:len_cmd1 __len_cmd1) 0)
    ((:len_cmd2 __len_cmd2) 0)
    ((:len_cmd3 __len_cmd3) 0)
    ((:len_cmd4 __len_cmd4) 0)
    )
   (send-super :init)
   (setq _len_cmd1 (round __len_cmd1))
   (setq _len_cmd2 (round __len_cmd2))
   (setq _len_cmd3 (round __len_cmd3))
   (setq _len_cmd4 (round __len_cmd4))
   self)
  (:len_cmd1
   (&optional __len_cmd1)
   (if __len_cmd1 (setq _len_cmd1 __len_cmd1)) _len_cmd1)
  (:len_cmd2
   (&optional __len_cmd2)
   (if __len_cmd2 (setq _len_cmd2 __len_cmd2)) _len_cmd2)
  (:len_cmd3
   (&optional __len_cmd3)
   (if __len_cmd3 (setq _len_cmd3 __len_cmd3)) _len_cmd3)
  (:len_cmd4
   (&optional __len_cmd4)
   (if __len_cmd4 (setq _len_cmd4 __len_cmd4)) _len_cmd4)
  (:serialization-length
   ()
   (+
    ;; uint16 _len_cmd1
    2
    ;; uint16 _len_cmd2
    2
    ;; uint16 _len_cmd3
    2
    ;; uint16 _len_cmd4
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _len_cmd1
       (write-word _len_cmd1 s)
     ;; uint16 _len_cmd2
       (write-word _len_cmd2 s)
     ;; uint16 _len_cmd3
       (write-word _len_cmd3 s)
     ;; uint16 _len_cmd4
       (write-word _len_cmd4 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _len_cmd1
     (setq _len_cmd1 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _len_cmd2
     (setq _len_cmd2 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _len_cmd3
     (setq _len_cmd3 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _len_cmd4
     (setq _len_cmd4 (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get penu::LenCmd :md5sum-) "0df90e8fef6c46a006fc379e47a36ad2")
(setf (get penu::LenCmd :datatype-) "penu/LenCmd")
(setf (get penu::LenCmd :definition-)
      "# length control command
uint16 len_cmd1
uint16 len_cmd2
uint16 len_cmd3
uint16 len_cmd4

")



(provide :penu/LenCmd "0df90e8fef6c46a006fc379e47a36ad2")


