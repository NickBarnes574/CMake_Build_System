# FILENAME: configure_target.cmake
# -----------------------------------------------------------------------------
# DESCRIPTION: Configures a new target as either an executable (exe) or a
# shared object library (so)
# -----------------------------------------------------------------------------

function(configure_target)
    # Set the name of the target
    set(TARGET_NAME "hello")

    # Set whether the target will be local or remote
    set(ENDPOINT "REMOTE")

    # Set whether the target will be an executable or a library
    set(TARGET_TYPE "EXE")

    # Set the project directory
    set(PROJECT_DIRECTORY "project")

    # Configure libraries
    set(LIBRARIES Common Math DSA Threading Networking)

    # add the target here:
    add_target(${TARGET_NAME} ${ENDPOINT} ${TARGET_TYPE} ${PROJECT_DIRECTORY} ${LIBRARIES})
endfunction(configure_target)

# *** end of file ***