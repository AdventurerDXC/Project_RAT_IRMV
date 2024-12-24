/*
 * @Description: 
 * @Version: 1.0
 * @Author: XiaoHan Zhu
 */

#include <gtest/gtest.h>
#include <ros/ros.h>
#include <memory>
#include <chrono>
#include <unistd.h>
#include "soft_device/penu_usart.hpp"

using namespace std;
using namespace soft_device;

#define PORT_NAME "/dev/hand"

class DeviceTest : public testing::Test {
protected:
    void SetUp() override {
        spinner = std::make_shared<ros::AsyncSpinner>(3);
        spinner->start();
        //todo: your setup
        penu_usart.connect(PORT_NAME, 115200, 8, 1000);
    }

    void TearDown() override {
        spinner->stop();
    }

protected:
    std::shared_ptr<ros::AsyncSpinner> spinner;
    //todo: your test resources
    soft_device::SoftSerial         soft_ser;
    soft_device::PenuUsart          penu_usart;
};      

/**
 * test send pwm
 */
TEST_F(DeviceTest, ConnectTest) {
    ASSERT_TRUE(penu_usart.isConnect());
    // uint16_t cmd[ADC_LEN] = {10, 10, 10, 10};
    // while(1){
    //     penu_usart.set_pre(cmd);
    //     sleep(1);
    // }

    while(1){
        penu_usart.clear_rx_buf();
        while(!penu_usart.read_data());
        float pre_FB[ADC_LEN];
        penu_usart.get_pre(pre_FB);

        std::stringstream ss;
        ss << "pre_FB: " << pre_FB[0] << " " << pre_FB[1] << " " << pre_FB[2] << " " << pre_FB[3];
        ROS_INFO_STREAM(ss.str());
    }
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "device_test");
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}