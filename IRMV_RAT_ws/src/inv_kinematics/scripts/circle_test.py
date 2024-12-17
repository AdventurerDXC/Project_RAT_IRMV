#!/usr/bin/env python
import rospy
from math import sin, cos, pi
from inv_kinematics.msg import footend_pos

def talker():
    pub = rospy.Publisher('/ratbot/footend/pos', footend_pos, queue_size=10)
    rospy.init_node('cpg_node', anonymous=False)
    rate = rospy.Rate(10) # 10hz
    footend_data = footend_pos()
    while not rospy.is_shutdown():
        x0 = 58.44
        dx = 15*cos(pi*rospy.get_time())
        y = 40.15
        z = -86.83 + 15*sin(pi*rospy.get_time())
        footend_data.footend_FL = [x0+dx, y, z]
        footend_data.footend_FR = [x0+dx, -y, z]
        footend_data.footend_BL = [-x0+dx, y, z]
        footend_data.footend_BR = [-x0+dx, -y, z]
        # rospy.loginfo(f"Received footend-FL position: {footend_data.footend_FL}")
        pub.publish(footend_data)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass