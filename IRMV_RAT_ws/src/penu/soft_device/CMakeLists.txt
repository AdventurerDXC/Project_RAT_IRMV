set(SOFT_LIB_NAME soft_device)
file(GLOB_RECURSE LibSource src/*.cpp)
add_library(${SOFT_LIB_NAME} STATIC
        ${LibSource}
        )
set_target_properties(${SOFT_LIB_NAME} PROPERTIES VERSION "${${PROJECT_NAME}_VERSION}")

target_link_libraries(${SOFT_LIB_NAME} ${catkin_LIBRARIES})
add_dependencies(${SOFT_LIB_NAME} ${catkin_EXPORTED_TARGETS} )


install(TARGETS ${SOFT_LIB_NAME}
        LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
        ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
        RUNTIME DESTINATION ${CATKIN_GLOBAL_BIN_DESTINATION})

install(DIRECTORY include/ DESTINATION ${CATKIN_GLOBAL_INCLUDE_DESTINATION})

if (CATKIN_ENABLE_TESTING)
    catkin_add_gtest(test_device test/test_device.cpp )
    target_link_libraries(test_device ${SOFT_LIB_NAME} ${Boost_LIBRARIES} ${catkin_LIBRARIES})
endif ()