cmake_minimum_required(VERSION 3.16)
project(DataStructures VERSION 0.0.0 LANGUAGES "C")

# Set the C standard
set(CMAKE_C_STANDARD 11)

# DataStructures target
set(LIBRARY_SOURCES
    src/queue.c
    src/hash_table.c
    # add more data structure source files here as they are created
)

add_library(DataStructures SHARED ${LIBRARY_SOURCES})
setup_target(DataStructures ${DataStructures_SOURCE_DIR})

