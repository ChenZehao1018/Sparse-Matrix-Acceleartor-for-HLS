// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XKRNL_SPARSE_MATRIX_ACC_H
#define XKRNL_SPARSE_MATRIX_ACC_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xkrnl_sparse_matrix_acc_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XKrnl_sparse_matrix_acc_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XKrnl_sparse_matrix_acc;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XKrnl_sparse_matrix_acc_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XKrnl_sparse_matrix_acc_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XKrnl_sparse_matrix_acc_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XKrnl_sparse_matrix_acc_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XKrnl_sparse_matrix_acc_Initialize(XKrnl_sparse_matrix_acc *InstancePtr, u16 DeviceId);
XKrnl_sparse_matrix_acc_Config* XKrnl_sparse_matrix_acc_LookupConfig(u16 DeviceId);
int XKrnl_sparse_matrix_acc_CfgInitialize(XKrnl_sparse_matrix_acc *InstancePtr, XKrnl_sparse_matrix_acc_Config *ConfigPtr);
#else
int XKrnl_sparse_matrix_acc_Initialize(XKrnl_sparse_matrix_acc *InstancePtr, const char* InstanceName);
int XKrnl_sparse_matrix_acc_Release(XKrnl_sparse_matrix_acc *InstancePtr);
#endif

void XKrnl_sparse_matrix_acc_Start(XKrnl_sparse_matrix_acc *InstancePtr);
u32 XKrnl_sparse_matrix_acc_IsDone(XKrnl_sparse_matrix_acc *InstancePtr);
u32 XKrnl_sparse_matrix_acc_IsIdle(XKrnl_sparse_matrix_acc *InstancePtr);
u32 XKrnl_sparse_matrix_acc_IsReady(XKrnl_sparse_matrix_acc *InstancePtr);
void XKrnl_sparse_matrix_acc_EnableAutoRestart(XKrnl_sparse_matrix_acc *InstancePtr);
void XKrnl_sparse_matrix_acc_DisableAutoRestart(XKrnl_sparse_matrix_acc *InstancePtr);

void XKrnl_sparse_matrix_acc_Set_HLSPtr_i(XKrnl_sparse_matrix_acc *InstancePtr, u64 Data);
u64 XKrnl_sparse_matrix_acc_Get_HLSPtr_i(XKrnl_sparse_matrix_acc *InstancePtr);
void XKrnl_sparse_matrix_acc_Set_matrixA_hls_idx(XKrnl_sparse_matrix_acc *InstancePtr, u64 Data);
u64 XKrnl_sparse_matrix_acc_Get_matrixA_hls_idx(XKrnl_sparse_matrix_acc *InstancePtr);
void XKrnl_sparse_matrix_acc_Set_matrixA_i(XKrnl_sparse_matrix_acc *InstancePtr, u64 Data);
u64 XKrnl_sparse_matrix_acc_Get_matrixA_i(XKrnl_sparse_matrix_acc *InstancePtr);
void XKrnl_sparse_matrix_acc_Set_matrixB_i(XKrnl_sparse_matrix_acc *InstancePtr, u64 Data);
u64 XKrnl_sparse_matrix_acc_Get_matrixB_i(XKrnl_sparse_matrix_acc *InstancePtr);
void XKrnl_sparse_matrix_acc_Set_matrixC_o(XKrnl_sparse_matrix_acc *InstancePtr, u64 Data);
u64 XKrnl_sparse_matrix_acc_Get_matrixC_o(XKrnl_sparse_matrix_acc *InstancePtr);
void XKrnl_sparse_matrix_acc_Set_lenEdgeListPtr(XKrnl_sparse_matrix_acc *InstancePtr, u32 Data);
u32 XKrnl_sparse_matrix_acc_Get_lenEdgeListPtr(XKrnl_sparse_matrix_acc *InstancePtr);
void XKrnl_sparse_matrix_acc_Set_lenEdgePtr(XKrnl_sparse_matrix_acc *InstancePtr, u32 Data);
u32 XKrnl_sparse_matrix_acc_Get_lenEdgePtr(XKrnl_sparse_matrix_acc *InstancePtr);
void XKrnl_sparse_matrix_acc_Set_M(XKrnl_sparse_matrix_acc *InstancePtr, u32 Data);
u32 XKrnl_sparse_matrix_acc_Get_M(XKrnl_sparse_matrix_acc *InstancePtr);
void XKrnl_sparse_matrix_acc_Set_K(XKrnl_sparse_matrix_acc *InstancePtr, u32 Data);
u32 XKrnl_sparse_matrix_acc_Get_K(XKrnl_sparse_matrix_acc *InstancePtr);
void XKrnl_sparse_matrix_acc_Set_N(XKrnl_sparse_matrix_acc *InstancePtr, u32 Data);
u32 XKrnl_sparse_matrix_acc_Get_N(XKrnl_sparse_matrix_acc *InstancePtr);

void XKrnl_sparse_matrix_acc_InterruptGlobalEnable(XKrnl_sparse_matrix_acc *InstancePtr);
void XKrnl_sparse_matrix_acc_InterruptGlobalDisable(XKrnl_sparse_matrix_acc *InstancePtr);
void XKrnl_sparse_matrix_acc_InterruptEnable(XKrnl_sparse_matrix_acc *InstancePtr, u32 Mask);
void XKrnl_sparse_matrix_acc_InterruptDisable(XKrnl_sparse_matrix_acc *InstancePtr, u32 Mask);
void XKrnl_sparse_matrix_acc_InterruptClear(XKrnl_sparse_matrix_acc *InstancePtr, u32 Mask);
u32 XKrnl_sparse_matrix_acc_InterruptGetEnabled(XKrnl_sparse_matrix_acc *InstancePtr);
u32 XKrnl_sparse_matrix_acc_InterruptGetStatus(XKrnl_sparse_matrix_acc *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
