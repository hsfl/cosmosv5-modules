if(NOT DEFINED COSMOS_MODULES_INCLUDED)
set(COSMOS_MODULES_INCLUDED TRUE)

get_filename_component(COSMOS_SOURCE_MODULES "${CMAKE_CURRENT_LIST_DIR}/.." ABSOLUTE)

if(EXISTS "${COSMOS_SOURCE_MODULES}/deps/agent/cmake/use_cosmos_from_source.cmake")
    include(${COSMOS_SOURCE_MODULES}/deps/agent/cmake/use_cosmos_from_source.cmake)
elseif(DEFINED COSMOS_SOURCE)
    include(${COSMOS_SOURCE}/agent/cmake/use_cosmos_from_source.cmake)
else()
    message(FATAL_ERROR "Cannot find cosmosv5-agent. Clone with --recurse-submodules or set COSMOS_SOURCE.")
endif()

message("Using COSMOS modules from " ${COSMOS_SOURCE_MODULES})

include_directories(${COSMOS_SOURCE_MODULES}/libraries)

add_subdirectory(${COSMOS_SOURCE_MODULES}/libraries/module ${CMAKE_BINARY_DIR}/modules/libraries/module)

endif()
