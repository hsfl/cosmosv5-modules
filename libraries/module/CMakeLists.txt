cmake_minimum_required(VERSION 3.20)

FILE(GLOB INCLUDES ${CMAKE_CURRENT_SOURCE_DIR}/*.h)

add_library(CosmosModule STATIC
    file_module.cpp file_module.h
    websocket_module.cpp websocket_module.h
    packethandler_module.cpp packethandler_module.h
    node_propagator_module.cpp node_propagator_module.h)
target_link_libraries(CosmosModule CosmosAgent CosmosPacketHandler CosmosTransfer CosmosSimulator CosmosNetwork CosmosSupport ${COSMOS_LIBS})

install(FILES ${INCLUDES} DESTINATION include/module)
