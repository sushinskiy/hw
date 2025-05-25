cmake_minimum_required(VERSION 3.10)
project(hw)

message(---${CMAKE_PREFIX_PATH})

find_package(ZLIB REQUIRED)

add_executable(hw main.cpp
    build.sh)
target_link_libraries(hw ZLIB::ZLIB)

install(TARGETS hw
        RUNTIME DESTINATION bin)

if (WIN32)
    set(ZLIB_DYNAMIC_LIB_PATHS ${ZLIB_LIBRARIES}/../../bin/zlib.dll)
else(WIN32)
    message(=== ${ZLIB_LIBRARIES})

    set(RUNTIME_SO_PATH ${ZLIB_LIBRARIES}.1)            # -> libz.so.1
    if (NOT EXISTS ${RUNTIME_SO_PATH})                  #for a while only 1.* version is supported
        error(${RUNTIME_SO_PATH} "doesn't exist")
    endif()

    get_filename_component(ZLIB_REAL_PATH ${RUNTIME_SO_PATH} REALPATH)
    set(ZLIB_DYNAMIC_LIB_PATHS ${ZLIB_REAL_PATH} ${RUNTIME_SO_PATH})
endif (WIN32)

install(FILES ${ZLIB_DYNAMIC_LIB_PATHS} DESTINATION bin)
