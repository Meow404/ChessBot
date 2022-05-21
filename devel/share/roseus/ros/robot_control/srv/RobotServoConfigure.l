;; Auto-generated. Do not edit!


(when (boundp 'robot_control::RobotServoConfigure)
  (if (not (find-package "ROBOT_CONTROL"))
    (make-package "ROBOT_CONTROL"))
  (shadow 'RobotServoConfigure (find-package "ROBOT_CONTROL")))
(unless (find-package "ROBOT_CONTROL::ROBOTSERVOCONFIGURE")
  (make-package "ROBOT_CONTROL::ROBOTSERVOCONFIGURE"))
(unless (find-package "ROBOT_CONTROL::ROBOTSERVOCONFIGUREREQUEST")
  (make-package "ROBOT_CONTROL::ROBOTSERVOCONFIGUREREQUEST"))
(unless (find-package "ROBOT_CONTROL::ROBOTSERVOCONFIGURERESPONSE")
  (make-package "ROBOT_CONTROL::ROBOTSERVOCONFIGURERESPONSE"))

(in-package "ROS")





(defclass robot_control::RobotServoConfigureRequest
  :super ros::object
  :slots (_base_angle _right_angle _left_angle ))

(defmethod robot_control::RobotServoConfigureRequest
  (:init
   (&key
    ((:base_angle __base_angle) 0)
    ((:right_angle __right_angle) 0)
    ((:left_angle __left_angle) 0)
    )
   (send-super :init)
   (setq _base_angle (round __base_angle))
   (setq _right_angle (round __right_angle))
   (setq _left_angle (round __left_angle))
   self)
  (:base_angle
   (&optional __base_angle)
   (if __base_angle (setq _base_angle __base_angle)) _base_angle)
  (:right_angle
   (&optional __right_angle)
   (if __right_angle (setq _right_angle __right_angle)) _right_angle)
  (:left_angle
   (&optional __left_angle)
   (if __left_angle (setq _left_angle __left_angle)) _left_angle)
  (:serialization-length
   ()
   (+
    ;; int16 _base_angle
    2
    ;; int16 _right_angle
    2
    ;; int16 _left_angle
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _base_angle
       (write-word _base_angle s)
     ;; int16 _right_angle
       (write-word _right_angle s)
     ;; int16 _left_angle
       (write-word _left_angle s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _base_angle
     (setq _base_angle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _right_angle
     (setq _right_angle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _left_angle
     (setq _left_angle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass robot_control::RobotServoConfigureResponse
  :super ros::object
  :slots (_sum ))

(defmethod robot_control::RobotServoConfigureResponse
  (:init
   (&key
    ((:sum __sum) nil)
    )
   (send-super :init)
   (setq _sum __sum)
   self)
  (:sum
   (&optional (__sum :null))
   (if (not (eq __sum :null)) (setq _sum __sum)) _sum)
  (:serialization-length
   ()
   (+
    ;; bool _sum
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _sum
       (if _sum (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _sum
     (setq _sum (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass robot_control::RobotServoConfigure
  :super ros::object
  :slots ())

(setf (get robot_control::RobotServoConfigure :md5sum-) "0cd3ecf7339bcd1bc5e56bad74e9aa6e")
(setf (get robot_control::RobotServoConfigure :datatype-) "robot_control/RobotServoConfigure")
(setf (get robot_control::RobotServoConfigure :request) robot_control::RobotServoConfigureRequest)
(setf (get robot_control::RobotServoConfigure :response) robot_control::RobotServoConfigureResponse)

(defmethod robot_control::RobotServoConfigureRequest
  (:response () (instance robot_control::RobotServoConfigureResponse :init)))

(setf (get robot_control::RobotServoConfigureRequest :md5sum-) "0cd3ecf7339bcd1bc5e56bad74e9aa6e")
(setf (get robot_control::RobotServoConfigureRequest :datatype-) "robot_control/RobotServoConfigureRequest")
(setf (get robot_control::RobotServoConfigureRequest :definition-)
      "int16 base_angle
int16 right_angle
int16 left_angle
---
bool sum
")

(setf (get robot_control::RobotServoConfigureResponse :md5sum-) "0cd3ecf7339bcd1bc5e56bad74e9aa6e")
(setf (get robot_control::RobotServoConfigureResponse :datatype-) "robot_control/RobotServoConfigureResponse")
(setf (get robot_control::RobotServoConfigureResponse :definition-)
      "int16 base_angle
int16 right_angle
int16 left_angle
---
bool sum
")



(provide :robot_control/RobotServoConfigure "0cd3ecf7339bcd1bc5e56bad74e9aa6e")


