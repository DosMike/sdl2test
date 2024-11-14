cmake_minimum_required(VERSION 3.24)
# your project name is used for deriving binary names and to add dependencies
project(application)

# find dependencies here
# use the CMake package name listed on conan.io
find_package(SDL2 REQUIRED CONFIG)
#find_package(SDL2_image REQUIRED CONFIG)
#find_package(SDL2_ttf REQUIRED CONFIG)

# add your cpp files here. header files are found if #included in the cpp files.
set(SOURCE_FILES src/main.cpp)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})

# add dependencies to your executable
# use the CMake target name listed on conan.io
target_link_libraries(${PROJECT_NAME} PRIVATE SDL2::SDL2main SDL2::SDL2-static)
#target_link_libraries(${PROJECT_NAME} PRIVATE SDL2_image::SDL2_image-static)
#target_link_libraries(${PROJECT_NAME} PRIVATE sdl_ttf::sdl_ttf)
