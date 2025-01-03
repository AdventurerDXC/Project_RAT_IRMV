cmake_minimum_required(VERSION 3.0.2)
project(penu)

add_compile_options(-std=c++17)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
add_definitions(-DPLOG_CAPTURE_FILE)
find_package(Eigen3 REQUIRED)
find_package(OpenCV REQUIRED)
find_package(message_generation REQUIRED)
find_package(PythonLibs REQUIRED)
## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
        pluginlib
        roscpp
        rospy
        std_msgs
        geometry_msgs
        sensor_msgs
        message_generation
        cv_bridge
        serial
)

add_message_files(
        FILES
        Sensor.msg
        PreCmd.msg
        LenCmd.msg
)

generate_messages(
        DEPENDENCIES
        std_msgs
        geometry_msgs
        sensor_msgs
)
catkin_package(
        CATKIN_DEPENDS
        rospy
        roscpp
        std_msgs
        geometry_msgs
        sensor_msgs
        message_runtime
        cv_bridge
)

set(THIS_PACKAGE_INCLUDE_DIRS
        # add include path
        soft_device/include
)

include_directories(SYSTEM
        ${catkin_INCLUDE_DIRS}
        ${EIGEN3_INCLUDE_DIRS}
        ${OpenCV_INCLUDE_DIRS}
        ${PYTHON_INCLUDE_DIRS}
)
include_directories(${THIS_PACKAGE_INCLUDE_DIRS})

add_subdirectory(soft_device)

add_definitions(-DCATKIN_ENABLE_TESTING)
file(GLOB_RECURSE LibSource src/*.cpp)

# executable set
catkin_install_python(PROGRAMS
  scripts/vicon_publisher.py
  scripts/vicon_tf.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
add_executable(penu_ctrl_node src/penu_ctrl_node.cpp)
target_link_libraries(penu_ctrl_node  ${catkin_LIBRARIES} ${OpenCV_LIBS} soft_device)
add_executable(ctrl_demo_node src/ctrl_demo.cpp)
target_link_libraries(ctrl_demo_node  ${catkin_LIBRARIES} ${OpenCV_LIBS} soft_device)
add_executable(vicon_rece_demo_node src/vicon_rece_demo.cpp)
target_link_libraries(vicon_rece_demo_node  ${catkin_LIBRARIES} ${OpenCV_LIBS} soft_device)
