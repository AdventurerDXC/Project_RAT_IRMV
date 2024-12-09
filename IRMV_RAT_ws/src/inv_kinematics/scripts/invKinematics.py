#!/usr/bin/env python
import rospy
import math
from inv_kinematics.msg import footend_pos
from inv_kinematics.msg import motor_pos

motor_data = motor_pos()
leg_serial = 0

def invKinematics(footend_data):
    global motor_data
    global leg_serial
    x = footend_data.x
    y = footend_data.y
    z = footend_data.z
    L1 = 12
    L2 = 35
    L3 = 31.75
    dR = 19.5
    dX = 52.25
    dY = 21
    dZ = 31.15

    real_z = z + dZ
    if leg_serial == 0:
        real_x = x - dX
        real_y = y - dY
    elif leg_serial == 1:
        real_x = x + dX
        real_y = y - dY
    elif leg_serial == 2:
        real_x = x - dX
        real_y = y + dY
    else:
        real_x = x + dX
        real_y = y + dY
    # leg_serial = (leg_serial + 1) % 4

    Zad = math.sqrt(real_x*real_x + real_y*real_y + real_z*real_z - dR*dR)
    gamma1 = math.atan2(Zad, dR)
    gamma2 = math.atan2(math.fabs(real_z), math.fabs(real_y))
    rollAng = gamma2 - gamma1
    deltaAng2_1 = math.asin((real_x*real_x + Zad*Zad - (L1+L3)*(L1+L3) - L2*L2)/2/L2/(L1+L3))
    M = -L2*math.cos(deltaAng2_1)
    N = L1 + L3 + L2*math.sin(deltaAng2_1)
    pitchAng1 = 2*math.atan((N - math.sqrt(M*M + N*N - real_x*real_x))/(M + real_x))
    pitchAng2 = pitchAng1 + deltaAng2_1

    motor_data.rollAng = math.degrees(rollAng)
    motor_data.pitchAng1 = math.degrees(pitchAng1)
    motor_data.pitchAng2 = math.degrees(pitchAng2)
    return motor_data

def callback(footend_data):
    """Receive expected footend position."""
    global motor_data
    # rospy.loginfo("Received footend position (%f, %f, %f)", footend_data.x, footend_data.y, footend_data.z)
    motor_data = invKinematics(footend_data)

def talker():
    """Publish anticipated motor's position."""
    global motor_data
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        rospy.loginfo("Published motor position (%f, %f, %f)", motor_data.rollAng, motor_data.pitchAng1, motor_data.pitchAng2)
        pub.publish(motor_data)
        rate.sleep()

if __name__ == '__main__':
    try:
        rospy.init_node('invKinematics', anonymous=False)
        rospy.Subscriber("/ratbot/footend/pos", footend_pos, callback)
        pub = rospy.Publisher('/ratbot/motor/pos', motor_pos, queue_size=10)
        talker()
    except rospy.ROSInterruptException:
        pass
