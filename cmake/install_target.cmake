# FILENAME: install_target.cmake
# -----------------------------------------------------------------------------
# DESCRIPTION: Provides a function to install a specified target (executable or
# library) into a designated directory. This script facilitates the installation
# process by defining where and how the built targets are to be installed in the
# system.
# -----------------------------------------------------------------------------

function(install_target target_name install_directory)
    install(TARGETS ${target_name} DESTINATION ${install_directory})
endfunction()

# *** end of file ***