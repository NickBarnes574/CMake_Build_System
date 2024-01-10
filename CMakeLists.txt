# Minimum required version of CMake
cmake_minimum_required(VERSION 3.16)

# Project Name
project(CMakeBuildSystem
    VERSION 1.0
    DESCRIPTION "CMake Build System Project"
    LANGUAGES C
)

include(cmake/buildsystem.cmake)

add_all_libraries()

add_all_targets()

add_all_tests()