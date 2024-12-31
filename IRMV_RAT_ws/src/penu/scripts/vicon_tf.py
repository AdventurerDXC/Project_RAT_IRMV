#!/usr/bin/env python
# -*- coding: utf-8 -*-
import rospy
import numpy as np
from geometry_msgs.msg import TransformStamped
from vicon_bridge.msg import Marker
import tf2_ros
import tf_conversions

    
class Marker:
    def __init__(self, marker_name="", x=0.0, y=0.0, z=0.0, occluded=False):
        self.marker_name = marker_name
        self.marker_pos = np.array([x, y, z])
        self.marker_occluded = occluded

    def is_visible(self):
        return not self.marker_occluded


class ViconMarkersRawData:
    def __init__(self, node=None, subject_name="", marker_num=0, topic_name="/vicon/markers", queue_size=10):
        self.subject_name = subject_name
        self.marker_num = marker_num
        self.markers = [Marker() for _ in range(marker_num)]
        self.time_now = 0.0
        self.time_pre = 0.0
        self.freq = 0.0
        self.time_first_flag = True

        self.vicon_markers_sub = rospy.Subscriber(
            topic_name,
            TransformStamped,
            self.vicon_raw_data_callback,
            queue_size=queue_size
        )

    def set_data(self, msg):
        # if not self.check_num(msg):
        #     return False
        # marker_count = 0
        # for marker in msg.markers:
        #     if marker.subject_name == self.subject_name:
        #         self.markers[marker_count] = Marker(
        #             marker.marker_name,
        #             marker.translation.x,
        #             marker.translation.y,
        #             marker.translation.z,
        #             marker.occluded,
        #         )
        #         marker_count += 1
        position = msg.transform.translation
        rotation = msg.transform.rotation

        # 将位置信息保存在self.markers的第一个元素中
        self.markers[0] = Marker(
            marker_name=self.subject_name,
            x=position.x,
            y=position.y,
            z=position.z,
            occluded=False  # 假设TransformStamped没有遮挡信息，直接设为False
        )

        # Calculate frequency
        if not self.time_first_flag:
            self.time_pre = self.time_now
            self.time_now = msg.header.stamp.to_sec()
            self.freq = 1.0 / (self.time_now - self.time_pre)
        else:
            self.time_now = msg.header.stamp.to_sec()
            self.time_first_flag = False
        return True

    def get_markers_data(self):
        return self.markers

    def get_freq(self):
        return self.freq

    def get_connect_status(self):
        return self.freq > 50.0

    def check_num(self, msg):
        count = sum(1 for marker in msg.markers if marker.subject_name == self.subject_name)
        return count == self.marker_num

    def vicon_raw_data_callback(self, msg):
        print("Received message:")
        print(msg)  # 打印整个消息，确认是否收到数据
        self.set_data(msg)

    
class ViconObjectData:
    def __init__(self):
        self.pos = np.zeros(3)
        self.quat = np.array([1.0, 0.0, 0.0, 0.0])
        self.time_now = 0.0
        self.time_pre = 0.0
        self.freq = 0.0
        self.time_first_flag = True
        self.yaw_now = 0.0
        self.yaw_pre = 0.0
        self.yaw_rate = 0.0  # 偏航角变化率

    def set_data(self, px, py, pz, qx, qy, qz, qw, time_s):
        self.pos = np.array([px, py, pz])
        self.quat = np.array([qw, qx, qy, qz])

        if not self.time_first_flag:
            self.time_pre = self.time_now
            self.time_now = time_s
            self.freq = 1.0 / (self.time_now - self.time_pre)

            # 计算当前偏航角
            self.yaw_pre = self.yaw_now
            self.yaw_now = self.get_RPY()[2]  # 获取当前偏航角 (yaw)

            # 计算偏航角变化率
            time_delta = self.time_now - self.time_pre
            if time_delta > 0:
                self.yaw_rate = (self.yaw_now - self.yaw_pre) / time_delta
        else:
            self.time_now = time_s
            self.yaw_now = self.get_RPY()[2]  # 初始化偏航角
            self.time_first_flag = False

    def set_data_from_msg(self, msg):
        self.set_data(
            msg.transform.translation.x,
            msg.transform.translation.y,
            msg.transform.translation.z,
            msg.transform.rotation.x,
            msg.transform.rotation.y,
            msg.transform.rotation.z,
            msg.transform.rotation.w,
            msg.header.stamp.to_sec(),
        )

    def get_pos(self):
        return self.pos

    def get_quat(self):
        return self.quat

    def get_rotation(self):
        w, x, y, z = self.quat
        R = np.array([
            [1 - 2 * y ** 2 - 2 * z ** 2, 2 * x * y - 2 * w * z, 2 * x * z + 2 * w * y],
            [2 * x * y + 2 * w * z, 1 - 2 * x ** 2 - 2 * z ** 2, 2 * y * z - 2 * w * x],
            [2 * x * z - 2 * w * y, 2 * y * z + 2 * w * x, 1 - 2 * x ** 2 - 2 * y ** 2]
        ])
        return R

    def get_RPY(self):
        R = self.get_rotation()
        pitch = np.arcsin(-R[2, 0])
        if abs(pitch) < np.pi / 2:
            roll = np.arctan2(R[2, 1], R[2, 2])
            yaw = np.arctan2(R[1, 0], R[0, 0])
        else:
            roll = 0
            yaw = np.arctan2(-R[0, 1], R[1, 1])
        return np.array([roll, pitch, yaw])

    def get_t(self):
        T = np.eye(4)
        T[:3, :3] = self.get_rotation()
        T[:3, 3] = self.get_pos()
        return T

    def get_freq(self):
        return self.freq

    def get_yaw_rate(self):
        return self.yaw_rate


# Example ROS node setup
if __name__ == "__main__":
    rospy.init_node('penu_vicon_processor')
    
    tf_buffer = tf2_ros.Buffer()
    tf_listener = tf2_ros.TransformListener(tf_buffer)

    # Initialize Vicon data processor (example usage)
    vicon_marker_data = ViconMarkersRawData(
        node=rospy,
        subject_name="paomo",
        marker_num=4,
        topic_name="/vicon/foamboard/foamboard",
        queue_size=10
    )

    vicon_object_data = ViconObjectData()

    another_vicon_object_data = ViconObjectData()
    another_topic_name = "/vicon/ratbot/ratbot"
    rospy.Subscriber(
        another_topic_name,
        TransformStamped,
        another_vicon_object_data.set_data_from_msg,
        queue_size=10
    )
    
    rate = rospy.Rate(10.0)  # 10 Hz
    while not rospy.is_shutdown():
        try:
            # 检查tf树中是否存在该变换，由于Vicon数据可能有延迟，这里使用rospy.Time(0)获取最近的变换
            trans = tf_buffer.lookup_transform('vicon/foamboard/foamboard', 'vicon/ratbot/ratbot', rospy.Time(0))
            print("Translation: ", trans.transform.translation)
            print("Rotation in Quaternion: ", trans.transform.rotation)
        except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException) as e:
            print("Failed to get transform:", e)

    rospy.spin()
