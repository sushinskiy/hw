cmake_minimum_required(VERSION 3.10)
project(hw)

find_package(ZLIB REQUIRED)

add_executable(hw main.cpp)
target_link_libraries(hw ZLIB::ZLIB)