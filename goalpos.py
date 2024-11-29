#!/usr/bin/env python
# -*- coding: utf-8 -*-


import rospy
from geometry_msgs.msg import Vector3, Twist
from std_msgs.msg import Float64
import numpy as np
import math

# 全局变量初始化
x_pg = 0.0
y_pg = 0.0
v_xg = 0.0
v_yg = 0.0
w_g = 0.0
v_w =0.0

#已知值
X_li =0.0
Y_li =0.0
R = 0.0
x_li =0.0
y_li =0.0
x_b_dot =0.0
y_b_dot =0.0
x_g =0.0
y_g =0.0

def position_callback(msg):
    global x_pg, y_pg
    x_pg = msg.x
    y_pg = msg.y
    rospy.loginfo("Updated Position - x_pg: %.2f, y_pg: %.2f", x_pg, y_pg)

def velocity_callback(msg):
    global v_xg, v_yg
    v_xg = msg.linear.x
    v_yg = msg.linear.y
    rospy.loginfo("Updated Velocity - v_xg: %.2f, v_yg: %.2f", v_xg, v_yg)

def yaw_callback(msg):
    global w_g
    w_g = msg.data
    rospy.loginfo("Updated Yaw Angle - w_g: %.2f", w_g)

def yaw_rate_callback(msg):
    global v_w
    v_wg = msg.data
    rospy.loginfo("Updated Yaw Angle rate - v_wg: %.2f", v_wg)


def compute_velocity():
    x_li_dot = v_w*y_li - x_b_dot
    y_li_dot = -(v_w*x_li)- y_b_dot
    
    return x_li_dot,y_li_dot

def calculate_T_stance():
    
    x_li_dot,y_li_dot = compute_velocity()
    denominator = max(
        (X_li * v_w + y_li_dot) ** 2 + (Y_li * v_w - x_li_dot) ** 2
    )
    T_stance_value = 2 * math.sqrt(R**2 / denominator)
    
    return T_stance_value

def calculate_x_y_goal(X_li, Y_li):
 
    x_li,y_li = compute_velocity()
    T_stance = calculate_T_stance()
    x_li_goal = (Y_li * v_w - x_li) * (T_stance / 2) + X_li
    y_li_goal = -(X_li * v_w + y_li) * (T_stance / 2) + Y_li
    return x_li_goal, y_li_goal

def transform_coordinates():
    # 旋转矩阵
    rotation_matrix = np.array([
        [np.cos(w_g), -np.sin(w_g)],
        [np.sin(w_g),  np.cos(w_g)]
    ])
    
    # 原坐标
    x_p_b,y_p_b=calculate_x_y_goal()
    local_coords = np.array([x_p_b, y_p_b])
    
    # 全局坐标计算
    goalpos= np.dot(rotation_matrix, local_coords) + np.array([x_g, y_g])
    
    return goalpos[0], goalpos[1]


if __name__ == "__main__":
    rospy.init_node('uav_data_subscriber')

    goalpos_publisher = rospy.Publisher('/uav/goalpos', Vector3, queue_size=10)

    # 订阅三个话题
    rospy.Subscriber('/uav/position', Vector3, position_callback)
    rospy.Subscriber('/uav/velocity', Twist, velocity_callback)
    rospy.Subscriber('/uav/yaw', Float64, yaw_callback)
    rospy.Subscriber('/uav/yaw_rate', Float64, yaw_rate_callback)

    rospy.loginfo("Subscribed to UAV data topics: /uav/position, /uav/velocity, /uav/yaw,/uav/yaw_rate")

    # 主循环
    rate = rospy.Rate(10)  # 10 Hz
    while not rospy.is_shutdown():
        goal_x, goal_y = transform_coordinates()
        
        # 发布目标位置
        goalpos_msg = Vector3()
        goalpos_msg.x = goal_x
        goalpos_msg.y = goal_y
        goalpos_msg.z = 0.0  # 假设目标位置的 z 值为 0
        goalpos_publisher.publish(goalpos_msg)
        
        rospy.loginfo("Published Goal Position - x: %.2f, y: %.2f", goal_x, goal_y)
        
        rate.sleep()