# Minimum required version of CMake
cmake_minimum_required(VERSION 3.16)

# Project Name
project(Common LANGUAGES C)

include(libraries/0_Common/common_sources.cmake)

# Create the Common library
add_library(Common SHARED ${COMMON_LIBRARY_SOURCES})
setup_target(Common ${Common_SOURCE_DIR})

# Specify the C standard
set_property(TARGET Common PROPERTY C_STANDARD 11)

# Include directories
target_include_directories(Common PUBLIC include/)
