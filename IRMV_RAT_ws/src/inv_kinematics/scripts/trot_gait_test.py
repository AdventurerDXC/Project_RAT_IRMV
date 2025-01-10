#!/usr/bin/env python
import rospy
from math import sin, cos, pi
from inv_kinematics.msg import footend_pos

dutyRatio = 0.5  # 占空比为0.75个周期
cycle = 1         # 单步周期
time = 0          # 当前时刻
step = 0.05       # 步长
rhythm = 0        # 步态节律（偶数为左前和右后腿摆动，奇数为右前和左后腿摆动）
xf0 = 58          # 起始点足端在vicon坐标系下的偏置
xb0 = -36.5
y0 = 40.15
z0 = -90

def trot_gait(time, rhythm, pace, height):
    # 小跑步态执行函数，pace为摆线的垂直投影长度，height为摆线的最大高度
    t1 = cycle*(1-dutyRatio)/2
    t2 = 1-t1
    valid_t_range1 = (time > t1)
    valid_t_range2 = (time < t2)
    sigma = 2 * pi * (time - t1) / (dutyRatio * cycle)
    zt = height * (1 - cos(sigma)) / 2
    xt = pace * ((sigma - sin(sigma)) / (2 * pi))

    # 输出y
    y_fl = y0
    y_fr = -y0
    y_bl = y0
    y_br = -y0

    if rhythm % 2 == 0:
        x_fr = xf0
        x_bl = xb0
        z_fr = z0
        z_bl = z0

        if valid_t_range1 and valid_t_range2:
            x_fl = xf0 + xt
            x_br = xb0 + xt
            z_fl = z0 + zt
            z_br = z0 + zt
        if not valid_t_range1:
            x_fl = xf0
            x_br = xb0
            z_fl = z0
            z_br = z0
        if not valid_t_range2:
            x_fl = xf0 + pace - pace * (time - t2)/(cycle - t2)
            x_br = xb0 + pace - pace * (time - t2)/(cycle - t2)
            z_fl = z0
            z_br = z0
        if abs(time - t2)  <= step:
            x_fr -= pace * 0.1
            x_bl -= pace * 0.1
            # z_fr = z0 + 2
            # z_bl = z0 + 2
    else:
        x_fl = xf0
        x_br = xb0
        z_fl = z0
        z_br = z0

        if valid_t_range1 and valid_t_range2:  
            x_fr = xf0 + xt
            x_bl = xb0 + xt
            z_fr = z0 + zt
            z_bl = z0 + zt
        if not valid_t_range1:
            x_fr = xf0
            x_bl = xb0
            z_fr = z0
            z_bl = z0
        if not valid_t_range2:
            x_fr = xf0 + pace - pace * (time - t2)/(cycle - t2)
            x_bl = xb0 + pace - pace * (time - t2)/(cycle - t2)
            z_fr = z0
            z_bl = z0
        if abs(time - (1-cycle*(1-dutyRatio)/2)) <= step:
            x_fl -= pace * 0.05
            x_br -= pace * 0.05
            # z_fl = z0 + 2
            # z_br = z0 + 2

    return x_fl, x_fr, x_bl, x_br, y_fl, y_fr, y_bl, y_br, z_fl, z_fr, z_bl, z_br

def initialize():
    
    footend_data = footend_pos()
    footend_data.footend_FL = [xf0, y0, z0]
    footend_data.footend_FR = [xf0, -y0, z0]
    footend_data.footend_BL = [xb0, y0, z0]
    footend_data.footend_BR = [xb0, -y0, z0]
    for _ in range(5):  # 每隔0.2秒发布一次初始化数据
        pub.publish(footend_data)
        rospy.sleep(0.2)

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