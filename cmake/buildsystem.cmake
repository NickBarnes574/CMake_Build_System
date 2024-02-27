# FILENAME: buildsystem.cmake
# -----------------------------------------------------------------------------
# DESCRIPTION: Serves as the central configuration file for the CMake build
# process, and defines different build configurations.
# -----------------------------------------------------------------------------

# Local destinations
set(DEST_RELEASE_LOCAL "${CMAKE_SOURCE_DIR}/build/release/local")
set(DEST_DEBUG_LOCAL "${CMAKE_SOURCE_DIR}/build/debug/local")

# Remote destinations
set(DEST_RELEASE_REMOTE "${CMAKE_SOURCE_DIR}/build/release/remote")
set(DEST_DEBUG_REMOTE "${CMAKE_SOURCE_DIR}/build/debug/remote")

include_cmake_modules("checks")     # Clang-Tidy checks
include_cmake_modules("options")    # Debug and Release options
include_cmake_modules("libraries")  # Custom user-made libraries
include_cmake_modules("target")     # Target management
include_cmake_modules("install")    # Installation configuration
include_cmake_modules("testing")    # GTest configuration

# Create target 1
configure_target(
#  |Parameter|----------|Value|
    TARGET_NAME         "fuzzy"
    ENDPOINT            "REMOTE"
    TARGET_TYPE         "EXE"
    PROJECT_DIRECTORY   "project"
    LIBRARIES           Common Math DSA Threading Networking
)

# Create target 2
configure_target(
#  |Parameter|----------|Value|
    TARGET_NAME         "goofy"
    ENDPOINT            "REMOTE"
    TARGET_TYPE         "EXE"
    PROJECT_DIRECTORY   "project_2"
    LIBRARIES           # No libraries
)

# *** end of file ***
