#!/usr/bin/env python
import rospy
import math
from inv_kinematics.msg import footend_pos
from inv_kinematics.msg import servo_pos

servo_data = servo_pos()

def invKinematics(footend_data):
    global servo_data
    FL = list(footend_data.footend_FL)
    FR = list(footend_data.footend_FR)
    BL = list(footend_data.footend_BL)
    BR = list(footend_data.footend_BR)
    L1 = 12
    L2 = 35
    L3 = 31.75
    dR = 19.5
    dX = 52.25
    dY = 21
    dZ = 31.15

    FL[0] -= dX
    FL[1] -= dY
    FL[2] += dZ
    FR[0] -= dX
    FR[1] += dY
    FR[2] += dZ
    BL[0] += dX
    BL[1] -= dY
    BL[2] += dZ
    BR[0] += dX
    BR[1] += dY
    BR[2] += dZ
    footend_list = [FL, FR, BL, BR]
    servopos_list = []

    for leg in footend_list:
        [x, y, z] = leg
        Zad = math.sqrt(y*y + z*z - dR*dR)
        gamma1 = math.atan2(Zad, dR)
        gamma2 = math.atan2(math.fabs(z), math.fabs(y))
        rollAng = math.degrees(gamma2 - gamma1)
        deltaAng2_1 = math.asin((x*x + Zad*Zad - (L1+L3)*(L1+L3) - L2*L2)/2/L2/(L1+L3))
        M = -L2*math.cos(deltaAng2_1)
        N = L1 + L3 + L2*math.sin(deltaAng2_1)
        pitchAng1 = math.degrees(2*math.atan((N - math.sqrt(M*M + N*N - x*x))/(M + x)))
        pitchAng2 = math.degrees(pitchAng1 + deltaAng2_1)
        servopos_list.append([rollAng, pitchAng1, pitchAng2])

    servo_data.leg_FL = servopos_list[0]
    servo_data.leg_FR = servopos_list[1]
    servo_data.leg_BL = servopos_list[2]
    servo_data.leg_BR = servopos_list[3]

    return servo_data

def callback(footend_data):
    """Receive expected footend position."""
    global servo_data
    servo_data = invKinematics(footend_data)

def talker():
    """Publish anticipated motor's position."""
    global servo_data
    rate = rospy.Rate(5) # 10hz
    while not rospy.is_shutdown():
        rospy.loginfo(f"Published servo-FL position: {servo_data.leg_FL}")
        pub.publish(servo_data)
        rate.sleep()

if __name__ == '__main__':
    try:
        rospy.init_node('inv_kinematics', anonymous=False)
        rospy.Subscriber("/ratbot/footend/pos", footend_pos, callback)
        pub = rospy.Publisher('/ratbot/servo/pos', servo_pos, queue_size=10)
        talker()
    except rospy.ROSInterruptException:
        pass
