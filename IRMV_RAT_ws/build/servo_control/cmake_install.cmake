# Install script for directory: /home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/src/servo_control

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/servo_control/cmake" TYPE FILE FILES "/home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/build/servo_control/catkin_generated/installspace/servo_control-msg-paths.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/devel/share/roseus/ros/servo_control")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/python3/dist-packages/servo_control")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/python3/dist-packages/servo_control")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/build/servo_control/catkin_generated/installspace/servo_control.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/servo_control/cmake" TYPE FILE FILES "/home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/build/servo_control/catkin_generated/installspace/servo_control-msg-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/servo_control/cmake" TYPE FILE FILES
    "/home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/build/servo_control/catkin_generated/installspace/servo_controlConfig.cmake"
    "/home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/build/servo_control/catkin_generated/installspace/servo_controlConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/servo_control" TYPE FILE FILES "/home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/src/servo_control/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/servo_control" TYPE PROGRAM FILES "/home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/build/servo_control/catkin_generated/installspace/servoControl.py")
endif()

