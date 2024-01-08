# FILENAME: strip_target.cmake
# -----------------------------------------------------------------------------
# DESCRIPTION: Defines a function to strip debugging information from an
# executable target. This is commonly used in release mode to reduce the size
# of the executable and remove unnecessary debugging information.
# -----------------------------------------------------------------------------

function(strip_target target_name)
    if(NOT CMAKE_BUILD_TYPE STREQUAL "Debug")
        add_custom_command(TARGET ${target_name} POST_BUILD
                           COMMAND ${CMAKE_STRIP} $<TARGET_FILE:${target_name}>)
    endif()
endfunction()
