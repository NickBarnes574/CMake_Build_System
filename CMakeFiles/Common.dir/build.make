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
include CMakeFiles/Common.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Common.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Common.dir/flags.make

CMakeFiles/Common.dir/libraries/0_Common/src/file_io.c.o: CMakeFiles/Common.dir/flags.make
CMakeFiles/Common.dir/libraries/0_Common/src/file_io.c.o: libraries/0_Common/src/file_io.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/devbox/Programming/CMake_Build_System/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/Common.dir/libraries/0_Common/src/file_io.c.o"
	$(CMAKE_COMMAND) -E __run_co_compile --tidy="clang-tidy;-checks=*,-readability-function-cognitive-complexity,-altera*,-cert-dcl03-c,-misc-static-assert,-llvm-include-order,-llvmlibc-*,-hicpp-*,-concurrency-mt-unsafe,-bugprone-easily-swappable-parameters,-cppcoreguidelines-*,-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling,-readability-magic-numbers,-android-cloexec-accept," --source=/home/devbox/Programming/CMake_Build_System/libraries/0_Common/src/file_io.c -- /opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Common.dir/libraries/0_Common/src/file_io.c.o   -c /home/devbox/Programming/CMake_Build_System/libraries/0_Common/src/file_io.c

CMakeFiles/Common.dir/libraries/0_Common/src/file_io.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Common.dir/libraries/0_Common/src/file_io.c.i"
	/opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/devbox/Programming/CMake_Build_System/libraries/0_Common/src/file_io.c > CMakeFiles/Common.dir/libraries/0_Common/src/file_io.c.i

CMakeFiles/Common.dir/libraries/0_Common/src/file_io.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Common.dir/libraries/0_Common/src/file_io.c.s"
	/opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/devbox/Programming/CMake_Build_System/libraries/0_Common/src/file_io.c -o CMakeFiles/Common.dir/libraries/0_Common/src/file_io.c.s

CMakeFiles/Common.dir/libraries/0_Common/src/signal_handler.c.o: CMakeFiles/Common.dir/flags.make
CMakeFiles/Common.dir/libraries/0_Common/src/signal_handler.c.o: libraries/0_Common/src/signal_handler.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/devbox/Programming/CMake_Build_System/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/Common.dir/libraries/0_Common/src/signal_handler.c.o"
	$(CMAKE_COMMAND) -E __run_co_compile --tidy="clang-tidy;-checks=*,-readability-function-cognitive-complexity,-altera*,-cert-dcl03-c,-misc-static-assert,-llvm-include-order,-llvmlibc-*,-hicpp-*,-concurrency-mt-unsafe,-bugprone-easily-swappable-parameters,-cppcoreguidelines-*,-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling,-readability-magic-numbers,-android-cloexec-accept," --source=/home/devbox/Programming/CMake_Build_System/libraries/0_Common/src/signal_handler.c -- /opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Common.dir/libraries/0_Common/src/signal_handler.c.o   -c /home/devbox/Programming/CMake_Build_System/libraries/0_Common/src/signal_handler.c

CMakeFiles/Common.dir/libraries/0_Common/src/signal_handler.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Common.dir/libraries/0_Common/src/signal_handler.c.i"
	/opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/devbox/Programming/CMake_Build_System/libraries/0_Common/src/signal_handler.c > CMakeFiles/Common.dir/libraries/0_Common/src/signal_handler.c.i

CMakeFiles/Common.dir/libraries/0_Common/src/signal_handler.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Common.dir/libraries/0_Common/src/signal_handler.c.s"
	/opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/devbox/Programming/CMake_Build_System/libraries/0_Common/src/signal_handler.c -o CMakeFiles/Common.dir/libraries/0_Common/src/signal_handler.c.s

CMakeFiles/Common.dir/libraries/0_Common/src/string_operations.c.o: CMakeFiles/Common.dir/flags.make
CMakeFiles/Common.dir/libraries/0_Common/src/string_operations.c.o: libraries/0_Common/src/string_operations.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/devbox/Programming/CMake_Build_System/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/Common.dir/libraries/0_Common/src/string_operations.c.o"
	$(CMAKE_COMMAND) -E __run_co_compile --tidy="clang-tidy;-checks=*,-readability-function-cognitive-complexity,-altera*,-cert-dcl03-c,-misc-static-assert,-llvm-include-order,-llvmlibc-*,-hicpp-*,-concurrency-mt-unsafe,-bugprone-easily-swappable-parameters,-cppcoreguidelines-*,-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling,-readability-magic-numbers,-android-cloexec-accept," --source=/home/devbox/Programming/CMake_Build_System/libraries/0_Common/src/string_operations.c -- /opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Common.dir/libraries/0_Common/src/string_operations.c.o   -c /home/devbox/Programming/CMake_Build_System/libraries/0_Common/src/string_operations.c

CMakeFiles/Common.dir/libraries/0_Common/src/string_operations.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Common.dir/libraries/0_Common/src/string_operations.c.i"
	/opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/devbox/Programming/CMake_Build_System/libraries/0_Common/src/string_operations.c > CMakeFiles/Common.dir/libraries/0_Common/src/string_operations.c.i

CMakeFiles/Common.dir/libraries/0_Common/src/string_operations.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Common.dir/libraries/0_Common/src/string_operations.c.s"
	/opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/devbox/Programming/CMake_Build_System/libraries/0_Common/src/string_operations.c -o CMakeFiles/Common.dir/libraries/0_Common/src/string_operations.c.s

CMakeFiles/Common.dir/libraries/0_Common/src/utilities.c.o: CMakeFiles/Common.dir/flags.make
CMakeFiles/Common.dir/libraries/0_Common/src/utilities.c.o: libraries/0_Common/src/utilities.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/devbox/Programming/CMake_Build_System/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/Common.dir/libraries/0_Common/src/utilities.c.o"
	$(CMAKE_COMMAND) -E __run_co_compile --tidy="clang-tidy;-checks=*,-readability-function-cognitive-complexity,-altera*,-cert-dcl03-c,-misc-static-assert,-llvm-include-order,-llvmlibc-*,-hicpp-*,-concurrency-mt-unsafe,-bugprone-easily-swappable-parameters,-cppcoreguidelines-*,-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling,-readability-magic-numbers,-android-cloexec-accept," --source=/home/devbox/Programming/CMake_Build_System/libraries/0_Common/src/utilities.c -- /opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/Common.dir/libraries/0_Common/src/utilities.c.o   -c /home/devbox/Programming/CMake_Build_System/libraries/0_Common/src/utilities.c

CMakeFiles/Common.dir/libraries/0_Common/src/utilities.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/Common.dir/libraries/0_Common/src/utilities.c.i"
	/opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/devbox/Programming/CMake_Build_System/libraries/0_Common/src/utilities.c > CMakeFiles/Common.dir/libraries/0_Common/src/utilities.c.i

CMakeFiles/Common.dir/libraries/0_Common/src/utilities.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/Common.dir/libraries/0_Common/src/utilities.c.s"
	/opt/aarch64--glibc--stable-2023.11-1/bin/aarch64-linux-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/devbox/Programming/CMake_Build_System/libraries/0_Common/src/utilities.c -o CMakeFiles/Common.dir/libraries/0_Common/src/utilities.c.s

# Object files for target Common
Common_OBJECTS = \
"CMakeFiles/Common.dir/libraries/0_Common/src/file_io.c.o" \
"CMakeFiles/Common.dir/libraries/0_Common/src/signal_handler.c.o" \
"CMakeFiles/Common.dir/libraries/0_Common/src/string_operations.c.o" \
"CMakeFiles/Common.dir/libraries/0_Common/src/utilities.c.o"

# External object files for target Common
Common_EXTERNAL_OBJECTS =

libCommon.so: CMakeFiles/Common.dir/libraries/0_Common/src/file_io.c.o
libCommon.so: CMakeFiles/Common.dir/libraries/0_Common/src/signal_handler.c.o
libCommon.so: CMakeFiles/Common.dir/libraries/0_Common/src/string_operations.c.o
libCommon.so: CMakeFiles/Common.dir/libraries/0_Common/src/utilities.c.o
libCommon.so: CMakeFiles/Common.dir/build.make
libCommon.so: CMakeFiles/Common.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/devbox/Programming/CMake_Build_System/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking C shared library libCommon.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Common.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Common.dir/build: libCommon.so

.PHONY : CMakeFiles/Common.dir/build

CMakeFiles/Common.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Common.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Common.dir/clean

CMakeFiles/Common.dir/depend:
	cd /home/devbox/Programming/CMake_Build_System && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/devbox/Programming/CMake_Build_System /home/devbox/Programming/CMake_Build_System /home/devbox/Programming/CMake_Build_System /home/devbox/Programming/CMake_Build_System /home/devbox/Programming/CMake_Build_System/CMakeFiles/Common.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Common.dir/depend

