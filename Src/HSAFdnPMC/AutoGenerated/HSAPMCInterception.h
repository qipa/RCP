//==============================================================================
// Copyright (c) 2015-2017 Advanced Micro Devices, Inc. All rights reserved.
/// \author AMD Developer Tools Team
/// \file
/// \brief THIS CODE WAS AUTOGENERATED BY PASSTHROUGHGENERATOR ON 06/16/17
//==============================================================================

#ifndef _HSAPMCINTERCEPTION_H_
#define _HSAPMCINTERCEPTION_H_

#include <hsa_api_trace.h>

extern CoreApiTable* g_pRealCoreFunctions;    ///< table of real core functions
extern FinalizerExtTable* g_pRealFinalizerExtFunctions; ///< table of real finalizer extension functions
extern ImageExtTable* g_pRealImageExtFunctions; ///< table of real image extension functions
extern AmdExtTable* g_pRealAmdExtFunctions; ///< table of real AMD extension functions

/// Intercepts HSA APIs for this HSA Profiler agent
void InitHSAAPIInterceptPMC(HsaApiTable* pTable);

/// Cleans up API interception for this HSA Profiler agent
void DoneHSAAPIInterceptPMC();

hsa_status_t HSA_PMC_hsa_agent_get_info(hsa_agent_t agent, hsa_agent_info_t attribute, void* value);
hsa_status_t HSA_PMC_hsa_iterate_agents(hsa_status_t (*callback)(hsa_agent_t agent, void* data), void* data);
hsa_status_t HSA_PMC_hsa_queue_create(hsa_agent_t agent, uint32_t size, hsa_queue_type32_t type, void (*callback)(hsa_status_t status, hsa_queue_t* source, void* data), void* data, uint32_t private_segment_size, uint32_t group_segment_size, hsa_queue_t** queue);
hsa_status_t HSA_PMC_hsa_queue_destroy(hsa_queue_t* queue);
hsa_status_t HSA_PMC_hsa_executable_get_symbol(hsa_executable_t executable, const char* module_name, const char* symbol_name, hsa_agent_t agent, int32_t call_convention, hsa_executable_symbol_t* symbol);
hsa_status_t HSA_PMC_hsa_executable_get_symbol_by_name(hsa_executable_t executable, const char* symbol_name, const hsa_agent_t* agent, hsa_executable_symbol_t* symbol);
hsa_status_t HSA_PMC_hsa_executable_symbol_get_info(hsa_executable_symbol_t executable_symbol, hsa_executable_symbol_info_t attribute, void* value);


#endif // _HSAPMCINTERCEPTION_H_

