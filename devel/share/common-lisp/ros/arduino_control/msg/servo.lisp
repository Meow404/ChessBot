; Auto-generated. Do not edit!


(cl:in-package arduino_control-msg)


;//! \htmlinclude servo.msg.html

(cl:defclass <servo> (roslisp-msg-protocol:ros-message)
  ((motor_id
    :reader motor_id
    :initarg :motor_id
    :type cl:fixnum
    :initform 0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:fixnum
    :initform 0))
)

(cl:defclass servo (<servo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <servo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'servo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name arduino_control-msg:<servo> is deprecated: use arduino_control-msg:servo instead.")))

(cl:ensure-generic-function 'motor_id-val :lambda-list '(m))
(cl:defmethod motor_id-val ((m <servo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arduino_control-msg:motor_id-val is deprecated.  Use arduino_control-msg:motor_id instead.")
  (motor_id m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <servo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arduino_control-msg:angle-val is deprecated.  Use arduino_control-msg:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <servo>) ostream)
  "Serializes a message object of type '<servo>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motor_id)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <servo>) istream)
  "Deserializes a message object of type '<servo>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'motor_id)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'angle) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<servo>)))
  "Returns string type for a message object of type '<servo>"
  "arduino_control/servo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'servo)))
  "Returns string type for a message object of type 'servo"
  "arduino_control/servo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<servo>)))
  "Returns md5sum for a message object of type '<servo>"
  "e2a803e220d5afb4a14a1d355efb3faf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'servo)))
  "Returns md5sum for a message object of type 'servo"
  "e2a803e220d5afb4a14a1d355efb3faf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<servo>)))
  "Returns full string definition for message of type '<servo>"
  (cl:format cl:nil "uint8 motor_id~%int16 angle~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'servo)))
  "Returns full string definition for message of type 'servo"
  (cl:format cl:nil "uint8 motor_id~%int16 angle~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <servo>))
  (cl:+ 0
     1
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <servo>))
  "Converts a ROS message object to a list"
  (cl:list 'servo
    (cl:cons ':motor_id (motor_id msg))
    (cl:cons ':angle (angle msg))
))
