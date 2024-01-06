# FILENAME: buildsystem.cmake
# -----------------------------------------------------------------------------
# DESCRIPTION: Serves as the central configuration file for the CMake build
# process, and defines different build configurations.
# -----------------------------------------------------------------------------


include(cmake/cmake-checks.cmake)
include(cmake/tidy-checks.cmake)
include(cmake/add_all_targets.cmake)
include(cmake/add_all_tests.cmake)
include(cmake/set_default_debug_options.cmake)
include(cmake/set_default_release_options.cmake)
include(cmake/install_target.cmake)
include(cmake/strip_target.cmake)

# Check the build type and configure settings accordingly.
if(CMAKE_BUILD_TYPE MATCHES debug)
    message(STATUS "*** building in DEBUG mode ***")
    set_default_debug_options()
    set(CMAKE_C_CLANG_TIDY "clang-tidy" "-checks=${CMAKE_CHECKS}" "-warnings-as-errors=*")
elseif(CMAKE_BUILD_TYPE MATCHES test)
    message(STATUS "*** building in TEST mode ***")
    enable_testing()
    set(CTEST_RERUN_FAILED ON)
    set(CTEST_OUTPUT_ON_FAILURE ON)
    set_default_debug_options()
else()
    message(STATUS "*** building in RELEASE mode ***")
    set_default_release_options()
    set(CMAKE_C_CLANG_TIDY "clang-tidy" "-checks=${CMAKE_CHECKS}")
endif()

# *** end of file ***
