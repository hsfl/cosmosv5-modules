cmake_minimum_required(VERSION 3.20)

add_executable(agent_file agent_file.cpp)
target_link_libraries(agent_file CosmosAgent CosmosModule CosmosTransfer CosmosTransferLib CosmosPacketHandler FileSenderImpl)
install(TARGETS agent_file DESTINATION bin)
