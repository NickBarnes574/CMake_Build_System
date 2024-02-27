# FILENAME: add_target.cmake
# -----------------------------------------------------------------------------
# DESCRIPTION: Adds a target to the target list
# -----------------------------------------------------------------------------

function(add_target TARGET_NAME ENDPOINT TARGET_TYPE PROJECT_DIRECTORY LIBRARIES)
    set(PROJECT_DIR "${CMAKE_SOURCE_DIR}/${PROJECT_DIRECTORY}")
    # Determine the endpoint directory

    # Local endpoint
    if(ENDPOINT STREQUAL "LOCAL")
        file(GLOB SOURCES "${PROJECT_DIR}/local/src/*.c")
        set(INCLUDES ${PROJECT_DIR}/local/include)
    
    # Remote endpoint
    elseif(ENDPOINT STREQUAL "REMOTE")
        file(GLOB SOURCES "${PROJECT_DIR}/remote/src/*.c")
        message(STATUS "SOURCES: " ${SOURCES})
        set(INCLUDES ${PROJECT_DIR}/remote/include)
    else()
        message(FATAL_ERROR "Invalid target endpoint. Must be 'LOCAL' or 'REMOTE'.")
    endif()

    # Determine the target type

    # Executable program
    if(TARGET_TYPE STREQUAL "EXE")
        add_exe("${TARGET_NAME}" "${ENDPOINT}" "${SOURCES}" "${INCLUDES}" "${LIBRARIES}")
    
    # Shared object library
    elseif(TARGET_TYPE STREQUAL "LIB")
        # TODO: Add LIB functionality
        message(WARNING "Shared object library functionality not implemented yet.")
    else()
        message(FATAL_ERROR "Invalid target type. Must be 'EXE' or 'LIB'.")
    endif()
endfunction()

# ------------IN PROGRESS------------

# *** end of file ***