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

# *** end of file ***
