# FILENAME: buildsystem.cmake
# -----------------------------------------------------------------------------
# DESCRIPTION: Serves as the central configuration file for the CMake build
# process, and defines different build configurations.
# -----------------------------------------------------------------------------

set(INSTALL_DEST_BUILD_RELEASE_REMOTE "${CMAKE_SOURCE_DIR}/build/release/remote")
set(INSTALL_DEST_BUILD_DEBUG_REMOTE "${CMAKE_SOURCE_DIR}/build/debug/remote")

include_cmake_modules("checks")
include_cmake_modules("options")
include_cmake_modules("libraries")
include_cmake_modules("target")
include_cmake_modules("install")
include_cmake_modules("testing")

# # Checks
# include(${CMAKE_SOURCE_DIR}/cmake/checks/tidy-checks.cmake)
# include(${CMAKE_SOURCE_DIR}/cmake/checks/cmake-checks.cmake)

# # Options
# include(${CMAKE_SOURCE_DIR}/cmake/options/set_default_release_options.cmake)
# include(${CMAKE_SOURCE_DIR}/cmake/options/set_default_debug_options.cmake)
# include(${CMAKE_SOURCE_DIR}/cmake/options/disable_warnings.cmake) # (Used for tweetnacl.c)

# # Libraries
# include(${CMAKE_SOURCE_DIR}/cmake/libraries/setup_library.cmake)
# include(${CMAKE_SOURCE_DIR}/cmake/libraries/add_all_libraries.cmake)

# # Add executable / shared object / all targets
# include(${CMAKE_SOURCE_DIR}/cmake/target/add_exe.cmake)
# include(${CMAKE_SOURCE_DIR}/cmake/target/add_so.cmake)
# include(${CMAKE_SOURCE_DIR}/cmake/target/add_all_targets.cmake)

# # Strip / Install
# include(${CMAKE_SOURCE_DIR}/cmake/install/strip_target.cmake)
# include(${CMAKE_SOURCE_DIR}/cmake/install/install_target.cmake)

# # Testing
# include(${CMAKE_SOURCE_DIR}/cmake/testing/add_gtest.cmake)
# include(${CMAKE_SOURCE_DIR}/cmake/testing/add_all_tests.cmake)

# *** end of file ***
