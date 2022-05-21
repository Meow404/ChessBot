// Auto-generated. Do not edit!

// (in-package robot_control.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class RobotServoConfigureRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.base_angle = null;
      this.right_angle = null;
      this.left_angle = null;
    }
    else {
      if (initObj.hasOwnProperty('base_angle')) {
        this.base_angle = initObj.base_angle
      }
      else {
        this.base_angle = 0;
      }
      if (initObj.hasOwnProperty('right_angle')) {
        this.right_angle = initObj.right_angle
      }
      else {
        this.right_angle = 0;
      }
      if (initObj.hasOwnProperty('left_angle')) {
        this.left_angle = initObj.left_angle
      }
      else {
        this.left_angle = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotServoConfigureRequest
    // Serialize message field [base_angle]
    bufferOffset = _serializer.int16(obj.base_angle, buffer, bufferOffset);
    // Serialize message field [right_angle]
    bufferOffset = _serializer.int16(obj.right_angle, buffer, bufferOffset);
    // Serialize message field [left_angle]
    bufferOffset = _serializer.int16(obj.left_angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotServoConfigureRequest
    let len;
    let data = new RobotServoConfigureRequest(null);
    // Deserialize message field [base_angle]
    data.base_angle = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [right_angle]
    data.right_angle = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [left_angle]
    data.left_angle = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 6;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_control/RobotServoConfigureRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '880df4b47385a27ec3b8d61f0e69b38c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 base_angle
    int16 right_angle
    int16 left_angle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotServoConfigureRequest(null);
    if (msg.base_angle !== undefined) {
      resolved.base_angle = msg.base_angle;
    }
    else {
      resolved.base_angle = 0
    }

    if (msg.right_angle !== undefined) {
      resolved.right_angle = msg.right_angle;
    }
    else {
      resolved.right_angle = 0
    }

    if (msg.left_angle !== undefined) {
      resolved.left_angle = msg.left_angle;
    }
    else {
      resolved.left_angle = 0
    }

    return resolved;
    }
};

class RobotServoConfigureResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sum = null;
    }
    else {
      if (initObj.hasOwnProperty('sum')) {
        this.sum = initObj.sum
      }
      else {
        this.sum = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotServoConfigureResponse
    // Serialize message field [sum]
    bufferOffset = _serializer.bool(obj.sum, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotServoConfigureResponse
    let len;
    let data = new RobotServoConfigureResponse(null);
    // Deserialize message field [sum]
    data.sum = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_control/RobotServoConfigureResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd6878fbf450c7ecf53a60b908b6689ac';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool sum
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RobotServoConfigureResponse(null);
    if (msg.sum !== undefined) {
      resolved.sum = msg.sum;
    }
    else {
      resolved.sum = false
    }

    return resolved;
    }
};

module.exports = {
  Request: RobotServoConfigureRequest,
  Response: RobotServoConfigureResponse,
  md5sum() { return '0cd3ecf7339bcd1bc5e56bad74e9aa6e'; },
  datatype() { return 'robot_control/RobotServoConfigure'; }
};
