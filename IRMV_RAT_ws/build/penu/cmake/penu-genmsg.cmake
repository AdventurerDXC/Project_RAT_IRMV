# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "penu: 3 messages, 0 services")

set(MSG_I_FLAGS "-Ipenu:/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(penu_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/Sensor.msg" NAME_WE)
add_custom_target(_penu_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "penu" "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/Sensor.msg" ""
)

get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/PreCmd.msg" NAME_WE)
add_custom_target(_penu_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "penu" "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/PreCmd.msg" ""
)

get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/LenCmd.msg" NAME_WE)
add_custom_target(_penu_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "penu" "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/LenCmd.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(penu
  "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/Sensor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/penu
)
_generate_msg_cpp(penu
  "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/PreCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/penu
)
_generate_msg_cpp(penu
  "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/LenCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/penu
)

### Generating Services

### Generating Module File
_generate_module_cpp(penu
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/penu
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(penu_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(penu_generate_messages penu_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/Sensor.msg" NAME_WE)
add_dependencies(penu_generate_messages_cpp _penu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/PreCmd.msg" NAME_WE)
add_dependencies(penu_generate_messages_cpp _penu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/LenCmd.msg" NAME_WE)
add_dependencies(penu_generate_messages_cpp _penu_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(penu_gencpp)
add_dependencies(penu_gencpp penu_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS penu_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(penu
  "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/Sensor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/penu
)
_generate_msg_eus(penu
  "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/PreCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/penu
)
_generate_msg_eus(penu
  "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/LenCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/penu
)

### Generating Services

### Generating Module File
_generate_module_eus(penu
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/penu
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(penu_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(penu_generate_messages penu_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/Sensor.msg" NAME_WE)
add_dependencies(penu_generate_messages_eus _penu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/PreCmd.msg" NAME_WE)
add_dependencies(penu_generate_messages_eus _penu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/LenCmd.msg" NAME_WE)
add_dependencies(penu_generate_messages_eus _penu_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(penu_geneus)
add_dependencies(penu_geneus penu_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS penu_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(penu
  "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/Sensor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/penu
)
_generate_msg_lisp(penu
  "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/PreCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/penu
)
_generate_msg_lisp(penu
  "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/LenCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/penu
)

### Generating Services

### Generating Module File
_generate_module_lisp(penu
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/penu
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(penu_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(penu_generate_messages penu_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/Sensor.msg" NAME_WE)
add_dependencies(penu_generate_messages_lisp _penu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/PreCmd.msg" NAME_WE)
add_dependencies(penu_generate_messages_lisp _penu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/LenCmd.msg" NAME_WE)
add_dependencies(penu_generate_messages_lisp _penu_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(penu_genlisp)
add_dependencies(penu_genlisp penu_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS penu_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(penu
  "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/Sensor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/penu
)
_generate_msg_nodejs(penu
  "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/PreCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/penu
)
_generate_msg_nodejs(penu
  "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/LenCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/penu
)

### Generating Services

### Generating Module File
_generate_module_nodejs(penu
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/penu
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(penu_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(penu_generate_messages penu_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/Sensor.msg" NAME_WE)
add_dependencies(penu_generate_messages_nodejs _penu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/PreCmd.msg" NAME_WE)
add_dependencies(penu_generate_messages_nodejs _penu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/LenCmd.msg" NAME_WE)
add_dependencies(penu_generate_messages_nodejs _penu_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(penu_gennodejs)
add_dependencies(penu_gennodejs penu_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS penu_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(penu
  "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/Sensor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/penu
)
_generate_msg_py(penu
  "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/PreCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/penu
)
_generate_msg_py(penu
  "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/LenCmd.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/penu
)

### Generating Services

### Generating Module File
_generate_module_py(penu
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/penu
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(penu_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(penu_generate_messages penu_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/Sensor.msg" NAME_WE)
add_dependencies(penu_generate_messages_py _penu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/PreCmd.msg" NAME_WE)
add_dependencies(penu_generate_messages_py _penu_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xcdai/Documents/Project_RAT_IRMV/IRMV_RAT_ws/src/penu/msg/LenCmd.msg" NAME_WE)
add_dependencies(penu_generate_messages_py _penu_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(penu_genpy)
add_dependencies(penu_genpy penu_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS penu_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/penu)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/penu
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(penu_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(penu_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(penu_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/penu)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/penu
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(penu_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(penu_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(penu_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/penu)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/penu
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(penu_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(penu_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(penu_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/penu)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/penu
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(penu_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(penu_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(penu_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/penu)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/penu\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/penu
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(penu_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(penu_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(penu_generate_messages_py sensor_msgs_generate_messages_py)
endif()
