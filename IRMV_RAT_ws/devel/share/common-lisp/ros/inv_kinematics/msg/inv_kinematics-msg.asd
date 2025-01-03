
(cl:in-package :asdf)

(defsystem "inv_kinematics-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "footend_pos" :depends-on ("_package_footend_pos"))
    (:file "_package_footend_pos" :depends-on ("_package"))
    (:file "servo_pos" :depends-on ("_package_servo_pos"))
    (:file "_package_servo_pos" :depends-on ("_package"))
  ))