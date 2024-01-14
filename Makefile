# This Makefile provides commands to build and deploy the project in various configurations.
#
# Targets:
#   default:    Builds the project in the release configuration for x86_64.
#   release:    Builds and installs the project in release mode for x86_64.
#   debug:      Builds and installs the project in debug mode for x86_64.
#   aarch64:    Builds and installs the project for the aarch64 architecture using a specified toolchain.
#   clean:      Cleans up the build directories and any generated documentation.
#
# Usage:
#   make [target] - Build the project using the specified target.
#                   If no target is specified, 'default' is used.
#
# *** end of Makefile brief ***

MAKEFLAGS += --no-print-directory # Suppress 'Entering directory' messages.

default: release

all: release debug aarch64

release:
	@cmake -S . -B build/x86_64 -DCMAKE_BUILD_TYPE=Release
	@cmake --build build/x86_64 --target install

debug:
	@cmake -S . -B build/x86_64 -DCMAKE_BUILD_TYPE=Debug
	@cmake --build build/x86_64 --target install

aarch64:
	@cmake -S . -B build/aarch64 -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=cmake/toolchains/aarch64-glibc-toolchain.cmake
	@cmake --build build/aarch64 --target install

clean:
	@rm -rf build
	@rm -rf release
	@rm -rf debug
	@rm -rf docs

.PHONY: setup release debug clean aarch64 all

# *** end of file ***