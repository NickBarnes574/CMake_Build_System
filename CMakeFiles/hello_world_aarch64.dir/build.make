# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/devbox/Programming/CMake_Build_System

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/devbox/Programming/CMake_Build_System

# Include any dependencies generated for this target.
include CMakeFiles/hello_world_aarch64.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/hello_world_aarch64.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/hello_world_aarch64.dir/flags.make

CMakeFiles/hello_world_aarch64.dir/project/src/hello.c.o: CMakeFiles/hello_world_aarch64.dir/flags.make
CMakeFiles/hello_world_aarch64.dir/project/src/hello.c.o: project/src/hello.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/devbox/Programming/CMake_Build_System/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/hello_world_aarch64.dir/project/src/hello.c.o"
	$(CMAKE_COMMAND) -E __run_co_compile --tidy="clang-tidy;-checks=*,-readability-function-cognitive-complexity,-altera*,-cert-dcl03-c,-misc-static-assert,-llvm-include-order,-llvmlibc-*,-hicpp-*,-concurrency-mt-unsafe,-bugprone-easily-swappable-parameters,-cppcoreguidelines-*,-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling,-readability-magic-numbers,-android-cloexec-accept," --source=/home/devbox/Programming/CMake_Build_System/project/src/hello.c -- /opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/hello_world_aarch64.dir/project/src/hello.c.o   -c /home/devbox/Programming/CMake_Build_System/project/src/hello.c

CMakeFiles/hello_world_aarch64.dir/project/src/hello.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hello_world_aarch64.dir/project/src/hello.c.i"
	/opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/devbox/Programming/CMake_Build_System/project/src/hello.c > CMakeFiles/hello_world_aarch64.dir/project/src/hello.c.i

CMakeFiles/hello_world_aarch64.dir/project/src/hello.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hello_world_aarch64.dir/project/src/hello.c.s"
	/opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/devbox/Programming/CMake_Build_System/project/src/hello.c -o CMakeFiles/hello_world_aarch64.dir/project/src/hello.c.s

# Object files for target hello_world_aarch64
hello_world_aarch64_OBJECTS = \
"CMakeFiles/hello_world_aarch64.dir/project/src/hello.c.o"

# External object files for target hello_world_aarch64
hello_world_aarch64_EXTERNAL_OBJECTS =

hello_world_aarch64: CMakeFiles/hello_world_aarch64.dir/project/src/hello.c.o
hello_world_aarch64: CMakeFiles/hello_world_aarch64.dir/build.make
hello_world_aarch64: libCommon.so
hello_world_aarch64: CMakeFiles/hello_world_aarch64.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/devbox/Programming/CMake_Build_System/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable hello_world_aarch64"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hello_world_aarch64.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/hello_world_aarch64.dir/build: hello_world_aarch64

.PHONY : CMakeFiles/hello_world_aarch64.dir/build

CMakeFiles/hello_world_aarch64.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/hello_world_aarch64.dir/cmake_clean.cmake
.PHONY : CMakeFiles/hello_world_aarch64.dir/clean

CMakeFiles/hello_world_aarch64.dir/depend:
	cd /home/devbox/Programming/CMake_Build_System && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/devbox/Programming/CMake_Build_System /home/devbox/Programming/CMake_Build_System /home/devbox/Programming/CMake_Build_System /home/devbox/Programming/CMake_Build_System /home/devbox/Programming/CMake_Build_System/CMakeFiles/hello_world_aarch64.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/hello_world_aarch64.dir/depend

