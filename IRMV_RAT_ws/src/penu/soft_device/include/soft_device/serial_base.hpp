/*
 * @Description: Head file for serial connect (base class definition)
 * @Version: 1.0
 * @Author: XiaoHan Zhu
 */
#ifndef SOFT_ROBOT_SERIAL_BASE_HPP
#define SOFT_ROBOT_SERIAL_BASE_HPP

#include <serial/serial.h>
#include <string>

namespace soft_device{
    class SerialBase{
    public:
        SerialBase() = default;

        virtual ~SerialBase() = default;
    public:
        virtual bool port_open(const std::string& port_name, const int boud_rate, const int data_size, const int timeout) = 0;
        virtual void port_close() = 0;
        virtual bool isOpen() = 0;
        virtual size_t available() = 0;

        virtual bool write(const unsigned char* send_buffer, const size_t len) = 0;
        virtual bool read(uint8_t* buffer, const size_t len) = 0;
        virtual void clear(void) = 0;
        
    protected:
        serial::Serial ser_;
        bool open_{false};
    };
}
















#endif