# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/xcdai/.local/lib/python3.8/site-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /home/xcdai/.local/lib/python3.8/site-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/build

# Utility rule file for run_tests_penu.

# Include any custom commands dependencies for this target.
include penu/soft_device/CMakeFiles/run_tests_penu.dir/compiler_depend.make

# Include the progress variables for this target.
include penu/soft_device/CMakeFiles/run_tests_penu.dir/progress.make

run_tests_penu: penu/soft_device/CMakeFiles/run_tests_penu.dir/build.make
.PHONY : run_tests_penu

# Rule to build all files generated by this target.
penu/soft_device/CMakeFiles/run_tests_penu.dir/build: run_tests_penu
.PHONY : penu/soft_device/CMakeFiles/run_tests_penu.dir/build

penu/soft_device/CMakeFiles/run_tests_penu.dir/clean:
	cd /home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/soft_device && $(CMAKE_COMMAND) -P CMakeFiles/run_tests_penu.dir/cmake_clean.cmake
.PHONY : penu/soft_device/CMakeFiles/run_tests_penu.dir/clean

penu/soft_device/CMakeFiles/run_tests_penu.dir/depend:
	cd /home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/src /home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/soft_device /home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/build /home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/soft_device /home/xcdai/Documents/Project_IRMV/Project_RAT_IRMV/IRMV_RAT_ws/build/penu/soft_device/CMakeFiles/run_tests_penu.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : penu/soft_device/CMakeFiles/run_tests_penu.dir/depend

