if(NOT DEFINED COSMOS_MODULES_INCLUDED)
set(COSMOS_MODULES_INCLUDED TRUE)

include(${COSMOS_SOURCE}/agent/cmake/use_cosmos_from_source.cmake)

set(COSMOS_SOURCE_MODULES ${COSMOS_SOURCE}/modules)
message("Using COSMOS modules from " ${COSMOS_SOURCE_MODULES})

include_directories(${COSMOS_SOURCE_MODULES}/libraries)

add_subdirectory(${COSMOS_SOURCE_MODULES}/libraries/module ${CMAKE_BINARY_DIR}/modules/libraries/module)

endif()
