cmake_minimum_required(VERSION 2.8.9)

include_directories(include)
add_library(commonlib SHARED common.c include/common.h)

add_executable(getpid getpid.c)
target_link_libraries(getpid commonlib)

install( TARGETS commonlib getpid
           LIBRARY DESTINATION lib/
           RUNTIME DESTINATION bin/
         )
