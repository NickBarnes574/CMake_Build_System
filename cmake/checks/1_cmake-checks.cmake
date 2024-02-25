# FILENAME: cmake-checks.cmake
# -----------------------------------------------------------------------------
# DESCRIPTION: Configures a set of specific checks to be applied in the build 
# process. This includes enabling or disabling various static analysis and 
# compiler checks, tailored to the project's requirements and coding standards.
# -----------------------------------------------------------------------------

string(CONCAT CMAKE_CHECKS
    "*,"  # Include all checks

    # Disable the readability-function-cognitive-complexity check. This check
    # might flag functions deemed too complex cognitively.
    "-readability-function-cognitive-complexity,"

    # Disable all checks prefixed with 'altera'. These are typically specific to
    # Altera FPGA hardware and may not be relevant for general projects.
    "-altera*,"

    # Disable the CERT coding standard rule DCL03-C. This check relates to the
    # usage of const in declarations.
    "-cert-dcl03-c,"

    # Disable the miscellaneous static assertion check. This check can sometimes
    # be too strict for certain coding styles.
    "-misc-static-assert,"

    # Disable the LLVM include order check. This check enforces a specific order
    # of include directives which might not be suitable for all projects.
    "-llvm-include-order,"

    # Disable all checks prefixed with 'llvmlibc'. These are LLVM libc specific.
    "-llvmlibc-*,"

    # Disable all checks prefixed with 'hicpp'. These checks are related to
    # High Integrity C++ coding standard.
    "-hicpp-*,"

    # Disable the concurrency-mt-unsafe check. This check flags potentially
    # unsafe multithreading code, which might be intentional in some contexts.
    "-concurrency-mt-unsafe,"

    # Disable the check for bug-prone easily swappable parameters. This check
    # identifies functions where parameters could be easily confused.
    "-bugprone-easily-swappable-parameters,"

    # Disable all checks prefixed with 'cppcoreguidelines'. These checks enforce
    # the C++ Core Guidelines.
    "-cppcoreguidelines-*,"

    # Disable the clang static analyzer check for deprecated or unsafe buffer
    # handling in security-related code.
    "-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling"
)

# *** end of file ***