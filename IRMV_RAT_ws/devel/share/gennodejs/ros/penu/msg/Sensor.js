// Auto-generated. Do not edit!

// (in-package penu.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Sensor {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pre_FB1 = null;
      this.pre_FB2 = null;
      this.pre_FB3 = null;
      this.pre_FB4 = null;
      this.len_FB1 = null;
      this.len_FB2 = null;
      this.len_FB3 = null;
      this.len_FB4 = null;
    }
    else {
      if (initObj.hasOwnProperty('pre_FB1')) {
        this.pre_FB1 = initObj.pre_FB1
      }
      else {
        this.pre_FB1 = 0.0;
      }
      if (initObj.hasOwnProperty('pre_FB2')) {
        this.pre_FB2 = initObj.pre_FB2
      }
      else {
        this.pre_FB2 = 0.0;
      }
      if (initObj.hasOwnProperty('pre_FB3')) {
        this.pre_FB3 = initObj.pre_FB3
      }
      else {
        this.pre_FB3 = 0.0;
      }
      if (initObj.hasOwnProperty('pre_FB4')) {
        this.pre_FB4 = initObj.pre_FB4
      }
      else {
        this.pre_FB4 = 0.0;
      }
      if (initObj.hasOwnProperty('len_FB1')) {
        this.len_FB1 = initObj.len_FB1
      }
      else {
        this.len_FB1 = 0.0;
      }
      if (initObj.hasOwnProperty('len_FB2')) {
        this.len_FB2 = initObj.len_FB2
      }
      else {
        this.len_FB2 = 0.0;
      }
      if (initObj.hasOwnProperty('len_FB3')) {
        this.len_FB3 = initObj.len_FB3
      }
      else {
        this.len_FB3 = 0.0;
      }
      if (initObj.hasOwnProperty('len_FB4')) {
        this.len_FB4 = initObj.len_FB4
      }
      else {
        this.len_FB4 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Sensor
    // Serialize message field [pre_FB1]
    bufferOffset = _serializer.float64(obj.pre_FB1, buffer, bufferOffset);
    // Serialize message field [pre_FB2]
    bufferOffset = _serializer.float64(obj.pre_FB2, buffer, bufferOffset);
    // Serialize message field [pre_FB3]
    bufferOffset = _serializer.float64(obj.pre_FB3, buffer, bufferOffset);
    // Serialize message field [pre_FB4]
    bufferOffset = _serializer.float64(obj.pre_FB4, buffer, bufferOffset);
    // Serialize message field [len_FB1]
    bufferOffset = _serializer.float64(obj.len_FB1, buffer, bufferOffset);
    // Serialize message field [len_FB2]
    bufferOffset = _serializer.float64(obj.len_FB2, buffer, bufferOffset);
    // Serialize message field [len_FB3]
    bufferOffset = _serializer.float64(obj.len_FB3, buffer, bufferOffset);
    // Serialize message field [len_FB4]
    bufferOffset = _serializer.float64(obj.len_FB4, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Sensor
    let len;
    let data = new Sensor(null);
    // Deserialize message field [pre_FB1]
    data.pre_FB1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pre_FB2]
    data.pre_FB2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pre_FB3]
    data.pre_FB3 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pre_FB4]
    data.pre_FB4 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [len_FB1]
    data.len_FB1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [len_FB2]
    data.len_FB2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [len_FB3]
    data.len_FB3 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [len_FB4]
    data.len_FB4 = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'penu/Sensor';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8eea295248949e2a5a16594e9f20e338';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # pressure measurement
    float64 pre_FB1
    float64 pre_FB2
    float64 pre_FB3
    float64 pre_FB4
    # cable measurement
    float64 len_FB1
    float64 len_FB2
    float64 len_FB3
    float64 len_FB4
    
    
    
    
    
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Sensor(null);
    if (msg.pre_FB1 !== undefined) {
      resolved.pre_FB1 = msg.pre_FB1;
    }
    else {
      resolved.pre_FB1 = 0.0
    }

    if (msg.pre_FB2 !== undefined) {
      resolved.pre_FB2 = msg.pre_FB2;
    }
    else {
      resolved.pre_FB2 = 0.0
    }

    if (msg.pre_FB3 !== undefined) {
      resolved.pre_FB3 = msg.pre_FB3;
    }
    else {
      resolved.pre_FB3 = 0.0
    }

    if (msg.pre_FB4 !== undefined) {
      resolved.pre_FB4 = msg.pre_FB4;
    }
    else {
      resolved.pre_FB4 = 0.0
    }

    if (msg.len_FB1 !== undefined) {
      resolved.len_FB1 = msg.len_FB1;
    }
    else {
      resolved.len_FB1 = 0.0
    }

    if (msg.len_FB2 !== undefined) {
      resolved.len_FB2 = msg.len_FB2;
    }
    else {
      resolved.len_FB2 = 0.0
    }

    if (msg.len_FB3 !== undefined) {
      resolved.len_FB3 = msg.len_FB3;
    }
    else {
      resolved.len_FB3 = 0.0
    }

    if (msg.len_FB4 !== undefined) {
      resolved.len_FB4 = msg.len_FB4;
    }
    else {
      resolved.len_FB4 = 0.0
    }

    return resolved;
    }
};

module.exports = Sensor;
