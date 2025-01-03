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

class PreCmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pre_cmd1 = null;
      this.pre_cmd2 = null;
      this.pre_cmd3 = null;
      this.pre_cmd4 = null;
    }
    else {
      if (initObj.hasOwnProperty('pre_cmd1')) {
        this.pre_cmd1 = initObj.pre_cmd1
      }
      else {
        this.pre_cmd1 = 0;
      }
      if (initObj.hasOwnProperty('pre_cmd2')) {
        this.pre_cmd2 = initObj.pre_cmd2
      }
      else {
        this.pre_cmd2 = 0;
      }
      if (initObj.hasOwnProperty('pre_cmd3')) {
        this.pre_cmd3 = initObj.pre_cmd3
      }
      else {
        this.pre_cmd3 = 0;
      }
      if (initObj.hasOwnProperty('pre_cmd4')) {
        this.pre_cmd4 = initObj.pre_cmd4
      }
      else {
        this.pre_cmd4 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PreCmd
    // Serialize message field [pre_cmd1]
    bufferOffset = _serializer.uint16(obj.pre_cmd1, buffer, bufferOffset);
    // Serialize message field [pre_cmd2]
    bufferOffset = _serializer.uint16(obj.pre_cmd2, buffer, bufferOffset);
    // Serialize message field [pre_cmd3]
    bufferOffset = _serializer.uint16(obj.pre_cmd3, buffer, bufferOffset);
    // Serialize message field [pre_cmd4]
    bufferOffset = _serializer.uint16(obj.pre_cmd4, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PreCmd
    let len;
    let data = new PreCmd(null);
    // Deserialize message field [pre_cmd1]
    data.pre_cmd1 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [pre_cmd2]
    data.pre_cmd2 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [pre_cmd3]
    data.pre_cmd3 = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [pre_cmd4]
    data.pre_cmd4 = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'penu/PreCmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '21ac01ccfc8745d307c8c5b188f365f9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # pressure control command
    uint16 pre_cmd1
    uint16 pre_cmd2
    uint16 pre_cmd3
    uint16 pre_cmd4
    
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PreCmd(null);
    if (msg.pre_cmd1 !== undefined) {
      resolved.pre_cmd1 = msg.pre_cmd1;
    }
    else {
      resolved.pre_cmd1 = 0
    }

    if (msg.pre_cmd2 !== undefined) {
      resolved.pre_cmd2 = msg.pre_cmd2;
    }
    else {
      resolved.pre_cmd2 = 0
    }

    if (msg.pre_cmd3 !== undefined) {
      resolved.pre_cmd3 = msg.pre_cmd3;
    }
    else {
      resolved.pre_cmd3 = 0
    }

    if (msg.pre_cmd4 !== undefined) {
      resolved.pre_cmd4 = msg.pre_cmd4;
    }
    else {
      resolved.pre_cmd4 = 0
    }

    return resolved;
    }
};

module.exports = PreCmd;
