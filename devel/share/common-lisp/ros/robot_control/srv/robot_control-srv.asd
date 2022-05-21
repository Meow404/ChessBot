
(cl:in-package :asdf)

(defsystem "robot_control-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "RobotServoConfigure" :depends-on ("_package_RobotServoConfigure"))
    (:file "_package_RobotServoConfigure" :depends-on ("_package"))
  ))