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
      this.legID = null;
      this.rollAng = null;
      this.pitchAng1 = null;
      this.pitchAng2 = null;
    }
    else {
      if (initObj.hasOwnProperty('legID')) {
        this.legID = initObj.legID
      }
      else {
        this.legID = 0;
      }
      if (initObj.hasOwnProperty('rollAng')) {
        this.rollAng = initObj.rollAng
      }
      else {
        this.rollAng = 0.0;
      }
      if (initObj.hasOwnProperty('pitchAng1')) {
        this.pitchAng1 = initObj.pitchAng1
      }
      else {
        this.pitchAng1 = 0.0;
      }
      if (initObj.hasOwnProperty('pitchAng2')) {
        this.pitchAng2 = initObj.pitchAng2
      }
      else {
        this.pitchAng2 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type servo_pos
    // Serialize message field [legID]
    bufferOffset = _serializer.int64(obj.legID, buffer, bufferOffset);
    // Serialize message field [rollAng]
    bufferOffset = _serializer.float64(obj.rollAng, buffer, bufferOffset);
    // Serialize message field [pitchAng1]
    bufferOffset = _serializer.float64(obj.pitchAng1, buffer, bufferOffset);
    // Serialize message field [pitchAng2]
    bufferOffset = _serializer.float64(obj.pitchAng2, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type servo_pos
    let len;
    let data = new servo_pos(null);
    // Deserialize message field [legID]
    data.legID = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [rollAng]
    data.rollAng = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pitchAng1]
    data.pitchAng1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pitchAng2]
    data.pitchAng2 = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'inv_kinematics/servo_pos';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9869e38db82380d0fa3c5aff4375b3b3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 legID
    float64 rollAng
    float64 pitchAng1
    float64 pitchAng2
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new servo_pos(null);
    if (msg.legID !== undefined) {
      resolved.legID = msg.legID;
    }
    else {
      resolved.legID = 0
    }

    if (msg.rollAng !== undefined) {
      resolved.rollAng = msg.rollAng;
    }
    else {
      resolved.rollAng = 0.0
    }

    if (msg.pitchAng1 !== undefined) {
      resolved.pitchAng1 = msg.pitchAng1;
    }
    else {
      resolved.pitchAng1 = 0.0
    }

    if (msg.pitchAng2 !== undefined) {
      resolved.pitchAng2 = msg.pitchAng2;
    }
    else {
      resolved.pitchAng2 = 0.0
    }

    return resolved;
    }
};

module.exports = servo_pos;
