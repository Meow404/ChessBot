;; Auto-generated. Do not edit!


(when (boundp 'arduino_control::servo)
  (if (not (find-package "ARDUINO_CONTROL"))
    (make-package "ARDUINO_CONTROL"))
  (shadow 'servo (find-package "ARDUINO_CONTROL")))
(unless (find-package "ARDUINO_CONTROL::SERVO")
  (make-package "ARDUINO_CONTROL::SERVO"))

(in-package "ROS")
;;//! \htmlinclude servo.msg.html


(defclass arduino_control::servo
  :super ros::object
  :slots (_motor_id _angle ))

(defmethod arduino_control::servo
  (:init
   (&key
    ((:motor_id __motor_id) 0)
    ((:angle __angle) 0)
    )
   (send-super :init)
   (setq _motor_id (round __motor_id))
   (setq _angle (round __angle))
   self)
  (:motor_id
   (&optional __motor_id)
   (if __motor_id (setq _motor_id __motor_id)) _motor_id)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; uint8 _motor_id
    1
    ;; int16 _angle
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _motor_id
       (write-byte _motor_id s)
     ;; int16 _angle
       (write-word _angle s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _motor_id
     (setq _motor_id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int16 _angle
     (setq _angle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get arduino_control::servo :md5sum-) "e2a803e220d5afb4a14a1d355efb3faf")
(setf (get arduino_control::servo :datatype-) "arduino_control/servo")
(setf (get arduino_control::servo :definition-)
      "uint8 motor_id
int16 angle
")



(provide :arduino_control/servo "e2a803e220d5afb4a14a1d355efb3faf")


