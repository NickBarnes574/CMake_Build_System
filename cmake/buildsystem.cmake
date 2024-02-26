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

# Configure libraries
#-----|FLAG NAME|-------|DESCRIPTION|-----------|VALUE|
option(USE_COMMON       "Use Common library"      ON)
option(USE_MATH         "Use Math library"        ON)
option(USE_DSA          "Use DSA library"         ON)
option(USE_THREADING    "Use Threading library"   ON)
option(USE_NETWORKING   "Use Networking library"  ON)

# Configure targets
configure_target("hello_world" "REMOTE" "EXE" "project")

# ------------IN PROGRESS------------

# *** end of file ***
