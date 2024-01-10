MAKEFLAGS += --no-print-directory

default: release

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
	@rm -rf debug
	@rm -rf release
	@rm -rf docs/*.pdf

.PHONY: setup release debug clean aarch64