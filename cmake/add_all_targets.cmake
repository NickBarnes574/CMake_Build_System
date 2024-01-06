# FILENAME: add_all_targets.cmake
# -----------------------------------------------------------------------------
# DESCRIPTION: Adds multiple build targets, such as executables (EXE) and 
# shared libraries (SO), to a CMake project. It calls `add_exe()` or `add_so()`
# based on the specified target type.
# -----------------------------------------------------------------------------

include(cmake/add_exe.cmake)
include(cmake/add_so.cmake)

function(add_all_targets)
    foreach(arg IN LISTS ARGN)
        # Parse the argument into a list separated by spaces
        string(REPLACE " " ";" arg_list "${arg}")

        # Get the target type and name
        list(GET arg_list 0 target_type)
        list(GET arg_list 1 target_name)

        # Remove the first two elements (target type and name)
        list(REMOVE_AT arg_list 0 1)

        # Add the target based on the target type
        if(target_type STREQUAL "EXE")
            add_exe(${target_name} ${arg_list})
        elseif(target_type STREQUAL "SO")
            add_so(${target_name} ${arg_list})
        else()
            message(FATAL_ERROR "Unknown target type: ${target_type}")
        endif()
    endforeach()
endfunction()

# *** end of file ***