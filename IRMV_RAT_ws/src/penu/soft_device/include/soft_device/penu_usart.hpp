/*
 * @Description: Head file for penu usart communication
 * @Version: 1.0
 * @Author: XiaoHan Zhu
 */

#ifndef SOFT_ROBOT_PENU_USART_HPP
#define SOFT_ROBOT_PENU_USART_HPP

#include <ros/ros.h>
#include <Eigen/Core>
#include <iostream>
#include <cstdio>
#include <chrono>
#include <unistd.h>
#include "serial_base.hpp"

typedef union{
    float fdata;
    unsigned long ldata;
}FloatLongType;

void Float_to_Byte(float f, uint8_t* byte);
void Byte_to_Float(float* f, uint8_t* byte);
uint16_t merge(const uint8_t dataL, const uint8_t dataH);
uint8_t get_L(const uint16_t data);
uint8_t get_H(const uint16_t data);

namespace soft_device{

    class SoftSerial : public SerialBase{
    public:
        SoftSerial() = default;
        ~SoftSerial() override;
    public:
        bool port_open(const std::string& port_name, const int boud_rate, const int data_size, const int timeout) override;
        void port_close() override;
        bool isOpen() override;
        size_t available() override;

        bool write(const unsigned char* send_buffer, const size_t len) override;
        bool read(uint8_t* buffer, const size_t len) override;
        void clear(void) override;
    protected:

    }; 

    #define ADC_LEN         4
    #define WIRE_SENSOR_NUM 4
    #define UART_TX_LEN     12
    #define UART_RX_LEN     (4+4*(ADC_LEN+WIRE_SENSOR_NUM))

    struct UART_SEND{
        uint8_t head[2];                // 2 0x11 0x22
        uint16_t pre_CMD[ADC_LEN];      // 2 * ADC_LEN
        uint16_t len_CMD[WIRE_SENSOR_NUM];      // 4*wire sensor
        uint8_t tail[2];                // 2 0xAA 0xBB

    } __attribute__((packed));          // 12

    struct UART_RECEIVE{
        uint8_t head[2];                // 2 0x11 0x22
        float pre_FB[ADC_LEN];          // 4 * ADC_LEN
        float len_FB[WIRE_SENSOR_NUM];  //4*wire sensor
        uint8_t tail[2];                // 2 0xAA 0xBB

    } __attribute__((packed));          // 20

    class PenuUsart{
    public:
        PenuUsart() = default;
        ~PenuUsart()= default;
    public:
        bool connect(const std::string& port_name, const int boud_rate, const int data_size, const int timeout);
        void disconnect(void);
        bool isConnect(void); 

        bool send_data(const UART_SEND uart_send);

        void clear_rx_buf(void);
        bool read_data(void);

        bool set_pre(uint16_t* pre_cmd);
        bool set_len(uint16_t* len_cmd);
        void get_pre(float* pre_FB);
        void get_len(float* len_FB);


    protected:
        SoftSerial soft_ser_;

        UART_RECEIVE uart_receive_;
    };

}



#endif