.PHONY: setup release debug aarch64 clean

MAKEFLAGS += --no-print-directory

default: release

setup:
	@mkdir -p build/ bin/

release: setup
	@mkdir -p build/x86_64/
	@cd build/x86_64/ && cmake ../.. -DCMAKE_BUILD_TYPE=Release
	@cmake --build build/x86_64/

debug: setup
	@mkdir -p build/x86_64/
	@cd build/x86_64/ && cmake ../.. -DCMAKE_BUILD_TYPE=Debug
	@cmake --build build/x86_64/

aarch64: setup
	@mkdir -p build/aarch64/
	@cd build/aarch64/ && cmake ../.. -DCMAKE_TOOLCHAIN_FILE=../../cmake/toolchains/aarch64-glibc-toolchain.cmake
	@cmake --build build/aarch64/

clean:
	@rm -rf build/ bin/