#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import rospy
import numpy as np
from geometry_msgs.msg import TransformStamped, Twist, Vector3
from std_msgs.msg import Float64

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
        position = msg.transform.translation
        rotation = msg.transform.rotation

        # Save position in the first marker
        self.markers[0] = Marker(
            marker_name=self.subject_name,
            x=position.x,
            y=position.y,
            z=position.z,
            occluded=False  # Assuming TransformStamped doesn't have occlusion info
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

    def vicon_raw_data_callback(self, msg):
        print("Received message:")
        print(msg)  # Print full message to check data
        self.set_data(msg)


class ViconObjectData:
    def __init__(self):
        self.pos = np.zeros(3)
        self.quat = np.array([1.0, 0.0, 0.0, 0.0])  # Quaternion variable
        self.time_now = 0.0
        self.time_pre = 0.0
        self.freq = 0.0
        self.time_first_flag = True
        self.velocity = np.zeros(3)  # Velocity variable
        self.prev_yaw = 0.0  # 上一次的偏航角
        self.yaw_rate = 0.0  # 偏航角变化率

    def set_data(self, px, py, pz, qx, qy, qz, qw, time_s):
        new_pos = np.array([px, py, pz])  # New position
        current_yaw = self.get_RPY()[2]  # 当前偏航角（弧度）
        if not self.time_first_flag:
            self.time_pre = self.time_now
            self.time_now = time_s
            time_diff = self.time_now - self.time_pre
            if time_diff > 0:  # Ensure non-zero time difference
                self.velocity = (new_pos - self.pos) / time_diff  # Compute velocity
                self.yaw_rate = (current_yaw - self.prev_yaw) / time_diff  # 计算偏航角变化率
            else:
                self.velocity = np.zeros(3)  # Zero velocity if time diff is invalid
                self.yaw_rate = 0.0
        else:
            self.time_now = time_s
            self.time_first_flag = False
        self.prev_yaw = current_yaw
        self.pos = new_pos
        self.quat = np.array([qw, qx, qy, qz])

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

    def get_yaw_rate(self):
        return self.yaw_rate

    def get_pos(self):
        return self.pos

    def get_velocity(self):
        return self.velocity  # Get velocity

    def get_quat(self):
        return self.quat

    def get_rotation(self):  # 四元数 -> 旋转矩阵
        w, x, y, z = self.quat
        R = np.array([
            [1 - 2 * y ** 2 - 2 * z ** 2, 2 * x * y - 2 * w * z, 2 * x * z + 2 * w * y],
            [2 * x * y + 2 * w * z, 1 - 2 * x ** 2 - 2 * z ** 2, 2 * y * z - 2 * w * x],
            [2 * x * z - 2 * w * y, 2 * y * z + 2 * w * x, 1 - 2 * x ** 2 - 2 * y ** 2]
        ])
        return R

    def get_RPY(self):  # 四元数 -> 欧拉角
        R = self.get_rotation()
        pitch = np.arcsin(-R[2, 0])
        if abs(pitch) < np.pi / 2:
            roll = np.arctan2(R[2, 1], R[2, 2])
            yaw = np.arctan2(R[1, 0], R[0, 0])
        else:
            roll = 0
            yaw = np.arctan2(-R[0, 1], R[1, 1])
        return np.array([roll, pitch, yaw])

    def get_t(self):  # 获得4x4齐次变换矩阵
        T = np.eye(4)
        T[:3, :3] = self.get_rotation()
        T[:3, 3] = self.get_pos()
        return T

    def get_freq(self):
        return self.freq


if __name__ == "__main__":
    rospy.init_node('penu_vicon_processor')

    # Initialize Vicon data processor (example usage)
    # vicon_marker_data = ViconMarkersRawData(
    #     node=rospy,
    #     subject_name="softUAV",
    #     marker_num=4,
    #     topic_name="/vicon/ts1/ts1",
    #     queue_size=10
    # )

    vicon_object_data = ViconObjectData()

    # Define publishers
    pos_pub = rospy.Publisher('/ratbot/position', Vector3, queue_size=10)
    vel_pub = rospy.Publisher('/ratbot/velocity', Twist, queue_size=10)
    yaw_pub = rospy.Publisher('/ratbot/yaw', Float64, queue_size=10)
    yaw_rate_pub = rospy.Publisher('/ratbot/yaw_rate', Float64, queue_size=10)


    # Callback function to process and publish data
    def vicon_callback(data):
        vicon_object_data.set_data_from_msg(data)

        # Publish position
        pos_msg = Vector3()
        pos_msg.x, pos_msg.y, pos_msg.z = vicon_object_data.get_pos()
        pos_pub.publish(pos_msg)

        # Publish velocity
        vel_msg = Twist()
        vel_msg.linear.x, vel_msg.linear.y, vel_msg.linear.z = vicon_object_data.get_velocity()
        vel_pub.publish(vel_msg)

        # Publish yaw angle
        yaw_msg = Float64()
        yaw_msg.data = vicon_object_data.get_RPY()[2]  # Yaw angle
        yaw_pub.publish(yaw_msg)

        yaw_rate_msg = Float64()
        yaw_rate_msg.data = vicon_object_data.get_yaw_rate()  # 偏航角变化率
        yaw_rate_pub.publish(yaw_rate_msg)

        rospy.loginfo("Published Position: %.2f, %.2f, %.2f | Velocity: %.2f, %.2f, %.2f | Yaw: %.2f | Yaw Rate: %.2f",
                  pos_msg.x, pos_msg.y, pos_msg.z,
                  vel_msg.linear.x, vel_msg.linear.y, vel_msg.linear.z,
                  yaw_msg.data, yaw_rate_msg.data)

    rospy.Subscriber('/vicon/ratbot/ratbot', TransformStamped, vicon_callback)

    rospy.spin()
