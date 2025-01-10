# Install script for directory: /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/install")
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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/penu/msg" TYPE FILE FILES
    "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/Sensor.msg"
    "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/PreCmd.msg"
    "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/LenCmd.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/penu/cmake" TYPE FILE FILES "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/catkin_generated/installspace/penu-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/include/penu")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/share/roseus/ros/penu")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/share/common-lisp/ros/penu")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/share/gennodejs/ros/penu")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/python3/dist-packages/penu")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/python3/dist-packages/penu")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/catkin_generated/installspace/penu.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/penu/cmake" TYPE FILE FILES "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/catkin_generated/installspace/penu-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/penu/cmake" TYPE FILE FILES
    "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/catkin_generated/installspace/penuConfig.cmake"
    "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/catkin_generated/installspace/penuConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/penu" TYPE FILE FILES "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/penu" TYPE PROGRAM FILES "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/catkin_generated/installspace/vicon_publisher.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/penu" TYPE PROGRAM FILES "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/catkin_generated/installspace/vicon_tf.py")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/soft_device/cmake_install.cmake")

endif()

