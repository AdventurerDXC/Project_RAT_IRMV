/*
 * @Description: soft penu control node
 * @Version: 1.0
 * @Author: XiaoHan Zhu
 */

#include <ros/ros.h>
#include <ros/package.h>
#include <iostream>
#include "soft_device/penu_usart.hpp"
#include "penu/Sensor.h"
#include "penu/PreCmd.h"

using namespace std;
using namespace soft_device;

// /etc/udev/50-hand-serial.rules -> KERNEL=="ttyUSB*", ATTRS{idVentor}=="1a86", ATTRS{idProduct}=="7523", MODE="0777", SYMLINK+="hand"
#define UART1_PORT_NAME "/dev/ttyUSB0"   //"/dev/hand" //

class PenuCtrlNode{
public:
    PenuCtrlNode();

    void Rece_Data(void);

private:
    ros::NodeHandle n;

    ros::Subscriber pre_cmd_sub;
    ros::Publisher  sensor_fb_pub;
    void preCmd_callback(penu::PreCmd::ConstPtr msg);

    soft_device::PenuUsart  penu_usart;
};

PenuCtrlNode::PenuCtrlNode(){
    // device init
    if(!penu_usart.connect(UART1_PORT_NAME, 115200, 8, 1000)){
        throw runtime_error("penu ctrl node(main): UART1 Init Error!");
    } 
    // ros mechanism
    pre_cmd_sub     = n.subscribe("/PreCmd", 10, &PenuCtrlNode::preCmd_callback, this);
    sensor_fb_pub   = n.advertise<penu::Sensor>("/SensorFB", 100);
    // print info
    ROS_INFO("Success Init All Device.");
}

void PenuCtrlNode::Rece_Data(void){
    // clear rx buf
    penu_usart.clear_rx_buf();
    // wait for sensor data
    while(!penu_usart.read_data());
    // data protocol
    float pre_FB[ADC_LEN];
    float len_FB[WIRE_SENSOR_NUM];
    penu_usart.get_pre(pre_FB);
    penu_usart.get_len(len_FB);
    
    // msg publish
    penu::Sensor sensor_msg;
    //pressure
    sensor_msg.pre_FB1 = pre_FB[0];
    sensor_msg.pre_FB2 = pre_FB[1];
    sensor_msg.pre_FB3 = pre_FB[2];
    sensor_msg.pre_FB4 = pre_FB[3];

    //len
    sensor_msg.len_FB1 = len_FB[0];
    sensor_msg.len_FB2 = len_FB[1];
    sensor_msg.len_FB3 = len_FB[2];
    sensor_msg.len_FB4 = len_FB[3];
    sensor_fb_pub.publish(sensor_msg);
    // print pressure
    ROS_INFO("publish pressure sensor data: [%.4f, %.4f, %.4f, %.4f]",
        sensor_msg.pre_FB1, sensor_msg.pre_FB2, sensor_msg.pre_FB3, sensor_msg.pre_FB4);
    //print length of every actuator
    ROS_WARN("publish length sensor data: [%.4f, %.4f, %.4f, %.4f]",
        sensor_msg.len_FB1, sensor_msg.len_FB2, sensor_msg.len_FB3, sensor_msg.len_FB4);
}

void PenuCtrlNode::preCmd_callback(penu::PreCmd::ConstPtr msg){
    // pre_cmd data
    uint16_t _cmd[4];
    _cmd[0] = msg->pre_cmd1;
    _cmd[1] = msg->pre_cmd2;
    _cmd[2] = msg->pre_cmd3;
    _cmd[3] = msg->pre_cmd4;
    // send cmd
    penu_usart.set_pre(_cmd);
    // print
    ROS_INFO("Set Cmd: [%d, %d, %d, %d]",
        _cmd[0], _cmd[1], _cmd[2], _cmd[3]);
}

int main(int argc, char** argv){
    // Ros init
    ros::init(argc, argv, "penu_ctrl_node");
    std::shared_ptr<PenuCtrlNode> penu_ctrl_node = std::make_shared<PenuCtrlNode>();
    // loop
    while(ros::ok()){
        // read sensor data and publish
        //ROS_INFO("Come On!!!My data!!!");
        penu_ctrl_node->Rece_Data();

        ros::spinOnce();
    }

    return 0;
}
















