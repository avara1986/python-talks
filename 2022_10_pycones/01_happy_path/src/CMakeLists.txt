cmake_minimum_required(VERSION 3.22)
project(binarysearch)

set(CMAKE_CXX_STANDARD 17)
# set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_BUILD_TYPE Release)

add_compile_options(-fPIC -fexceptions -fvisibility=hidden -pthread -Wall -Wwrite-strings)

# Dependencies

# Create Executable
include_directories(.)

add_executable(binarysearch
        binarysearch.cpp
        binarysearch.hpp)

# Link dependencies
target_link_libraries(binarysearch ${SQLite3_LIBRARIES})