/*
 * @Description: soft penu control demo: keyboard input
 * @Version: 1.0
 * @Author: XiaoHan Zhu
 */

/*
Topic Name: /PreCmd
Function:   Subscribe pressure control
Msg Type:   msg/PreCmd.msg

Topic Name: /SensorFB
Function:   Publish sensor feedback
Msg Type:   msg/Sensor.msg
*/ 

#include <ros/ros.h>
#include <ros/package.h>
#include <iostream>

#include "penu/Sensor.h"
#include "penu/PreCmd.h"
#include "penu/LenCmd.h"

#include "soft_device/penu_usart.hpp"

#define UART1_PORT_NAME "/dev/ttyUSB0"  
using namespace std;

class CtrlDemoNode{
public:
    CtrlDemoNode();

    void pre_Cmd_Pub(uint16_t* pre_cmd);
    void len_Cmd_Pub(uint16_t* len_cmd);
private:
    ros::NodeHandle n;

    ros::Publisher  pre_cmd_pub;
    soft_device::PenuUsart  penu_usart;
};

CtrlDemoNode::CtrlDemoNode(){
    // if(!penu_usart.connect(UART1_PORT_NAME, 115200, 8, 1000)){
    //     throw runtime_error("penu ctrl node(main): UART1 Init Error!");
    // } 
    pre_cmd_pub = n.advertise<penu::PreCmd>("/PreCmd", 100);
}

void CtrlDemoNode::pre_Cmd_Pub(uint16_t* pre_cmd){
    // publish cmd 
    penu::PreCmd pre_cmd_msg;
    pre_cmd_msg.pre_cmd1 = pre_cmd[0];
    pre_cmd_msg.pre_cmd2 = pre_cmd[1];
    pre_cmd_msg.pre_cmd3 = pre_cmd[2];
    pre_cmd_msg.pre_cmd4 = pre_cmd[3];
    pre_cmd_pub.publish(pre_cmd_msg);

    penu_usart.set_pre(pre_cmd);
    // print
    ROS_INFO("Publish Cmd: [%d, %d, %d, %d]",
        pre_cmd[0], pre_cmd[1], pre_cmd[2], pre_cmd[3]);
}

void CtrlDemoNode::len_Cmd_Pub(uint16_t* len_cmd){
    // publish cmd 
    penu::LenCmd len_cmd_msg;
    len_cmd_msg.len_cmd1 = len_cmd[0];
    len_cmd_msg.len_cmd2 = len_cmd[1];
    len_cmd_msg.len_cmd3 = len_cmd[2];
    len_cmd_msg.len_cmd4 = len_cmd[3];
    pre_cmd_pub.publish(len_cmd_msg);
    // print
    ROS_INFO("Publish Cmd: [%d, %d, %d, %d]",
        len_cmd[0], len_cmd[1], len_cmd[2], len_cmd[3]);
}


int main(int argc, char** argv){
    // Ros init
    ros::init(argc, argv, "ctrl_demo_node");
    CtrlDemoNode ctrl_demo;
    bool select=0;
    // loop
    while(ros::ok()){
        uint16_t pre_cmd[4];
        uint16_t len_cmd[4];
        std::cout<<"P(0) or L(1)"<<std::endl;
        cin>>select;
        if(!select){
            std::cout << "Enter Pressure Cmd: " << std::endl;
            std::cin >> pre_cmd[0] >> pre_cmd[1] >> pre_cmd[2] >> pre_cmd[3];
            // msg publish
            ctrl_demo.pre_Cmd_Pub(pre_cmd);
            
        }
        else{
            std::cout << "Enter length Cmd: " << std::endl;
            std::cin >> len_cmd[0] >> len_cmd[1] >> len_cmd[2] >> len_cmd[3];
            // msg publish
            ctrl_demo.len_Cmd_Pub(pre_cmd);
        }


        ros::spinOnce();
    }

    return 0;
}
















