; Auto-generated. Do not edit!


(cl:in-package robot_control-srv)


;//! \htmlinclude RobotServoConfigure-request.msg.html

(cl:defclass <RobotServoConfigure-request> (roslisp-msg-protocol:ros-message)
  ((base_angle
    :reader base_angle
    :initarg :base_angle
    :type cl:fixnum
    :initform 0)
   (right_angle
    :reader right_angle
    :initarg :right_angle
    :type cl:fixnum
    :initform 0)
   (left_angle
    :reader left_angle
    :initarg :left_angle
    :type cl:fixnum
    :initform 0))
)

(cl:defclass RobotServoConfigure-request (<RobotServoConfigure-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotServoConfigure-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotServoConfigure-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_control-srv:<RobotServoConfigure-request> is deprecated: use robot_control-srv:RobotServoConfigure-request instead.")))

(cl:ensure-generic-function 'base_angle-val :lambda-list '(m))
(cl:defmethod base_angle-val ((m <RobotServoConfigure-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-srv:base_angle-val is deprecated.  Use robot_control-srv:base_angle instead.")
  (base_angle m))

(cl:ensure-generic-function 'right_angle-val :lambda-list '(m))
(cl:defmethod right_angle-val ((m <RobotServoConfigure-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-srv:right_angle-val is deprecated.  Use robot_control-srv:right_angle instead.")
  (right_angle m))

(cl:ensure-generic-function 'left_angle-val :lambda-list '(m))
(cl:defmethod left_angle-val ((m <RobotServoConfigure-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-srv:left_angle-val is deprecated.  Use robot_control-srv:left_angle instead.")
  (left_angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotServoConfigure-request>) ostream)
  "Serializes a message object of type '<RobotServoConfigure-request>"
  (cl:let* ((signed (cl:slot-value msg 'base_angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right_angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'left_angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotServoConfigure-request>) istream)
  "Deserializes a message object of type '<RobotServoConfigure-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'base_angle) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right_angle) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left_angle) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotServoConfigure-request>)))
  "Returns string type for a service object of type '<RobotServoConfigure-request>"
  "robot_control/RobotServoConfigureRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotServoConfigure-request)))
  "Returns string type for a service object of type 'RobotServoConfigure-request"
  "robot_control/RobotServoConfigureRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotServoConfigure-request>)))
  "Returns md5sum for a message object of type '<RobotServoConfigure-request>"
  "0cd3ecf7339bcd1bc5e56bad74e9aa6e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotServoConfigure-request)))
  "Returns md5sum for a message object of type 'RobotServoConfigure-request"
  "0cd3ecf7339bcd1bc5e56bad74e9aa6e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotServoConfigure-request>)))
  "Returns full string definition for message of type '<RobotServoConfigure-request>"
  (cl:format cl:nil "int16 base_angle~%int16 right_angle~%int16 left_angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotServoConfigure-request)))
  "Returns full string definition for message of type 'RobotServoConfigure-request"
  (cl:format cl:nil "int16 base_angle~%int16 right_angle~%int16 left_angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotServoConfigure-request>))
  (cl:+ 0
     2
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotServoConfigure-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotServoConfigure-request
    (cl:cons ':base_angle (base_angle msg))
    (cl:cons ':right_angle (right_angle msg))
    (cl:cons ':left_angle (left_angle msg))
))
;//! \htmlinclude RobotServoConfigure-response.msg.html

(cl:defclass <RobotServoConfigure-response> (roslisp-msg-protocol:ros-message)
  ((sum
    :reader sum
    :initarg :sum
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RobotServoConfigure-response (<RobotServoConfigure-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotServoConfigure-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotServoConfigure-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_control-srv:<RobotServoConfigure-response> is deprecated: use robot_control-srv:RobotServoConfigure-response instead.")))

(cl:ensure-generic-function 'sum-val :lambda-list '(m))
(cl:defmethod sum-val ((m <RobotServoConfigure-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_control-srv:sum-val is deprecated.  Use robot_control-srv:sum instead.")
  (sum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotServoConfigure-response>) ostream)
  "Serializes a message object of type '<RobotServoConfigure-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'sum) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotServoConfigure-response>) istream)
  "Deserializes a message object of type '<RobotServoConfigure-response>"
    (cl:setf (cl:slot-value msg 'sum) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotServoConfigure-response>)))
  "Returns string type for a service object of type '<RobotServoConfigure-response>"
  "robot_control/RobotServoConfigureResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotServoConfigure-response)))
  "Returns string type for a service object of type 'RobotServoConfigure-response"
  "robot_control/RobotServoConfigureResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotServoConfigure-response>)))
  "Returns md5sum for a message object of type '<RobotServoConfigure-response>"
  "0cd3ecf7339bcd1bc5e56bad74e9aa6e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotServoConfigure-response)))
  "Returns md5sum for a message object of type 'RobotServoConfigure-response"
  "0cd3ecf7339bcd1bc5e56bad74e9aa6e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotServoConfigure-response>)))
  "Returns full string definition for message of type '<RobotServoConfigure-response>"
  (cl:format cl:nil "bool sum~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotServoConfigure-response)))
  "Returns full string definition for message of type 'RobotServoConfigure-response"
  (cl:format cl:nil "bool sum~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotServoConfigure-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotServoConfigure-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotServoConfigure-response
    (cl:cons ':sum (sum msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RobotServoConfigure)))
  'RobotServoConfigure-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RobotServoConfigure)))
  'RobotServoConfigure-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotServoConfigure)))
  "Returns string type for a service object of type '<RobotServoConfigure>"
  "robot_control/RobotServoConfigure")