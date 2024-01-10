# FILENAME: add_all_targets.cmake
# -----------------------------------------------------------------------------
# DESCRIPTION: Adds multiple build targets, such as executables (EXE) and 
# shared libraries (SO), to a CMake project. It calls `add_exe()` or `add_so()`
# based on the specified target type.
# -----------------------------------------------------------------------------

function(add_all_targets)

    # Target 1
    set(PROJECT_DIR ${CMAKE_SOURCE_DIR}/project)

    set(PROJECT_SOURCES
        ${PROJECT_DIR}/src/hello.c
    )

    set(PROJECT_INCLUDES
        ${PROJECT_DIR}/include
    )

    add_exe(hello_world "${PROJECT_SOURCES}" "${PROJECT_INCLUDES}")

endfunction()

# *** end of file ***