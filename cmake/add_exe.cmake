# FILENAME: add_exe.cmake
# -----------------------------------------------------------------------------
# DESCRIPTION: Defines a function, add_exe, for adding executable targets to 
# the project.
# -----------------------------------------------------------------------------

# Define a function to add an executable
function(add_exe exe_name)
    # Add an executable with the given name and source files
    add_executable(${exe_name} ${ARGN})

    # Example of setting additional properties or custom configurations
    # You can modify or remove this part according to your needs
    set_target_properties(${exe_name} PROPERTIES
        RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
    )
endfunction()

# *** end of file ***