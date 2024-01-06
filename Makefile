.PHONY: release debug clean aarch64

release:
	cmake --build . --config release

debug:
	cmake --build . --config debug

clean:
	cmake --build . --target clean

aarch64:
	cmake -DCMAKE_TOOLCHAIN_FILE=cmake/toolchains/aarch64-glibc-toolchain.cmake -Bbuild/aarch64 -H.
	cmake --build build/aarch64