cmake_minimum_required(VERSION 3.0)

project(TASK)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall")

execute_process(COMMAND python3 preparing.py WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/A)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

add_subdirectory(B ${PROJECT_SOURCE_DIR}/lib)

add_executable(C C/main.cpp)

target_link_libraries(C lib)
target_include_directories(C PUBLIC "${CMAKE_CURRENT_LIST_DIR}")
