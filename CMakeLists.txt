cmake_minimum_required (VERSION	 3.10)

project(kolo)

include_directories(include)

file(GLOB SOURCES "src/*.cpp")
add_executable(kolo ${SOURCES})


