/*
 * @Description: demo for vicon data receive
 * @Version: 1.0
 * @Author: XiaoHan Zhu
 */

#include <ros/ros.h>
#include <ros/package.h>
#include <geometry_msgs/TransformStamped.h>
#include <Eigen/Eigen>
#include <cmath>
#include <iostream>
#include <memory>
#include "soft_device/penu_vicon.hpp"

#define VICON_TOPIC_NAME "/vicon/ASoftJoint/ASoftJoint"

class ViconReceDemoNode{
public:
    ViconReceDemoNode();

    const soft_device::ViconMarkersRawData::Ptr& get_vicon_raw_data(void);

private:
    ros::NodeHandle n_;

    ros::Subscriber vicon_sub_;
    soft_device::ViconObjectData::Ptr       p_vicon_data_;
    soft_device::ViconMarkersRawData::Ptr   p_vicon_raw_data_;

    void vicon_callback(const geometry_msgs::TransformStamped::ConstPtr& msg);

};


ViconReceDemoNode::ViconReceDemoNode(){
    p_vicon_data_ = std::make_shared<soft_device::ViconObjectData>();
    p_vicon_raw_data_ = std::make_shared<soft_device::ViconMarkersRawData>(
        n_, 
        "newUAV", 4
    );
    // subscribe vicon data
    vicon_sub_ = n_.subscribe(std::string("/vicon/ASoftJoint/ASoftJoint"), 10, &ViconReceDemoNode::vicon_callback, this);
}

const soft_device::ViconMarkersRawData::Ptr& ViconReceDemoNode::get_vicon_raw_data(void){
    return this->p_vicon_raw_data_;
}

void ViconReceDemoNode::vicon_callback(const geometry_msgs::TransformStamped::ConstPtr& msg){
    p_vicon_data_->set_data(msg);
    std::cout << "Rece Vicon Data: [" << p_vicon_data_->get_pos().transpose() << 
                "].Freq: [" << p_vicon_data_->get_freq() << "]" << std::endl;
}

int main(int argc, char** argv){
    // Ros init
    ros::init(argc, argv, "vicon_rece_demo_node");
    std::shared_ptr<ViconReceDemoNode> vicon_rece_demo_node = std::make_shared<ViconReceDemoNode>();
    // loop
    while(ros::ok()){
        std::cout << "Vicon Raw Data Freq: [ " << vicon_rece_demo_node->get_vicon_raw_data()->get_freq() << " ]." << std::endl;
        ros::spinOnce();
    }

    return 0;
}

