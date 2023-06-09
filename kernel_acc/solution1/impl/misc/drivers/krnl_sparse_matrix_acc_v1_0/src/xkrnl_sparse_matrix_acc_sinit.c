// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xkrnl_sparse_matrix_acc.h"

extern XKrnl_sparse_matrix_acc_Config XKrnl_sparse_matrix_acc_ConfigTable[];

XKrnl_sparse_matrix_acc_Config *XKrnl_sparse_matrix_acc_LookupConfig(u16 DeviceId) {
	XKrnl_sparse_matrix_acc_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XKRNL_SPARSE_MATRIX_ACC_NUM_INSTANCES; Index++) {
		if (XKrnl_sparse_matrix_acc_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XKrnl_sparse_matrix_acc_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XKrnl_sparse_matrix_acc_Initialize(XKrnl_sparse_matrix_acc *InstancePtr, u16 DeviceId) {
	XKrnl_sparse_matrix_acc_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XKrnl_sparse_matrix_acc_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XKrnl_sparse_matrix_acc_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

