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
include CMakeFiles/DSA.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/DSA.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/DSA.dir/flags.make

CMakeFiles/DSA.dir/libraries/2_DataStructures/src/hash_table.c.o: CMakeFiles/DSA.dir/flags.make
CMakeFiles/DSA.dir/libraries/2_DataStructures/src/hash_table.c.o: libraries/2_DataStructures/src/hash_table.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/devbox/Programming/CMake_Build_System/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/DSA.dir/libraries/2_DataStructures/src/hash_table.c.o"
	$(CMAKE_COMMAND) -E __run_co_compile --tidy="clang-tidy;-checks=*,-readability-function-cognitive-complexity,-altera*,-cert-dcl03-c,-misc-static-assert,-llvm-include-order,-llvmlibc-*,-hicpp-*,-concurrency-mt-unsafe,-bugprone-easily-swappable-parameters,-cppcoreguidelines-*,-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling,-readability-magic-numbers,-android-cloexec-accept," --source=/home/devbox/Programming/CMake_Build_System/libraries/2_DataStructures/src/hash_table.c -- /opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/DSA.dir/libraries/2_DataStructures/src/hash_table.c.o   -c /home/devbox/Programming/CMake_Build_System/libraries/2_DataStructures/src/hash_table.c

CMakeFiles/DSA.dir/libraries/2_DataStructures/src/hash_table.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/DSA.dir/libraries/2_DataStructures/src/hash_table.c.i"
	/opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/devbox/Programming/CMake_Build_System/libraries/2_DataStructures/src/hash_table.c > CMakeFiles/DSA.dir/libraries/2_DataStructures/src/hash_table.c.i

CMakeFiles/DSA.dir/libraries/2_DataStructures/src/hash_table.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/DSA.dir/libraries/2_DataStructures/src/hash_table.c.s"
	/opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/devbox/Programming/CMake_Build_System/libraries/2_DataStructures/src/hash_table.c -o CMakeFiles/DSA.dir/libraries/2_DataStructures/src/hash_table.c.s

CMakeFiles/DSA.dir/libraries/2_DataStructures/src/queue.c.o: CMakeFiles/DSA.dir/flags.make
CMakeFiles/DSA.dir/libraries/2_DataStructures/src/queue.c.o: libraries/2_DataStructures/src/queue.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/devbox/Programming/CMake_Build_System/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/DSA.dir/libraries/2_DataStructures/src/queue.c.o"
	$(CMAKE_COMMAND) -E __run_co_compile --tidy="clang-tidy;-checks=*,-readability-function-cognitive-complexity,-altera*,-cert-dcl03-c,-misc-static-assert,-llvm-include-order,-llvmlibc-*,-hicpp-*,-concurrency-mt-unsafe,-bugprone-easily-swappable-parameters,-cppcoreguidelines-*,-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling,-readability-magic-numbers,-android-cloexec-accept," --source=/home/devbox/Programming/CMake_Build_System/libraries/2_DataStructures/src/queue.c -- /opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/DSA.dir/libraries/2_DataStructures/src/queue.c.o   -c /home/devbox/Programming/CMake_Build_System/libraries/2_DataStructures/src/queue.c

CMakeFiles/DSA.dir/libraries/2_DataStructures/src/queue.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/DSA.dir/libraries/2_DataStructures/src/queue.c.i"
	/opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/devbox/Programming/CMake_Build_System/libraries/2_DataStructures/src/queue.c > CMakeFiles/DSA.dir/libraries/2_DataStructures/src/queue.c.i

CMakeFiles/DSA.dir/libraries/2_DataStructures/src/queue.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/DSA.dir/libraries/2_DataStructures/src/queue.c.s"
	/opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/devbox/Programming/CMake_Build_System/libraries/2_DataStructures/src/queue.c -o CMakeFiles/DSA.dir/libraries/2_DataStructures/src/queue.c.s

# Object files for target DSA
DSA_OBJECTS = \
"CMakeFiles/DSA.dir/libraries/2_DataStructures/src/hash_table.c.o" \
"CMakeFiles/DSA.dir/libraries/2_DataStructures/src/queue.c.o"

# External object files for target DSA
DSA_EXTERNAL_OBJECTS =

libDSA.so: CMakeFiles/DSA.dir/libraries/2_DataStructures/src/hash_table.c.o
libDSA.so: CMakeFiles/DSA.dir/libraries/2_DataStructures/src/queue.c.o
libDSA.so: CMakeFiles/DSA.dir/build.make
libDSA.so: libCommon.so
libDSA.so: CMakeFiles/DSA.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/devbox/Programming/CMake_Build_System/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C shared library libDSA.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DSA.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/DSA.dir/build: libDSA.so

.PHONY : CMakeFiles/DSA.dir/build

CMakeFiles/DSA.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/DSA.dir/cmake_clean.cmake
.PHONY : CMakeFiles/DSA.dir/clean

CMakeFiles/DSA.dir/depend:
	cd /home/devbox/Programming/CMake_Build_System && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/devbox/Programming/CMake_Build_System /home/devbox/Programming/CMake_Build_System /home/devbox/Programming/CMake_Build_System /home/devbox/Programming/CMake_Build_System /home/devbox/Programming/CMake_Build_System/CMakeFiles/DSA.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/DSA.dir/depend

