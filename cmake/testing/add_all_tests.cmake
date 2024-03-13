# FILENAME: add_all_tests.cmake
# -----------------------------------------------------------------------------
# DESCRIPTION: Defines a function to add test suites for each target in the 
# project. This script is responsible for integrating unit tests.
# -----------------------------------------------------------------------------

# Function to add test suites for each target
function(add_all_tests)
# Assuming all tests link against 'my_project_lib' and potentially 'other_dependency_lib'
set(COMMON_LIBRARIES my_project_lib other_dependency_lib)

file(GLOB TEST_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/tests/*.c")

foreach(TEST_SOURCE ${TEST_SOURCES})
    get_filename_component(TEST_NAME ${TEST_SOURCE} NAME_WE)
    # Now calling add_single_test with COMMON_LIBRARIES passed through ${ARGN}
    add_single_test(${TEST_NAME} ${TEST_SOURCE} ${COMMON_LIBRARIES})
endforeach()
endfunction()

# *** end of file ***