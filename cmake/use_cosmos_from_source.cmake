if(NOT DEFINED COSMOS_MODULES_INCLUDED)
set(COSMOS_MODULES_INCLUDED TRUE)

get_filename_component(COSMOS_SOURCE_MODULES "${CMAKE_CURRENT_LIST_DIR}/.." ABSOLUTE)

if(DEFINED COSMOS_SOURCE)
    # Auto-initialize the lower-layer submodule if not present
    if(NOT EXISTS "${COSMOS_SOURCE}/agent/CMakeLists.txt")
        message(STATUS "cosmosv5: initializing agent submodule...")
        execute_process(
            COMMAND git submodule update --init agent
            WORKING_DIRECTORY "${COSMOS_SOURCE}"
            RESULT_VARIABLE _cosmos_git_result
        )
        if(NOT _cosmos_git_result EQUAL 0)
            message(FATAL_ERROR
                "cosmosv5: agent submodule is not initialized and auto-init failed.\n"
                "Run from the cosmosv5 workspace root:\n"
                "  git submodule update --init agent")
        endif()
    endif()
    include(${COSMOS_SOURCE}/agent/cmake/use_cosmos_from_source.cmake)

    # Auto-initialize thirdparty for localjpeg and localpng (upper-layer tools only).
    # Agent chain has already run micro-agent which sets COSMOS_ZLIB_INCLUDE_DIR for localpng.
    if(NOT EXISTS "${COSMOS_SOURCE}/thirdparty/CMakeLists.txt")
        message(STATUS "cosmosv5: initializing thirdparty submodule...")
        execute_process(
            COMMAND git submodule update --init thirdparty
            WORKING_DIRECTORY "${COSMOS_SOURCE}"
            RESULT_VARIABLE _cosmos_git_result
        )
        if(NOT _cosmos_git_result EQUAL 0)
            message(FATAL_ERROR
                "cosmosv5: thirdparty submodule is not initialized and auto-init failed.\n"
                "Run from the cosmosv5 workspace root:\n"
                "  git submodule update --init thirdparty")
        endif()
    endif()
    include(${COSMOS_SOURCE}/thirdparty/cmake/use_cosmos_from_source.cmake)
else()
    message(FATAL_ERROR "COSMOS_SOURCE not set. Set COSMOS_SOURCE to the cosmosv5 workspace root (the directory containing thirdparty/, kernel/, etc.).")
endif()

message("Using COSMOS modules from " ${COSMOS_SOURCE_MODULES})

include_directories(${COSMOS_SOURCE_MODULES}/libraries)

add_subdirectory(${COSMOS_SOURCE_MODULES}/libraries/module ${CMAKE_BINARY_DIR}/modules/libraries/module)

endif()
