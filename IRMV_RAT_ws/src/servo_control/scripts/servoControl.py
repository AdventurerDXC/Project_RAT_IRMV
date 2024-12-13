#!/usr/bin/env python
import rospy
import serial
from inv_kinematics.msg import servo_pos

LOBOT__FRAME_HEADER              = 0x55
LOBOT_CMD_SERVO_MOVE             = 3
LOBOT_CMD_ACTION_GROUP_RUN       = 6
LOBOT_CMD_ACTION_GROUP_STOP      = 7
LOBOT_CMD_ACTION_GROUP_SPEED     = 11
LOBOT_CMD_GET_BATTERY_VOLTAGE    = 15

serialHandle = serial.Serial("/dev/ttyUSB0", 9600)  # 初始化串口， 波特率为9600

# 控制单个PWM舵机转动
def setPWMServoMove(servo_id, servo_pulse, time):
    buf = bytearray(b'\x55\x55')  # 帧头
    buf.append(0x08)  # 数据长度
    buf.append(LOBOT_CMD_SERVO_MOVE)  # 指令
    buf.append(0x01)  # 要控制的舵机个数

    time = 0 if time < 0 else time
    time = 30000 if time > 30000 else time
    time_list = list(time.to_bytes(2, 'little'))  # 时间
    buf.append(time_list[0])
    buf.append(time_list[1])

    servo_id = 254 if (servo_id < 1 or servo_id > 254) else servo_id
    buf.append(servo_id)  # 舵机ID

    servo_pulse = 500 if servo_pulse < 500 else servo_pulse
    servo_pulse = 2500 if servo_pulse > 2500 else servo_pulse
    pulse_list = list(servo_pulse.to_bytes(2, 'little'))  # 位置
    buf.append(pulse_list[0])
    buf.append(pulse_list[1])

    serialHandle.write(buf)

# 控制多个PWM舵机转动
def setPWMServoMoveByArray(servos, servos_count, time):
    buf = bytearray(b'\x55\x55')  # 帧头
    buf.append(servos_count * 3 + 5)  # 数据长度
    buf.append(LOBOT_CMD_SERVO_MOVE)  # 指令

    servos_count = 1 if servos_count < 1 else servos_count
    servos_count = 254 if servos_count > 254 else servos_count
    buf.append(servos_count)  # 要控制的舵机个数

    time = 0 if time < 0 else time
    time = 30000 if time > 30000 else time
    time_list = list(time.to_bytes(2, 'little'))
    buf.append(time_list[0])  # 时间
    buf.append(time_list[1])

    for i in range(servos_count):
        buf.append(servos[i * 2])  # 舵机ID

        pos = servos[i * 2 + 1]
        pos = 500 if pos < 500 else pos
        pos = 2500 if pos > 2500 else pos
        pos_list = list(pos.to_bytes(2, 'little'))
        buf.append(pos_list[0])  # 位置
        buf.append(pos_list[1])

    serialHandle.write(buf)

def listener():
    rospy.init_node('servo_control', anonymous=False)
    rospy.Subscriber("/ratbot/servo/pos", servo_pos, callback)

    rospy.spin()

def callback(servo_data):
    rospy.loginfo("Received servo-FL position: {servo_data.leg_FL}")
    servoPulse = [list(servo_data.leg_FL), list(servo_data.leg_FR), list(servo_data.leg_BL), list(servo_data.leg_BR)]
    for i in range(len(servoPulse)):
        servoPulse[i][0] = int(1500 + servoPulse[i][0] / 180 * 2000)
        servoPulse[i][1] = int(1500 + (servoPulse[i][1] - 45) / 180 * 2000)
        servoPulse[i][2] = int(1500 + (servoPulse[i][2] - 45) / 180 * 2000)
        servoPulse[i].insert(0, 3*i)
        servoPulse[i].insert(2, 3*i+1)
        servoPulse[i].insert(4, 3*i+2)

    servoPulse = sum(servoPulse, [])
    setPWMServoMoveByArray(servoPulse, 12, 200)

if __name__ == '__main__':
    listener()