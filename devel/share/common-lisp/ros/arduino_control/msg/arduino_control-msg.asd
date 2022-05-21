
(cl:in-package :asdf)

(defsystem "arduino_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "servo" :depends-on ("_package_servo"))
    (:file "_package_servo" :depends-on ("_package"))
  ))