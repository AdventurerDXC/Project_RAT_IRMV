#!/usr/bin/env python
import rospy
from math import sin, cos, pi
from inv_kinematics.msg import footend_pos

dutyRatio = 0.5  # 占空比为0.5个周期
cycle = 1        # 循环周期
time = 0         # 当前时刻
step = 0.05     # 步长
x0 = 58          # 起始点足端在vicon坐标系下的偏置
y0 = 40.15
z0 = -85

def trot_gait(time, pace, height):
    # 小跑步态执行函数，pace为摆线的垂直投影长度，height为摆线的最大高度
    sigma = 2 * pi * time / (dutyRatio * cycle)
    zt = height * (1 - cos(sigma)) / 2
    xt = pace * ((sigma - sin(sigma)) / (2 * pi))

    # 输出y
    y_fl = y0
    y_fr = -y0
    y_bl = y0
    y_br = -y0

    if time <= dutyRatio*cycle:
        # 输出x
        x_fl = x0 + xt
        x_fr = x0
        x_bl = -x0
        x_br = -x0 + xt
        # 输出z
        z_fl = z0 + zt
        z_fr = z0
        z_bl = z0
        z_br = z0 + zt
    else:
        # 输出x
        x_fl = x0
        x_fr = x0 + xt
        x_bl = -x0 + xt
        x_br = -x0
        # 输出z
        z_fl = z0
        z_fr = z0 + zt
        z_bl = z0 + zt
        z_br = z0

    return x_fl, x_fr, x_bl, x_br, y_fl, y_fr, y_bl, y_br, z_fl, z_fr, z_bl, z_br

def talker():
    global time
    pub = rospy.Publisher('/ratbot/footend/pos', footend_pos, queue_size=10)
    rospy.init_node('cpg_node', anonymous=False)
    rate = rospy.Rate(20)  # 20hz
    footend_data = footend_pos()
    
    while not rospy.is_shutdown():
        if time >= cycle:  # 一个完整的运动周期结束trot
            time = 0
        else:
            time += step
            footendXYZ = trot_gait(time, 20, 15)

        footend_data.footend_FL = [footendXYZ[0], footendXYZ[4], footendXYZ[8]]
        footend_data.footend_FR = [footendXYZ[1], footendXYZ[5], footendXYZ[9]]
        footend_data.footend_BL = [footendXYZ[2], footendXYZ[6], footendXYZ[10]]
        footend_data.footend_BR = [footendXYZ[3], footendXYZ[7], footendXYZ[11]]

        rospy.loginfo(f"Received footend-FL position: {footend_data.footend_FL}")
        pub.publish(footend_data)
        rate.sleep()


if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass