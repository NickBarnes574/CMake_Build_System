function(add_all_libraries)
    # Setup libraries
    if(USE_COMMON)
        setup_library(Common "0_Common")
    endif()

    if(USE_MATH)
        if(NOT USE_COMMON)
            message(FATAL_ERROR "Math library depends on the Common library.")
        endif()

        setup_library(Math "1_Math")
        target_link_libraries(Math PUBLIC Common)
    endif()

    if(USE_DSA)
        if(NOT USE_COMMON)
            message(FATAL_ERROR "DSA library depends on the Common library.")
        endif()

        setup_library(DSA "2_DataStructures")
        target_link_libraries(DSA PUBLIC Common)
    endif()

    if(USE_THREADING)
        if((NOT USE_COMMON) OR (NOT USE_DSA))
            message(FATAL_ERROR "Threading library depends on the Common and DSA libraries.")
        endif()

        setup_library(Threading "3_Threading")
        target_link_libraries(Threading PUBLIC Common DSA pthread)
    endif()

    if(USE_NETWORKING)
        if((NOT USE_COMMON) OR (NOT USE_THREADING))
            message(FATAL_ERROR "Networking library depends on the Threading library.")
        endif()

        setup_library(Networking "4_Networking")
        target_link_libraries(Networking PUBLIC Common Threading)
    endif()

endfunction()

# ------------IN PROGRESS------------

# *** end of file ***
