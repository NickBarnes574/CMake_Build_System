# FILENAME: add_exe.cmake
# -----------------------------------------------------------------------------
# DESCRIPTION: Defines a function, add_exe, for adding executable targets to 
# the project.
# -----------------------------------------------------------------------------

set(INSTALL_DEST_RELEASE_DEPLOY_REMOTE "${CMAKE_SOURCE_DIR}/release/deploy/remote")
set(INSTALL_DEST_DEBUG_DEPLOY_REMOTE "${CMAKE_SOURCE_DIR}/debug/deploy/remote")

function(add_exe TARGET_NAME SRC_FILES INCLUDE_FILES LINK_LIBRARIES)
    set(FULL_TARGET_NAME "${TARGET_NAME}_${CMAKE_SYSTEM_PROCESSOR}")
    add_executable(${FULL_TARGET_NAME} ${SRC_FILES})
    target_include_directories(${FULL_TARGET_NAME} PRIVATE ${INCLUDE_FILES})

    foreach(LIB IN LISTS LINK_LIBRARIES)
        message(STATUS "Linking library ${LIB} to ${FULL_TARGET_NAME}")
        target_link_libraries(${FULL_TARGET_NAME} PRIVATE ${LIB})
    endforeach()
    
    if(CMAKE_BUILD_TYPE MATCHES "Release")
        set_default_release_options(${FULL_TARGET_NAME})
        strip_target(${FULL_TARGET_NAME})
        install_target(${FULL_TARGET_NAME} ${INSTALL_DEST_RELEASE_DEPLOY_REMOTE})

    elseif(CMAKE_BUILD_TYPE MATCHES "Debug")
        set_default_debug_options(${FULL_TARGET_NAME})
        install_target(${FULL_TARGET_NAME} ${INSTALL_DEST_DEBUG_DEPLOY_REMOTE})
    endif()

endfunction()

# *** end of file ***