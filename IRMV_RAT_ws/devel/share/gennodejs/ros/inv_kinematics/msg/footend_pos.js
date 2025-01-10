// Auto-generated. Do not edit!

// (in-package inv_kinematics.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class footend_pos {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.footend_FL = null;
      this.footend_FR = null;
      this.footend_BL = null;
      this.footend_BR = null;
    }
    else {
      if (initObj.hasOwnProperty('footend_FL')) {
        this.footend_FL = initObj.footend_FL
      }
      else {
        this.footend_FL = [];
      }
      if (initObj.hasOwnProperty('footend_FR')) {
        this.footend_FR = initObj.footend_FR
      }
      else {
        this.footend_FR = [];
      }
      if (initObj.hasOwnProperty('footend_BL')) {
        this.footend_BL = initObj.footend_BL
      }
      else {
        this.footend_BL = [];
      }
      if (initObj.hasOwnProperty('footend_BR')) {
        this.footend_BR = initObj.footend_BR
      }
      else {
        this.footend_BR = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type footend_pos
    // Serialize message field [footend_FL]
    bufferOffset = _arraySerializer.float32(obj.footend_FL, buffer, bufferOffset, null);
    // Serialize message field [footend_FR]
    bufferOffset = _arraySerializer.float32(obj.footend_FR, buffer, bufferOffset, null);
    // Serialize message field [footend_BL]
    bufferOffset = _arraySerializer.float32(obj.footend_BL, buffer, bufferOffset, null);
    // Serialize message field [footend_BR]
    bufferOffset = _arraySerializer.float32(obj.footend_BR, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type footend_pos
    let len;
    let data = new footend_pos(null);
    // Deserialize message field [footend_FL]
    data.footend_FL = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [footend_FR]
    data.footend_FR = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [footend_BL]
    data.footend_BL = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [footend_BR]
    data.footend_BR = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.footend_FL.length;
    length += 4 * object.footend_FR.length;
    length += 4 * object.footend_BL.length;
    length += 4 * object.footend_BR.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'inv_kinematics/footend_pos';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9e96999e07cf2518ba50b0eeed74e99c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 四足机器狗的落脚点坐标，各数组长度为3
    float32[] footend_FL  # 左前腿
    float32[] footend_FR  # 右前腿
    float32[] footend_BL  # 左后腿
    float32[] footend_BR  # 右后腿
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new footend_pos(null);
    if (msg.footend_FL !== undefined) {
      resolved.footend_FL = msg.footend_FL;
    }
    else {
      resolved.footend_FL = []
    }

    if (msg.footend_FR !== undefined) {
      resolved.footend_FR = msg.footend_FR;
    }
    else {
      resolved.footend_FR = []
    }

    if (msg.footend_BL !== undefined) {
      resolved.footend_BL = msg.footend_BL;
    }
    else {
      resolved.footend_BL = []
    }

    if (msg.footend_BR !== undefined) {
      resolved.footend_BR = msg.footend_BR;
    }
    else {
      resolved.footend_BR = []
    }

    return resolved;
    }
};

module.exports = footend_pos;
