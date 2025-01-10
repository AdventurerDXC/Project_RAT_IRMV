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

class LenCmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.len_cmd1 = null;
      this.len_cmd2 = null;
      this.len_cmd3 = null;
      this.len_cmd4 = null;
    }
    else {
      if (initObj.hasOwnProperty('len_cmd1')) {
        this.len_cmd1 = initObj.len_cmd1
      }
      else {
        this.len_cmd1 = 0;
      }
      if (initObj.hasOwnProperty('len_cmd2')) {
        this.len_cmd2 = initObj.len_cmd2
      }
      else {
        this.len_cmd2 = 0;
      }
      if (initObj.hasOwnProperty('len_cmd3')) {
        this.len_cmd3 = initObj.len_cmd3
      }
      else {
        this.len_cmd3 = 0;
      }
      if (initObj.hasOwnProperty('len_cmd4')) {
        this.len_cmd4 = initObj.len_cmd4
      }
      else {
        this.len_cmd4 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LenCmd
    // Serialize message field [len_cmd1]
    bufferOffset = _serializer.uint16(obj.len_cmd1, buffer, bufferOffset);
    // Serialize message field [len_cmd2]
    bufferOffset = _serializer.uint16(obj.len_cmd2, buffer, bufferOffset);
    // Serialize message field [len_cmd3]
    bufferOffset = _serializer.uint16(obj.len_cmd3, buffer, bufferOffset);
    // Serialize message field [len_cmd4]
    bufferOffset = _serializer.uint16(obj.len_cmd4, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LenCmd
    let len;
    let data = new LenCmd(null);
    // Deserialize message field [len_cmd1]
    data.len_cmd1 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [len_cmd2]
    data.len_cmd2 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [len_cmd3]
    data.len_cmd3 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [len_cmd4]
    data.len_cmd4 = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'penu/LenCmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0df90e8fef6c46a006fc379e47a36ad2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # length control command
    uint16 len_cmd1
    uint16 len_cmd2
    uint16 len_cmd3
    uint16 len_cmd4
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LenCmd(null);
    if (msg.len_cmd1 !== undefined) {
      resolved.len_cmd1 = msg.len_cmd1;
    }
    else {
      resolved.len_cmd1 = 0
    }

    if (msg.len_cmd2 !== undefined) {
      resolved.len_cmd2 = msg.len_cmd2;
    }
    else {
      resolved.len_cmd2 = 0
    }

    if (msg.len_cmd3 !== undefined) {
      resolved.len_cmd3 = msg.len_cmd3;
    }
    else {
      resolved.len_cmd3 = 0
    }

    if (msg.len_cmd4 !== undefined) {
      resolved.len_cmd4 = msg.len_cmd4;
    }
    else {
      resolved.len_cmd4 = 0
    }

    return resolved;
    }
};

module.exports = LenCmd;
