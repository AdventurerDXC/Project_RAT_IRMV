#!/usr/bin/env python
import rospy
from math import sin, cos, pi
from inv_kinematics.msg import footend_pos

dutyRatio = 0.75  # 占空比为0.75个周期
cycle = 0.5         # 单步周期
time = 0          # 当前时刻
step = 0.05       # 步长
rhythm = 0        # 步态节律（偶数为左前和右后腿摆动，奇数为右前和左后腿摆动）
xf0 = 38          # 起始点足端在vicon坐标系下的偏置
xb0 = -56.5
y0 = 40.15
z0 = -90

def trot_gait(time, rhythm, pace, height):
    # 小跑步态执行函数，pace为摆线的垂直投影长度，height为摆线的最大高度
    t1 = cycle*(1-dutyRatio)/2
    t2 = cycle - t1
    valid_t_range1 = (time > t1)
    valid_t_range2 = (time < t2)
    sigma = 2 * pi * (time - t1) / (cycle * dutyRatio)
    zt = height * (1 - cos(sigma)) / 2
    xt = pace * ((sigma - sin(sigma)) / (2 * pi))

    # 输出y
    y_fl = y0
    y_fr = -y0
    y_bl = y0
    y_br = -y0

    if rhythm % 2 == 0:
        z_fr = z0
        z_bl = z0

        if valid_t_range1 and valid_t_range2:
            x_fl = xf0 + xt
            x_br = xb0 + xt
            x_fr = xf0 + pace - xt
            x_bl = xb0 + pace - xt
            z_fl = z0 + zt
            z_br = z0 + zt
        if not valid_t_range1:
            x_fl = xf0
            x_br = xb0
            x_fr = xf0 + pace
            x_bl = xb0 + pace
            z_fl = z0
            z_br = z0
        if not valid_t_range2:
            x_fl = xf0 + pace
            x_br = xb0 + pace
            x_fr = xf0
            x_bl = xb0
            z_fl = z0
            z_br = z0

    else:
        z_fl = z0
        z_br = z0

        if valid_t_range1 and valid_t_range2:  
            x_fr = xf0 + xt
            x_bl = xb0 + xt
            x_fl = xf0 + pace - xt
            x_br = xb0 + pace - xt
            z_fr = z0 + zt
            z_bl = z0 + zt
        if not valid_t_range1:
            x_fr = xf0
            x_bl = xb0
            x_fl = xf0 + pace
            x_br = xb0 + pace
            z_fr = z0
            z_bl = z0
        if not valid_t_range2:
            x_fr = xf0 + pace
            x_bl = xb0 + pace
            x_fl = xf0
            x_br = xb0
            z_fr = z0
            z_bl = z0


    return x_fl, x_fr, x_bl, x_br, y_fl, y_fr, y_bl, y_br, z_fl, z_fr, z_bl, z_br

def initialize():
    init_time = rospy.get_time() + 5
    footend_data = footend_pos()
    footend_data.footend_FL = [xf0, y0, z0]
    footend_data.footend_FR = [xf0, -y0, z0]
    footend_data.footend_BL = [xb0, y0, z0]
    footend_data.footend_BR = [xb0, -y0, z0]
    while not rospy.is_shutdown() and rospy.get_time() < init_time:
        pub.publish(footend_data)
        rate.sleep()

def talker():
    global time, rhythm
    footend_data = footend_pos()
    
    while not rospy.is_shutdown():
        if time >= cycle:  # 一个完整的运动周期结束trot
            time = 0
        else:
            time += step
            rhythm += 1
            
        footendXYZ = trot_gait(time, rhythm, 20, 20)

        footend_data.footend_FL = [footendXYZ[0], footendXYZ[4], footendXYZ[8]]
        footend_data.footend_FR = [footendXYZ[1], footendXYZ[5], footendXYZ[9]]
        footend_data.footend_BL = [footendXYZ[2], footendXYZ[6], footendXYZ[10]]
        footend_data.footend_BR = [footendXYZ[3], footendXYZ[7], footendXYZ[11]]

        # rospy.loginfo(f"Received footend-FL position: {footend_data.footend_FL}")
        pub.publish(footend_data)
        rate.sleep()


if __name__ == '__main__':
    try:
        rospy.init_node('cpg_node', anonymous=False)
        pub = rospy.Publisher('/ratbot/footend/pos', footend_pos, queue_size=10)
        rate = rospy.Rate(20)  # 20hz
        initialize()
        talker()
    except rospy.ROSInterruptException:
        pass