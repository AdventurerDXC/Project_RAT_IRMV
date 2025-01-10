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

class servo_pos {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.servo_FL = null;
      this.servo_FR = null;
      this.servo_BL = null;
      this.servo_BR = null;
    }
    else {
      if (initObj.hasOwnProperty('servo_FL')) {
        this.servo_FL = initObj.servo_FL
      }
      else {
        this.servo_FL = [];
      }
      if (initObj.hasOwnProperty('servo_FR')) {
        this.servo_FR = initObj.servo_FR
      }
      else {
        this.servo_FR = [];
      }
      if (initObj.hasOwnProperty('servo_BL')) {
        this.servo_BL = initObj.servo_BL
      }
      else {
        this.servo_BL = [];
      }
      if (initObj.hasOwnProperty('servo_BR')) {
        this.servo_BR = initObj.servo_BR
      }
      else {
        this.servo_BR = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type servo_pos
    // Serialize message field [servo_FL]
    bufferOffset = _arraySerializer.float32(obj.servo_FL, buffer, bufferOffset, null);
    // Serialize message field [servo_FR]
    bufferOffset = _arraySerializer.float32(obj.servo_FR, buffer, bufferOffset, null);
    // Serialize message field [servo_BL]
    bufferOffset = _arraySerializer.float32(obj.servo_BL, buffer, bufferOffset, null);
    // Serialize message field [servo_BR]
    bufferOffset = _arraySerializer.float32(obj.servo_BR, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type servo_pos
    let len;
    let data = new servo_pos(null);
    // Deserialize message field [servo_FL]
    data.servo_FL = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [servo_FR]
    data.servo_FR = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [servo_BL]
    data.servo_BL = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [servo_BR]
    data.servo_BR = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.servo_FL.length;
    length += 4 * object.servo_FR.length;
    length += 4 * object.servo_BL.length;
    length += 4 * object.servo_BR.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'inv_kinematics/servo_pos';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '227a6f2238ca813c514b004a793abc3a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 四足机器狗的舵机目标角度，各数组长度为3
    float32[] servo_FL  # 左前腿
    float32[] servo_FR  # 右前腿
    float32[] servo_BL  # 左后腿
    float32[] servo_BR  # 右后腿
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new servo_pos(null);
    if (msg.servo_FL !== undefined) {
      resolved.servo_FL = msg.servo_FL;
    }
    else {
      resolved.servo_FL = []
    }

    if (msg.servo_FR !== undefined) {
      resolved.servo_FR = msg.servo_FR;
    }
    else {
      resolved.servo_FR = []
    }

    if (msg.servo_BL !== undefined) {
      resolved.servo_BL = msg.servo_BL;
    }
    else {
      resolved.servo_BL = []
    }

    if (msg.servo_BR !== undefined) {
      resolved.servo_BR = msg.servo_BR;
    }
    else {
      resolved.servo_BR = []
    }

    return resolved;
    }
};

module.exports = servo_pos;
