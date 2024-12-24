/*
 * @Description: Penu Vicon Data Process
 * @Version: 1.0
 * @Author: XiaoHan Zhu
 */

#include "soft_device/penu_vicon.hpp"

namespace soft_device{
// ViconMarkersRawData
ViconMarkersRawData::ViconMarkersRawData(const std::string& subject_name, const int marker_num)
: subject_name_(subject_name), marker_num_(marker_num)
{
    markers_.resize(marker_num_);
}

ViconMarkersRawData::ViconMarkersRawData(ros::NodeHandle& node,
            const std::string& subject_name, const int marker_num,
            const std::string& topic_name,
            uint32_t queue_size)
: subject_name_(subject_name), marker_num_(marker_num)
{
    markers_.resize(marker_num_);
    // vicon markers subscriber
    vicon_markers_sub_ = node.subscribe(
        topic_name,
        queue_size,
        &ViconMarkersRawData::vicon_raw_data_callback,
        this);
}

bool ViconMarkersRawData::set_data(const vicon_bridge::Markers::ConstPtr& msg){
    // check marker num
    if(!check_num(msg)){
        return false;
    }
    // markers
    int _marker_count = 0;
    for(auto marker : msg->markers){
        if(marker.subject_name == this->subject_name_){
            markers_[_marker_count++] = Marker(marker.marker_name,
                                        marker.translation.x, marker.translation.y, marker.translation.z,
                                        marker.occluded);
        }
    }
    // frequence calculate
    if(!time_first_flag_){
        time_pre_ = time_now_;
        time_now_ = msg->header.stamp.toSec();
        freq_ = 1.f / (time_now_ - time_pre_);
    }else{
        time_now_ = msg->header.stamp.toSec();
        time_first_flag_ = false;
    }

    return true;
}

Markers& ViconMarkersRawData::get_markers_data(void){
    return this->markers_;
}

bool ViconMarkersRawData::check_num(const vicon_bridge::Markers::ConstPtr& msg){
    int _count = 0;
    for(auto marker : msg->markers){
        if(marker.subject_name == this->subject_name_){
            _count++;
        }
    }

    return (_count == this->marker_num_);
}

void ViconMarkersRawData::vicon_raw_data_callback(const vicon_bridge::Markers::ConstPtr& msg){
    this->set_data(msg);
}

bool ViconMarkersRawData::get_connect_status(void){
    return (this->freq_ > 50.0f);
}

double ViconMarkersRawData::get_freq(void){
    return this->freq_;
}


// ViconObjectData
ViconObjectData::ViconObjectData(){
    // nothing to do
}

void ViconObjectData::set_data(double px, double py, double pz, double qx, double qy, double qz, double qw, double time_s){
    // positon
    pos_ = Eigen::Matrix<double,3,1>(px, py, pz);
    // quaternion
    quat_= Eigen::Quaterniond(qw, qx, qy, qz);
    // frequence calculate
    if(!time_first_flag_){
        time_pre_ = time_now_;
        time_now_ = time_s;
        freq_ = 1.f / (time_now_ - time_pre_);
    }else{
        time_now_ = time_s;
        time_first_flag_ = false;
    }
}

void ViconObjectData::set_data(const geometry_msgs::TransformStamped::ConstPtr& msg){
    set_data(msg->transform.translation.x, msg->transform.translation.y, msg->transform.translation.z,
        msg->transform.rotation.x, msg->transform.rotation.y, msg->transform.rotation.z, msg->transform.rotation.w,
        msg->header.stamp.toSec());

}

Eigen::Vector3d ViconObjectData::get_pos(void){
    return pos_;
}

Eigen::Quaterniond ViconObjectData::get_quat(void){
    return quat_;
}

Eigen::Matrix3d ViconObjectData::get_rotation(void){
    return quat_.toRotationMatrix();
}

Eigen::Vector3d ViconObjectData::get_RPY(void){
    return rotationMatrixToRPY(get_rotation());
}

Eigen::Matrix4d ViconObjectData::get_t(void){
    Eigen::Matrix4d T = Eigen::Matrix4d::Identity();
    T.block<3,3>(0,0) = get_rotation();
    T.block<3,1>(0,3) = get_pos();

    return T; 
}

double ViconObjectData::get_freq(void){
    return this->freq_;
}

Eigen::Vector3d ViconObjectData::rotationMatrixToRPY(const Eigen::Matrix3d& R){
    double _pitch, _roll, _yaw;
    _pitch = std::asin(-R(2, 0));
    if (std::abs(_pitch) < M_PI / 2) {
        _roll = std::atan2(R(2, 1), R(2, 2));
        _yaw = std::atan2(R(1, 0), R(0, 0));
    } else {
        _roll = 0;
        _yaw = std::atan2(-R(0, 1), R(1, 1));
    }
    return Eigen::Vector3d(_roll, _pitch, _yaw);
}

}
