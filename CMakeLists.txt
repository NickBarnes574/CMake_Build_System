# Minimum required version of CMake
cmake_minimum_required(VERSION 3.16)

# Project Name
project(CMakeBuildSystem
    VERSION 1.0
    DESCRIPTION "CMake Build System Project"
    LANGUAGES C
)

include(cmake/buildsystem.cmake)

# Call add_all_targets with the list of targets
# Each target is specified as a list of: type (EXE or SO), name, and source files
add_all_targets(
    "EXE hello hello.c"
    # SO MySharedLibrary libsource1.c libsource2.c
)
add_all_tests()

# Install hello to /bin
install_target(hello "/bink")

# Strip hello in release builds
strip_target(hello)