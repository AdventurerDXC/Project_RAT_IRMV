#!/usr/bin/env python
import rospy
from math import sin, cos, pi
from inv_kinematics.msg import footend_pos

cycle = 4             # 循环周期(4s)
pace = 20             # 步长(mm)
max_phase = 4         # 阶段（分解为4个）
step = cycle/max_phase   # 单步周期(1s)
xf0 = 27              # 起始点足端在身体坐标系下的偏置
xb0 = -67.5
y0 = 40.15
z0 = -90

def step_planner(t, x, d, z, h):
    if t <= step/3:
        z = z + t/(step/3)*(h+10)
    elif t <= 2*step/3:
        z = z + h + 10
        x = x + (t-step/3)/(step/3)*d
    else:
        z = z + h + 10 - (t-2*step/3)/(step/3)*(10)
        x = x + d
    return x, z

def walk_gait(time, phase, height_r=0, height_f=0, pace=pace):
    # walk步态执行函数，pace为足端落脚点的水平距离，height为足端落脚点的高度差, phase为一个步态周期的阶段

    if phase == 0:
        y_fl = y0 - 5
        y_fr = -y0 - 5
        y_bl = y0 - 5
        y_br = -y0 - 5

        x_br, z_br = step_planner(time-phase*step, xb0, pace, z0, height_r)
        x_fr = xf0
        z_fr = z0
        x_bl = xb0
        z_bl = z0
        x_fl = xf0
        z_fl = z0

    elif phase == 1:
        y_fl = y0 - 5
        y_fr = -y0 - 5
        y_bl = y0 - 5
        y_br = -y0 - 5

        x_br = xb0 + pace
        z_br = z0 + height_r
        # z_br = z0
        x_fr, z_fr = step_planner(time-phase*step, xf0, pace, z0, height_f)
        x_bl = xb0
        z_bl = z0
        x_fl = xf0
        z_fl = z0

    elif phase == 2:
        y_fl = y0 + 5
        y_fr = -y0 + 5
        y_bl = y0 + 5
        y_br = -y0 + 5

        x_br = xb0 + pace
        z_br = z0 + height_r
        # z_br = z0
        x_fr = xf0 + pace
        z_fr = z0 + height_f
        x_bl, z_bl = step_planner(time-phase*step, xb0, pace, z0, height_r)
        x_fl = xf0
        z_fl = z0

    elif phase == 3:
        y_fl = y0 + 5
        y_fr = -y0 + 5
        y_bl = y0 + 5
        y_br = -y0 + 5

        x_br = xb0 + pace
        z_br = z0 + height_r
        # z_br = z0
        x_fr = xf0 + pace
        z_fr = z0 + height_f
        x_bl = x_br
        z_bl = z_br
        x_fl, z_fl = step_planner(time-phase*step, xf0, pace, z0, height_f)

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
    phase = 0
    ref_time = rospy.get_time()
    footend_data = footend_pos()
    height_list = [[0,15], [0,0], [0,0], [0,0], [0,0], [0,0], [15,0]]
    i = 0
    
    while not rospy.is_shutdown():
        time = rospy.get_time() - ref_time
        if time - phase*step >= step:
            phase = (phase + 1) % max_phase
        if time >= cycle:  # 一个完整的运动周期结束walk
            ref_time = rospy.get_time()
            time = 0
            i = i + 1

        if i <= 1:    
            footendXYZ = walk_gait(time, phase, 0, 16)
        else:
            footendXYZ = walk_gait(time, phase, 0, 0)
        
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