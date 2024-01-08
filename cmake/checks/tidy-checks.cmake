# FILENAME: tidy-checks.cmake
# -----------------------------------------------------------------------------
# DESCRIPTION: Configures Clang-Tidy for static analysis, setting specific 
# checks and compiler options. Defines a function to configure build targets 
# with Clang-Tidy if available.
# -----------------------------------------------------------------------------

find_program(CLANG_TIDY_PROG clang-tidy)

if(CLANG_TIDY_PROG)
    # Set the CMAKE_C_CLANG_TIDY variable to use clang-tidy with specified checks.
    # These checks are used when clang-tidy runs on C files.
    set(CMAKE_C_CLANG_TIDY
        "${CLANG_TIDY_PROG};--checks*,-llvm-include-order,-cppcoreguidelines-*,\
        -readability-magic-numbers,-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling,\
        -hiccp-no-assembler")
else()
    # If Clang-Tidy is not found, use gcc as the C compiler.
    set(CMAKE_C_COMPILER gcc)
endif()

# Function Definition: setup_target
# This function configures a target with include directories, compiler options,
# and Clang-Tidy checks if Clang-Tidy is available.
function(setup_target TARGET_NAME SOURCE_DIR)
    target_include_directories(${TARGET_NAME} PRIVATE ${SOURCE_DIR}/include)

    if(CLANG_TIDY_PROG)
        set_target_properties(${TARGET_NAME} PROPERTIES C_CLANG_TIDY "${CMAKE_C_CLANG_TIDY}")

        # Add debugging information
        target_compile_options(${TARGET_NAME} PRIVATE -g)
    else()
        # If Clang-Tidy is not available, add general gcc compiler options for the target.
        target_compile_options(${TARGET_NAME} PRIVATE -g -Wall -pedantic)
    endif()
endfunction()

# *** end of file ***