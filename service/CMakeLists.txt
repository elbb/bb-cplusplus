cmake_minimum_required(VERSION 3.8)

project(cplusplus_service)

add_executable(cplusplus_service src/main.cpp)
install(TARGETS cplusplus_service DESTINATION .)
