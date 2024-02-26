# FILENAME: add_target.cmake
# -----------------------------------------------------------------------------
# DESCRIPTION: Adds a target to the target list
# -----------------------------------------------------------------------------

function(add_target target_name endpoint target_type project_directory)
    set(PROJECT_DIR "${CMAKE_SOURCE_DIR}/${project_directory}")

    # Determine the endpoint directory
    if(endpoint STREQUAL "LOCAL")
        file(GLOB PROJECT_SOURCES "${PROJECT_DIR}/local/src/*.c")
        set(PROJECT_INCLUDES ${PROJECT_DIR}/local/include)
    elseif(endpoint STREQUAL "REMOTE")
        file(GLOB PROJECT_SOURCES "${PROJECT_DIR}/remote/src/*.c")
        set(PROJECT_INCLUDES ${PROJECT_DIR}/remote/include)
    else()
        message(FATAL_ERROR "Invalid target endpoint. Must be 'LOCAL' or 'REMOTE'.")
    endif()

    # Determine the target type
    if(target_type STREQUAL "EXE")
        add_exe("${target_name}" "${PROJECT_SOURCES} ${PROJECT_INCLUDES} ${PROJECT_LIBRARIES}")
    elseif(target_type STREQUAL "LIB")
        # TODO: Add LIB functionality
        message(WARNING "Shared object library functionality not implemented yet.")
    else()
        message FATAL_ERROR "Invalid target type. Must be 'EXE' or 'LIB'."
    endif()
endfunction()

# ------------IN PROGRESS------------

# *** end of file ***