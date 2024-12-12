#!/usr/bin/env python
import rospy
import math
from inv_kinematics.msg import footend_pos

def talker():
    pub = rospy.Publisher('/ratbot/footend/pos', footend_pos, queue_size=10)
    rospy.init_node('cpg_node', anonymous=False)
    rate = rospy.Rate(5) # 10hz
    while not rospy.is_shutdown():
        footend_data = footend_pos()
        footend_data.x = 58.44 + 15*math.cos(math.pi*rospy.get_time())
        footend_data.y = 40.15
        footend_data.z = -86.83 + 15*math.sin(math.pi*rospy.get_time())
        rospy.loginfo("Received footend position (%f, %f, %f)", footend_data.x, footend_data.y, footend_data.z)
        pub.publish(footend_data)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass