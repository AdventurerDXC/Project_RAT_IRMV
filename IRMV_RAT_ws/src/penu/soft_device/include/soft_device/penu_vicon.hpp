/*
 * @Description: Head file for penu vicon data process
 * @Version: 1.0
 * @Author: XiaoHan Zhu
 */

#ifndef SOFT_ROBOT_PENU_VICON_HPP
#define SOFT_ROBOT_PENU_VICON_HPP

#include <ros/ros.h>
#include <Eigen/Core>
#include <Eigen/Eigen>
#include <geometry_msgs/TransformStamped.h>
#include "vicon_bridge/Markers.h"
#include "vicon_bridge/Marker.h"
#include <iostream>
#include <string>
#include <vector>
#include <cstdio>
#include <chrono>
#include <unistd.h>

#ifndef EIGEN_VECTOR

#define Vector3d  Matrix<double,3,1>

#endif

namespace soft_device{

    struct Marker{
        std::string     marker_name_;
        Eigen::Vector3d marker_pos_;
        bool            marker_occluded_;     // 1: occluded, 0: not occluded

        Marker() = default;

        Marker(const std::string& marker_name,
            double x, double y, double z, 
            bool occluded){
            marker_name_  = marker_name;
            marker_pos_[0] = x;
            marker_pos_[1] = y;
            marker_pos_[2] = z;
            marker_occluded_ = occluded;
        }

        bool isVisible(void){
            return !marker_occluded_;
        }
    };

    typedef std::vector<Marker> Markers;

    class ViconMarkersRawData{
    public:
        typedef std::shared_ptr<ViconMarkersRawData> Ptr;
    public:
        ViconMarkersRawData(const std::string& subject_name, const int marker_num);
        
        ViconMarkersRawData(ros::NodeHandle& node,
            const std::string& subject_name, const int marker_num,
            const std::string& topic_name = "/vicon/markers",
            uint32_t queue_size = 10);

    public:
        bool        set_data(const vicon_bridge::Markers::ConstPtr& msg);

        Markers&    get_markers_data(void);
        double      get_freq(void);
        bool        get_connect_status(void);

        bool        check_num(const vicon_bridge::Markers::ConstPtr& msg);
    
    private:
        void        vicon_raw_data_callback(const vicon_bridge::Markers::ConstPtr& msg);

    private:
        // subscriber
        ros::Subscriber     vicon_markers_sub_;
        // markers
        const std::string   subject_name_;
        Markers             markers_;
        const int           marker_num_;
        // freq
        double time_now_, time_pre_, freq_;    // frequence
        bool   time_first_flag_ = true;
    };

    class ViconObjectData{
    public:
        typedef std::shared_ptr<ViconObjectData> Ptr;
    public:
        ViconObjectData();

        void set_data(double px, double py, double pz, double qx, double qy, double qz, double qw, double time_s);
        void set_data(const geometry_msgs::TransformStamped::ConstPtr& msg);
        Eigen::Vector3d             get_pos(void);
        Eigen::Quaterniond          get_quat(void);
        Eigen::Matrix3d             get_rotation(void);
        Eigen::Vector3d             get_RPY(void);
        Eigen::Matrix4d             get_t(void);
        double                      get_freq(void);

        Eigen::Vector3d rotationMatrixToRPY(const Eigen::Matrix3d& R);
        
    private:
        Eigen::Vector3d                 pos_;
        Eigen::Quaterniond              quat_;
        double time_now_, time_pre_, freq_;    // frequence
        bool   time_first_flag_ = true;
    };

}
















#endif

