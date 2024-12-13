#!/usr/bin/env python
import rospy
import math
from inv_kinematics.msg import footend_pos

def talker():
    pub = rospy.Publisher('/ratbot/footend/pos', footend_pos, queue_size=10)
    rospy.init_node('cpg_node', anonymous=False)
    rate = rospy.Rate(5) # 10hz
    footend_data = footend_pos()
    while not rospy.is_shutdown():
        x = 58.44 + 15*math.cos(math.pi*rospy.get_time())
        y = 40.15
        z = -86.83 + 15*math.sin(math.pi*rospy.get_time())
        footend_data.footend_FL = [x, y, z]
        footend_data.footend_FR = [x, -y, z]
        footend_data.footend_BL = [-x, y, z]
        footend_data.footend_BR = [-x, -y, z]
        rospy.loginfo(f"Received footend-FL position: {footend_data.footend_FL}")
        pub.publish(footend_data)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass