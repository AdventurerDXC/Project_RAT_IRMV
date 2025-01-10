
(cl:in-package :asdf)

(defsystem "penu-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "LenCmd" :depends-on ("_package_LenCmd"))
    (:file "_package_LenCmd" :depends-on ("_package"))
    (:file "PreCmd" :depends-on ("_package_PreCmd"))
    (:file "_package_PreCmd" :depends-on ("_package"))
    (:file "Sensor" :depends-on ("_package_Sensor"))
    (:file "_package_Sensor" :depends-on ("_package"))
  ))