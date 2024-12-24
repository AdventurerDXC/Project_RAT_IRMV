/*
 * @Description: Penu Usart Communication
 * @Version: 1.0
 * @Author: XiaoHan Zhu
 */
#include "soft_device/penu_usart.hpp"

void Float_to_Byte(float f, uint8_t* byte){
    FloatLongType fl;
    fl.fdata = f;

    byte[0] = (uint8_t)fl.ldata;
    byte[1] = (uint8_t)(fl.ldata >> 8);
    byte[2] = (uint8_t)(fl.ldata >> 16);
    byte[3] = (uint8_t)(fl.ldata >> 24);

}

void Byte_to_Float(float* f, uint8_t* byte){
    FloatLongType fl;
    fl.ldata = 0;

    fl.ldata = byte[3];
    fl.ldata = (fl.ldata << 8)|byte[2];
    fl.ldata = (fl.ldata << 8)|byte[1];
    fl.ldata = (fl.ldata << 8)|byte[0];
    *f = fl.fdata;

}

uint16_t merge(const uint8_t dataL, const uint8_t dataH){
	uint16_t data = dataH;
	data <<= 8;
	data |= dataL;

	return data;
}

uint8_t get_L(const uint16_t data){
	uint8_t dataL = data;
	return dataL;
}

uint8_t get_H(const uint16_t data){
	uint8_t dataH = data >> 8;
	return dataH;
}

namespace soft_device{
    
    // SoftSerial
    bool SoftSerial::port_open(const std::string& port_name, const int boud_rate, const int data_size, const int timeout){
        try{
            ser_.setPort(port_name);
            ser_.setBaudrate(boud_rate);
            serial::Timeout to = serial::Timeout::simpleTimeout(timeout);
            ser_.setTimeout(to);
            ser_.open();
        }catch(serial::IOException& e){
            std::stringstream e_msg;
            e_msg << "Unable to open port: " << port_name;
            ROS_ERROR_STREAM(e_msg.str());
            return false;
        }
        std::stringstream i_msg;
        i_msg << "Success to open port: " << port_name;
        ROS_INFO_STREAM(i_msg.str());
        open_ = true;
        return true;
    }

    void SoftSerial::port_close(){
        if(open_){
            ser_.close();
            open_ = false;
            std::stringstream i_msg;
            i_msg << "Success to close port";
            ROS_INFO_STREAM(i_msg.str());
        }
    }

    bool SoftSerial::isOpen(){
        return ser_.isOpen();
    }

    bool SoftSerial::write(const unsigned char* send_buffer, const size_t len){
        if(ser_.isOpen()){
            if(ser_.write(send_buffer, len)){
                ROS_INFO_STREAM("Success send to Serial");
                return true;
            }
            else{
                ROS_INFO("AAA");
                ROS_ERROR_STREAM("Send Fail, Unable to Write!");
            }
        }else{
            ROS_INFO("BBB");
            ROS_ERROR_STREAM("Send Fail, Unable to open port");
        }
        return false;
    }

    bool SoftSerial::read(uint8_t* buffer, const size_t len){
        size_t n = ser_.available();
        if(n != 0){
            n = ser_.read(buffer, len);
        }else{
            ROS_INFO_STREAM("Read Fail, No data to read");
            return false;
        }
        // print to screen
        // for(int i=0; i<n; i++)
        // {
        //     //16进制的方式打印到屏幕
        //     std::cout << std::hex << (buffer[i] & 0xff) << " ";
        // }
        // std::cout << std::endl;

        return true;
    }

    size_t SoftSerial::available(void){
        return ser_.available();
    }

    void SoftSerial::clear(void){
        size_t n = ser_.available();
        if(n != 0){
            uint8_t temp[n];
            ser_.read(temp, n);
        }
    }

    SoftSerial::~SoftSerial(){
        port_close();
    }

    // PenuUsart
    bool PenuUsart::connect(const std::string& port_name, const int boud_rate, const int data_size, const int timeout){
        return soft_ser_.port_open(port_name, boud_rate, data_size, timeout);
    }

    void PenuUsart::disconnect(){
        soft_ser_.port_close();
    }

    bool PenuUsart::isConnect(){
        return soft_ser_.isOpen();
    }

    bool PenuUsart::send_data(const UART_SEND uart_send){
        // data
        uint8_t s_Buffer[UART_TX_LEN];
        memset(s_Buffer, 0 , sizeof(s_Buffer));

        s_Buffer[0] = uart_send.head[0];
        s_Buffer[1] = uart_send.head[1];

        s_Buffer[2] = get_L(uart_send.pre_CMD[0]);
        s_Buffer[3] = get_H(uart_send.pre_CMD[0]);
        s_Buffer[4] = get_L(uart_send.pre_CMD[1]);
        s_Buffer[5] = get_H(uart_send.pre_CMD[1]);
        s_Buffer[6] = get_L(uart_send.pre_CMD[2]);
        s_Buffer[7] = get_H(uart_send.pre_CMD[2]);
        s_Buffer[8] = get_L(uart_send.pre_CMD[3]);
        s_Buffer[9] = get_H(uart_send.pre_CMD[3]);
         
        s_Buffer[UART_TX_LEN-2] = 0xAA;
        s_Buffer[UART_TX_LEN-1] = 0xBB;
        
        //write
        return soft_ser_.write(s_Buffer, UART_TX_LEN);
    }

    void PenuUsart::clear_rx_buf(void){
        soft_ser_.clear();
    }

    bool PenuUsart::read_data(void){
        // start receive data
        if(soft_ser_.available()){
            // receive
            uint8_t r_Buffer[UART_RX_LEN];
            memset(r_Buffer, 0 , sizeof(r_Buffer));
            if(soft_ser_.read(r_Buffer, UART_RX_LEN)){
                if(r_Buffer[0] == 0x11 && r_Buffer[1] == 0x22){
                    if(r_Buffer[UART_RX_LEN-2] == 0xAA && r_Buffer[UART_RX_LEN-1] == 0xBB){
                        //ROS_INFO_STREAM("Enter!");
                        // rx data protocol
                        // head
                        uart_receive_.head[0] = r_Buffer[0];
                        uart_receive_.head[1] = r_Buffer[1];
                        //data
                        float f_pre[ADC_LEN];
                        float f_len[WIRE_SENSOR_NUM];
                        uint8_t temp[ADC_LEN+WIRE_SENSOR_NUM][4];
                       
                        for (int i = 0; i < ADC_LEN+WIRE_SENSOR_NUM; i++)
                        {
                            for (int j = 0; j < 4; j++)
                            {
                                temp[i][j]=r_Buffer[2+i*4+j];
                            }
                            if(i<ADC_LEN){
                                Byte_to_Float(f_pre+i, temp[i]);
                                uart_receive_.pre_FB[i] = f_pre[i];
                            }else{
                                Byte_to_Float(f_len+i-4, temp[i]);
                                uart_receive_.len_FB[i-4] = f_len[i-4];
                            }
                        }
                        // tail
                        uart_receive_.tail[0] = r_Buffer[UART_RX_LEN-2];
                        uart_receive_.tail[1] = r_Buffer[UART_RX_LEN-1];

                        return true;

                        /*// data1
                        uint8_t temp1[4];
                        float f1;
                        temp1[0] = r_Buffer[2];
                        temp1[1] = r_Buffer[3];
                        temp1[2] = r_Buffer[4];
                        temp1[3] = r_Buffer[5];
                        Byte_to_Float(&f1, temp1);
                        uart_receive_.pre_FB[0] = f1;
                        // data2
                        uint8_t temp2[4];
                        float f2;
                        temp2[0] = r_Buffer[6];
                        temp2[1] = r_Buffer[7];
                        temp2[2] = r_Buffer[8];
                        temp2[3] = r_Buffer[9];
                        Byte_to_Float(&f2, temp2);
                        uart_receive_.pre_FB[1] = f2;
                        // data3
                        uint8_t temp3[4];
                        float f3;
                        temp3[0] = r_Buffer[10];
                        temp3[1] = r_Buffer[11];
                        temp3[2] = r_Buffer[12];
                        temp3[3] = r_Buffer[13];
                        Byte_to_Float(&f3, temp3);
                        uart_receive_.pre_FB[2] = f3;
                        // data4
                        uint8_t temp4[4];
                        float f4;
                        temp4[0] = r_Buffer[14];
                        temp4[1] = r_Buffer[15];
                        temp4[2] = r_Buffer[16];
                        temp4[3] = r_Buffer[17];
                        Byte_to_Float(&f4, temp4);
                        uart_receive_.pre_FB[3] = f4;*/
                        
                        
                    }
                }else{
                    return false;
                }
            }else{
                return false;
            }
        }else{
            return false;
        }
        return true; //TODO：终端报警告，随便return了一个
    }

    bool PenuUsart::set_pre(uint16_t* pre_cmd){
        // data
        UART_SEND uart_send_;

        uart_send_.head[0] = 0x11;
        uart_send_.head[1] = 0x22;

        uart_send_.pre_CMD[0] = pre_cmd[0];
        uart_send_.pre_CMD[1] = pre_cmd[1];
        uart_send_.pre_CMD[2] = pre_cmd[2];
        uart_send_.pre_CMD[3] = pre_cmd[3];

        uart_send_.tail[0] = 0xAA;
        uart_send_.tail[1] = 0xBB;

        // write
        return send_data(uart_send_);
    }

    bool PenuUsart::set_len(uint16_t* len_cmd){
        // data
        UART_SEND uart_send_;

        uart_send_.head[0] = 0x33;
        uart_send_.head[1] = 0x44;

        uart_send_.len_CMD[0] = len_cmd[0];
        uart_send_.len_CMD[1] = len_cmd[1];
        uart_send_.len_CMD[2] = len_cmd[2];
        uart_send_.len_CMD[3] = len_cmd[3];

        uart_send_.tail[0] = 0xCC;
        uart_send_.tail[1] = 0xDD;

        // write
        return send_data(uart_send_);
    }

    void PenuUsart::get_pre(float* pre_FB){
        pre_FB[0] = uart_receive_.pre_FB[0];
        pre_FB[1] = uart_receive_.pre_FB[1];
        pre_FB[2] = uart_receive_.pre_FB[2];
        pre_FB[3] = uart_receive_.pre_FB[3];
    }

    void PenuUsart::get_len(float* len_FB){
        len_FB[0] = uart_receive_.len_FB[0];
        len_FB[1] = uart_receive_.len_FB[1];
        len_FB[2] = uart_receive_.len_FB[2];
        len_FB[3] = uart_receive_.len_FB[3];
    }
}