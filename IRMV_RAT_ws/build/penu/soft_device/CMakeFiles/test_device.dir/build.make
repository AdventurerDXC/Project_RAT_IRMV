# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build

# Include any dependencies generated for this target.
include penu/soft_device/CMakeFiles/test_device.dir/depend.make

# Include the progress variables for this target.
include penu/soft_device/CMakeFiles/test_device.dir/progress.make

# Include the compile flags for this target's objects.
include penu/soft_device/CMakeFiles/test_device.dir/flags.make

penu/soft_device/CMakeFiles/test_device.dir/test/test_device.cpp.o: penu/soft_device/CMakeFiles/test_device.dir/flags.make
penu/soft_device/CMakeFiles/test_device.dir/test/test_device.cpp.o: /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/soft_device/test/test_device.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object penu/soft_device/CMakeFiles/test_device.dir/test/test_device.cpp.o"
	cd /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/soft_device && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_device.dir/test/test_device.cpp.o -c /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/soft_device/test/test_device.cpp

penu/soft_device/CMakeFiles/test_device.dir/test/test_device.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_device.dir/test/test_device.cpp.i"
	cd /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/soft_device && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/soft_device/test/test_device.cpp > CMakeFiles/test_device.dir/test/test_device.cpp.i

penu/soft_device/CMakeFiles/test_device.dir/test/test_device.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_device.dir/test/test_device.cpp.s"
	cd /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/soft_device && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/soft_device/test/test_device.cpp -o CMakeFiles/test_device.dir/test/test_device.cpp.s

# Object files for target test_device
test_device_OBJECTS = \
"CMakeFiles/test_device.dir/test/test_device.cpp.o"

# External object files for target test_device
test_device_EXTERNAL_OBJECTS =

/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: penu/soft_device/CMakeFiles/test_device.dir/test/test_device.cpp.o
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: penu/soft_device/CMakeFiles/test_device.dir/build.make
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: gtest/lib/libgtest.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/libsoft_device.a
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /opt/ros/noetic/lib/libclass_loader.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libPocoFoundation.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libdl.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /opt/ros/noetic/lib/libroslib.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /opt/ros/noetic/lib/librospack.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libpython3.8.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libboost_program_options.so.1.71.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /opt/ros/noetic/lib/libroscpp.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /opt/ros/noetic/lib/libcv_bridge.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_dnn.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_video.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_videoio.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_aruco.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_bgsegm.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_bioinspired.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_ccalib.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_datasets.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_dnn_objdetect.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_dnn_superres.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_dpm.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_face.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_freetype.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_fuzzy.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_hdf.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_hfs.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_img_hash.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_line_descriptor.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_optflow.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_phase_unwrapping.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_plot.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_quality.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_reg.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_rgbd.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_saliency.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_shape.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_stereo.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_structured_light.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_surface_matching.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_text.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_tracking.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_viz.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_ximgproc.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_xobjdetect.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_xphoto.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_core.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libopencv_imgcodecs.so.4.2.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /opt/ros/noetic/lib/librosconsole.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /opt/ros/noetic/lib/librostime.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /opt/ros/noetic/lib/libcpp_common.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: /opt/ros/noetic/lib/libserial.so
/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device: penu/soft_device/CMakeFiles/test_device.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device"
	cd /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/soft_device && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_device.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
penu/soft_device/CMakeFiles/test_device.dir/build: /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/devel/lib/penu/test_device

.PHONY : penu/soft_device/CMakeFiles/test_device.dir/build

penu/soft_device/CMakeFiles/test_device.dir/clean:
	cd /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/soft_device && $(CMAKE_COMMAND) -P CMakeFiles/test_device.dir/cmake_clean.cmake
.PHONY : penu/soft_device/CMakeFiles/test_device.dir/clean

penu/soft_device/CMakeFiles/test_device.dir/depend:
	cd /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/soft_device /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/soft_device /home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/soft_device/CMakeFiles/test_device.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : penu/soft_device/CMakeFiles/test_device.dir/depend

