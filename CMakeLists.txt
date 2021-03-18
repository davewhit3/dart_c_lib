cmake_minimum_required(VERSION 3.17)
project(flutter VERSION 1.0.0 LANGUAGES C)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

set(SOURCES library.c library.def)

add_library(flutter SHARED ${SOURCES})
add_executable(flutter_test ${SOURCES})

set_target_properties(flutter PROPERTIES
    PUBLIC_HEADER library.h
    VERSION ${PROJECT_VERSION}
    SOVERSION 1
    OUTPUT_NAME "flutter"
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "Hex_Identity_ID_Goes_Here"
)