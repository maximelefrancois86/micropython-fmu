add_library(ufmpy INTERFACE)

target_sources(ufmpy INTERFACE
    ${CMAKE_CURRENT_LIST_DIR}/hello
)

target_include_directories(ufmpy INTERFACE
    ${CMAKE_CURRENT_LIST_DIR}
)

target_link_libraries(usermod INTERFACE ufmpy)
