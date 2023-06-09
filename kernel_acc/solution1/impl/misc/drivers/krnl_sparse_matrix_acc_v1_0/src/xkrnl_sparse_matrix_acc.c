// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xkrnl_sparse_matrix_acc.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XKrnl_sparse_matrix_acc_CfgInitialize(XKrnl_sparse_matrix_acc *InstancePtr, XKrnl_sparse_matrix_acc_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XKrnl_sparse_matrix_acc_Start(XKrnl_sparse_matrix_acc *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_AP_CTRL) & 0x80;
    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XKrnl_sparse_matrix_acc_IsDone(XKrnl_sparse_matrix_acc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XKrnl_sparse_matrix_acc_IsIdle(XKrnl_sparse_matrix_acc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XKrnl_sparse_matrix_acc_IsReady(XKrnl_sparse_matrix_acc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XKrnl_sparse_matrix_acc_EnableAutoRestart(XKrnl_sparse_matrix_acc *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XKrnl_sparse_matrix_acc_DisableAutoRestart(XKrnl_sparse_matrix_acc *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_AP_CTRL, 0);
}

void XKrnl_sparse_matrix_acc_Set_HLSPtr_i(XKrnl_sparse_matrix_acc *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_HLSPTR_I_DATA, (u32)(Data));
    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_HLSPTR_I_DATA + 4, (u32)(Data >> 32));
}

u64 XKrnl_sparse_matrix_acc_Get_HLSPtr_i(XKrnl_sparse_matrix_acc *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_HLSPTR_I_DATA);
    Data += (u64)XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_HLSPTR_I_DATA + 4) << 32;
    return Data;
}

void XKrnl_sparse_matrix_acc_Set_matrixA_hls_idx(XKrnl_sparse_matrix_acc *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_MATRIXA_HLS_IDX_DATA, (u32)(Data));
    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_MATRIXA_HLS_IDX_DATA + 4, (u32)(Data >> 32));
}

u64 XKrnl_sparse_matrix_acc_Get_matrixA_hls_idx(XKrnl_sparse_matrix_acc *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_MATRIXA_HLS_IDX_DATA);
    Data += (u64)XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_MATRIXA_HLS_IDX_DATA + 4) << 32;
    return Data;
}

void XKrnl_sparse_matrix_acc_Set_matrixA_i(XKrnl_sparse_matrix_acc *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_MATRIXA_I_DATA, (u32)(Data));
    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_MATRIXA_I_DATA + 4, (u32)(Data >> 32));
}

u64 XKrnl_sparse_matrix_acc_Get_matrixA_i(XKrnl_sparse_matrix_acc *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_MATRIXA_I_DATA);
    Data += (u64)XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_MATRIXA_I_DATA + 4) << 32;
    return Data;
}

void XKrnl_sparse_matrix_acc_Set_matrixB_i(XKrnl_sparse_matrix_acc *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_MATRIXB_I_DATA, (u32)(Data));
    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_MATRIXB_I_DATA + 4, (u32)(Data >> 32));
}

u64 XKrnl_sparse_matrix_acc_Get_matrixB_i(XKrnl_sparse_matrix_acc *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_MATRIXB_I_DATA);
    Data += (u64)XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_MATRIXB_I_DATA + 4) << 32;
    return Data;
}

void XKrnl_sparse_matrix_acc_Set_matrixC_o(XKrnl_sparse_matrix_acc *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_MATRIXC_O_DATA, (u32)(Data));
    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_MATRIXC_O_DATA + 4, (u32)(Data >> 32));
}

u64 XKrnl_sparse_matrix_acc_Get_matrixC_o(XKrnl_sparse_matrix_acc *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_MATRIXC_O_DATA);
    Data += (u64)XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_MATRIXC_O_DATA + 4) << 32;
    return Data;
}

void XKrnl_sparse_matrix_acc_Set_lenEdgeListPtr(XKrnl_sparse_matrix_acc *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_LENEDGELISTPTR_DATA, Data);
}

u32 XKrnl_sparse_matrix_acc_Get_lenEdgeListPtr(XKrnl_sparse_matrix_acc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_LENEDGELISTPTR_DATA);
    return Data;
}

void XKrnl_sparse_matrix_acc_Set_lenEdgePtr(XKrnl_sparse_matrix_acc *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_LENEDGEPTR_DATA, Data);
}

u32 XKrnl_sparse_matrix_acc_Get_lenEdgePtr(XKrnl_sparse_matrix_acc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_LENEDGEPTR_DATA);
    return Data;
}

void XKrnl_sparse_matrix_acc_Set_M(XKrnl_sparse_matrix_acc *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_M_DATA, Data);
}

u32 XKrnl_sparse_matrix_acc_Get_M(XKrnl_sparse_matrix_acc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_M_DATA);
    return Data;
}

void XKrnl_sparse_matrix_acc_Set_K(XKrnl_sparse_matrix_acc *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_K_DATA, Data);
}

u32 XKrnl_sparse_matrix_acc_Get_K(XKrnl_sparse_matrix_acc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_K_DATA);
    return Data;
}

void XKrnl_sparse_matrix_acc_Set_N(XKrnl_sparse_matrix_acc *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_N_DATA, Data);
}

u32 XKrnl_sparse_matrix_acc_Get_N(XKrnl_sparse_matrix_acc *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_N_DATA);
    return Data;
}

void XKrnl_sparse_matrix_acc_InterruptGlobalEnable(XKrnl_sparse_matrix_acc *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_GIE, 1);
}

void XKrnl_sparse_matrix_acc_InterruptGlobalDisable(XKrnl_sparse_matrix_acc *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_GIE, 0);
}

void XKrnl_sparse_matrix_acc_InterruptEnable(XKrnl_sparse_matrix_acc *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_IER);
    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_IER, Register | Mask);
}

void XKrnl_sparse_matrix_acc_InterruptDisable(XKrnl_sparse_matrix_acc *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_IER);
    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_IER, Register & (~Mask));
}

void XKrnl_sparse_matrix_acc_InterruptClear(XKrnl_sparse_matrix_acc *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_sparse_matrix_acc_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_ISR, Mask);
}

u32 XKrnl_sparse_matrix_acc_InterruptGetEnabled(XKrnl_sparse_matrix_acc *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_IER);
}

u32 XKrnl_sparse_matrix_acc_InterruptGetStatus(XKrnl_sparse_matrix_acc *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKrnl_sparse_matrix_acc_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_SPARSE_MATRIX_ACC_CONTROL_ADDR_ISR);
}

