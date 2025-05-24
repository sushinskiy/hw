cmake_minimum_required(VERSION 3.10)
project(hw)

message(---${CMAKE_PREFIX_PATH})

find_package(ZLIB REQUIRED)

add_executable(hw main.cpp
    build.sh)
target_link_libraries(hw ZLIB::ZLIB)

install(TARGETS hw
        RUNTIME DESTINATION bin)


if(NOT DEFINED DLIB_EXT)
    set(DLIB_EXT ".dll")
endif(NOT DEFINED DLIB_EXT)

if (WIN32)
    set(ZLIB_DYNAMIC_LIB_PATHS ${ZLIB_LIBRARIES}/../../lib/zlib${DLIB_EXT})
else(WIN32)
    #cmake_path(GET  PARENT_PATH LIB_FOLDER)

    message(=== ${ZLIB_LIBRARIES})

    #file(GLOB

    set(RUNTIME_SO_PATH ${ZLIB_LIBRARIES}.1)            # -> libz.so.1
    if (NOT EXISTS ${RUNTIME_SO_PATH})                  #for a while only 1.* version is supported
        error(${RUNTIME_SO_PATH} "doesn't exist")
    endif()

    get_filename_component(ZLIB_REAL_PATH ${RUNTIME_SO_PATH} REALPATH)
    set(ZLIB_DYNAMIC_LIB_PATHS ${ZLIB_REAL_PATH} ${RUNTIME_SO_PATH})
endif (WIN32)

install(FILES ${ZLIB_DYNAMIC_LIB_PATHS} DESTINATION bin)
