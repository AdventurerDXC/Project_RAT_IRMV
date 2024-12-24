## soft robot
### build dependence
- 二进制包
  - 本仓库代码依赖以下二进制包`eigen3`
  - 上述二进制包可以通过`sudo apt-get install libxxx-dev`安装
  
- ROS包
  - 本仓库依赖以下ROS包`serial`
  - 可以通过`sudo apt-get install ros-noetic-xxx`安装
  
### vicon使用说明
- vicon_bridge: 与实验室vicon设备建立TCP通讯，并转换为rostopic向外发布，使用时启动该节点并订阅配置话题即可，`freq=100Hz`
- 操作步骤: 
  - 实验室216电脑上使用`Tracker`软件进行定义连杆关系，并命名`[name]`. 当前命名：`/vicon/ASoftJoint/ASoftJoint`
  - Client端连接同一局域网`TP-LINK_982D`，密码: `nclgt682`.
  - 更新：电脑连接局域网`H3C_224926_5G`,密码：`H3C_224926`
  - 开启`vicon_bridge`节点:
    ```
    roslaunch vicon_bridge vicon.launch
    ```
  - 开启`rosrun penu vicon_rece_demo_node `接受末端位置数据
  
  - 其他节点通过订阅`/vicon/[name]/[name]`即可接收到vicon数据，数据类型: `geometry_msgs::TransformStamped`
    ```
    rosmsg show geometry_msgs/TransformStamped
    ```
`/vicon/markers`

### 编译
- 使用`catkin_make`编译
- 使用`rosrun penu test_node`来测试项目编译成功与否(Note: 将xxx/devel/setup.zsh >> ~/.zshrc)
- 使用`catkin_make run_tests_penu_gtest_test_xxx`进行测试

### 运行
- demo node: `zsh ./src/penu/scripts/simple_ctrl_demo.sh`

- 注意使用:`sudo chmod 777 /dev/ttyUSB0`赋予串口权限
- 