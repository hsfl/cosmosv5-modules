/*!
 * \file node_propagator_module.h
 * \brief Real-time orbit propagation capability module.
 * \ingroup cosmos_modules
 * \defgroup cosmos_node_propagator_module Node Propagator Module
 *
 * Composable module that runs an SGP4 or Gauss-Jackson propagator in a
 * background thread and continuously updates the node position, velocity, and
 * derived quantities in the COSMOS namespace. Attach to any agent that needs
 * live orbital ephemeris without a separate propagator agent.
 */

#ifndef NODE_PROPAGATOR_MODULE_H
#define NODE_PROPAGATOR_MODULE_H

// This module provides propagtion of states for a node

#include "physics/simulatorclass.h"

namespace Cosmos
{
    namespace Module
    {
        class NodePropagatorModule
        {
        public:

            NodePropagatorModule() {}

            int32_t Init(Support::cosmosstruc *cinfo);

            
        private:
            Physics::Simulator *sim = nullptr;
        };
    }
    
}

#endif // NODE_PROPAGATOR_MODULE_H
