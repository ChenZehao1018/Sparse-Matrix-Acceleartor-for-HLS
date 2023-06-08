set moduleName sort_C_Pipeline_loop_diff_window_loop_diff_pe
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {sort_C_Pipeline_loop_diff_window_loop_diff_pe}
set C_modelType { void 0 }
set C_modelArgList {
	{ zext_ln143_1 int 34 regular  }
	{ fifoMatrixCIdx_i_7_V int 16 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_7_V int 32 regular {fifo 0 volatile }  }
	{ fifoMatrixCIdx_i_6_V int 16 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_6_V int 32 regular {fifo 0 volatile }  }
	{ fifoMatrixCIdx_i_5_V int 16 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_5_V int 32 regular {fifo 0 volatile }  }
	{ fifoMatrixCIdx_i_4_V int 16 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_4_V int 32 regular {fifo 0 volatile }  }
	{ fifoMatrixCIdx_i_3_V int 16 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_3_V int 32 regular {fifo 0 volatile }  }
	{ fifoMatrixCIdx_i_2_V int 16 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_2_V int 32 regular {fifo 0 volatile }  }
	{ fifoMatrixCIdx_i_1_V int 16 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_1_V int 32 regular {fifo 0 volatile }  }
	{ fifoMatrixCIdx_i_0_V int 16 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_0_V int 32 regular {fifo 0 volatile }  }
	{ matrixC_buffer_V_0 int 32 regular {array 8 { 2 3 } 1 1 }  }
	{ matrixC_buffer_V_1 int 32 regular {array 8 { 2 3 } 1 1 }  }
	{ matrixC_buffer_V_2 int 32 regular {array 8 { 2 3 } 1 1 }  }
	{ matrixC_buffer_V_3 int 32 regular {array 8 { 2 3 } 1 1 }  }
	{ matrixC_buffer_V_4 int 32 regular {array 8 { 2 3 } 1 1 }  }
	{ matrixC_buffer_V_5 int 32 regular {array 8 { 2 3 } 1 1 }  }
	{ matrixC_buffer_V_6 int 32 regular {array 8 { 2 3 } 1 1 }  }
	{ matrixC_buffer_V_7 int 32 regular {array 8 { 2 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln143_1", "interface" : "wire", "bitwidth" : 34, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_7_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_7_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_6_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_6_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_5_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_5_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_4_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_4_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_3_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_3_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_2_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_2_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_1_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_1_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_0_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_0_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "matrixC_buffer_V_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "matrixC_buffer_V_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "matrixC_buffer_V_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "matrixC_buffer_V_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "matrixC_buffer_V_4", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "matrixC_buffer_V_5", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "matrixC_buffer_V_6", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "matrixC_buffer_V_7", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 95
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ fifoMatrixCIdx_i_4_V_dout sc_in sc_lv 16 signal 7 } 
	{ fifoMatrixCIdx_i_4_V_empty_n sc_in sc_logic 1 signal 7 } 
	{ fifoMatrixCIdx_i_4_V_read sc_out sc_logic 1 signal 7 } 
	{ fifoCalcMatrixC_i_4_V_dout sc_in sc_lv 32 signal 8 } 
	{ fifoCalcMatrixC_i_4_V_empty_n sc_in sc_logic 1 signal 8 } 
	{ fifoCalcMatrixC_i_4_V_read sc_out sc_logic 1 signal 8 } 
	{ fifoMatrixCIdx_i_5_V_dout sc_in sc_lv 16 signal 5 } 
	{ fifoMatrixCIdx_i_5_V_empty_n sc_in sc_logic 1 signal 5 } 
	{ fifoMatrixCIdx_i_5_V_read sc_out sc_logic 1 signal 5 } 
	{ fifoCalcMatrixC_i_5_V_dout sc_in sc_lv 32 signal 6 } 
	{ fifoCalcMatrixC_i_5_V_empty_n sc_in sc_logic 1 signal 6 } 
	{ fifoCalcMatrixC_i_5_V_read sc_out sc_logic 1 signal 6 } 
	{ fifoMatrixCIdx_i_6_V_dout sc_in sc_lv 16 signal 3 } 
	{ fifoMatrixCIdx_i_6_V_empty_n sc_in sc_logic 1 signal 3 } 
	{ fifoMatrixCIdx_i_6_V_read sc_out sc_logic 1 signal 3 } 
	{ fifoCalcMatrixC_i_6_V_dout sc_in sc_lv 32 signal 4 } 
	{ fifoCalcMatrixC_i_6_V_empty_n sc_in sc_logic 1 signal 4 } 
	{ fifoCalcMatrixC_i_6_V_read sc_out sc_logic 1 signal 4 } 
	{ fifoMatrixCIdx_i_7_V_dout sc_in sc_lv 16 signal 1 } 
	{ fifoMatrixCIdx_i_7_V_empty_n sc_in sc_logic 1 signal 1 } 
	{ fifoMatrixCIdx_i_7_V_read sc_out sc_logic 1 signal 1 } 
	{ fifoCalcMatrixC_i_7_V_dout sc_in sc_lv 32 signal 2 } 
	{ fifoCalcMatrixC_i_7_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ fifoCalcMatrixC_i_7_V_read sc_out sc_logic 1 signal 2 } 
	{ zext_ln143_1 sc_in sc_lv 34 signal 0 } 
	{ fifoMatrixCIdx_i_3_V_dout sc_in sc_lv 16 signal 9 } 
	{ fifoMatrixCIdx_i_3_V_empty_n sc_in sc_logic 1 signal 9 } 
	{ fifoMatrixCIdx_i_3_V_read sc_out sc_logic 1 signal 9 } 
	{ fifoCalcMatrixC_i_3_V_dout sc_in sc_lv 32 signal 10 } 
	{ fifoCalcMatrixC_i_3_V_empty_n sc_in sc_logic 1 signal 10 } 
	{ fifoCalcMatrixC_i_3_V_read sc_out sc_logic 1 signal 10 } 
	{ fifoMatrixCIdx_i_2_V_dout sc_in sc_lv 16 signal 11 } 
	{ fifoMatrixCIdx_i_2_V_empty_n sc_in sc_logic 1 signal 11 } 
	{ fifoMatrixCIdx_i_2_V_read sc_out sc_logic 1 signal 11 } 
	{ fifoCalcMatrixC_i_2_V_dout sc_in sc_lv 32 signal 12 } 
	{ fifoCalcMatrixC_i_2_V_empty_n sc_in sc_logic 1 signal 12 } 
	{ fifoCalcMatrixC_i_2_V_read sc_out sc_logic 1 signal 12 } 
	{ fifoMatrixCIdx_i_1_V_dout sc_in sc_lv 16 signal 13 } 
	{ fifoMatrixCIdx_i_1_V_empty_n sc_in sc_logic 1 signal 13 } 
	{ fifoMatrixCIdx_i_1_V_read sc_out sc_logic 1 signal 13 } 
	{ fifoCalcMatrixC_i_1_V_dout sc_in sc_lv 32 signal 14 } 
	{ fifoCalcMatrixC_i_1_V_empty_n sc_in sc_logic 1 signal 14 } 
	{ fifoCalcMatrixC_i_1_V_read sc_out sc_logic 1 signal 14 } 
	{ fifoMatrixCIdx_i_0_V_dout sc_in sc_lv 16 signal 15 } 
	{ fifoMatrixCIdx_i_0_V_empty_n sc_in sc_logic 1 signal 15 } 
	{ fifoMatrixCIdx_i_0_V_read sc_out sc_logic 1 signal 15 } 
	{ fifoCalcMatrixC_i_0_V_dout sc_in sc_lv 32 signal 16 } 
	{ fifoCalcMatrixC_i_0_V_empty_n sc_in sc_logic 1 signal 16 } 
	{ fifoCalcMatrixC_i_0_V_read sc_out sc_logic 1 signal 16 } 
	{ matrixC_buffer_V_0_address0 sc_out sc_lv 3 signal 17 } 
	{ matrixC_buffer_V_0_ce0 sc_out sc_logic 1 signal 17 } 
	{ matrixC_buffer_V_0_we0 sc_out sc_logic 1 signal 17 } 
	{ matrixC_buffer_V_0_d0 sc_out sc_lv 32 signal 17 } 
	{ matrixC_buffer_V_0_q0 sc_in sc_lv 32 signal 17 } 
	{ matrixC_buffer_V_1_address0 sc_out sc_lv 3 signal 18 } 
	{ matrixC_buffer_V_1_ce0 sc_out sc_logic 1 signal 18 } 
	{ matrixC_buffer_V_1_we0 sc_out sc_logic 1 signal 18 } 
	{ matrixC_buffer_V_1_d0 sc_out sc_lv 32 signal 18 } 
	{ matrixC_buffer_V_1_q0 sc_in sc_lv 32 signal 18 } 
	{ matrixC_buffer_V_2_address0 sc_out sc_lv 3 signal 19 } 
	{ matrixC_buffer_V_2_ce0 sc_out sc_logic 1 signal 19 } 
	{ matrixC_buffer_V_2_we0 sc_out sc_logic 1 signal 19 } 
	{ matrixC_buffer_V_2_d0 sc_out sc_lv 32 signal 19 } 
	{ matrixC_buffer_V_2_q0 sc_in sc_lv 32 signal 19 } 
	{ matrixC_buffer_V_3_address0 sc_out sc_lv 3 signal 20 } 
	{ matrixC_buffer_V_3_ce0 sc_out sc_logic 1 signal 20 } 
	{ matrixC_buffer_V_3_we0 sc_out sc_logic 1 signal 20 } 
	{ matrixC_buffer_V_3_d0 sc_out sc_lv 32 signal 20 } 
	{ matrixC_buffer_V_3_q0 sc_in sc_lv 32 signal 20 } 
	{ matrixC_buffer_V_4_address0 sc_out sc_lv 3 signal 21 } 
	{ matrixC_buffer_V_4_ce0 sc_out sc_logic 1 signal 21 } 
	{ matrixC_buffer_V_4_we0 sc_out sc_logic 1 signal 21 } 
	{ matrixC_buffer_V_4_d0 sc_out sc_lv 32 signal 21 } 
	{ matrixC_buffer_V_4_q0 sc_in sc_lv 32 signal 21 } 
	{ matrixC_buffer_V_5_address0 sc_out sc_lv 3 signal 22 } 
	{ matrixC_buffer_V_5_ce0 sc_out sc_logic 1 signal 22 } 
	{ matrixC_buffer_V_5_we0 sc_out sc_logic 1 signal 22 } 
	{ matrixC_buffer_V_5_d0 sc_out sc_lv 32 signal 22 } 
	{ matrixC_buffer_V_5_q0 sc_in sc_lv 32 signal 22 } 
	{ matrixC_buffer_V_6_address0 sc_out sc_lv 3 signal 23 } 
	{ matrixC_buffer_V_6_ce0 sc_out sc_logic 1 signal 23 } 
	{ matrixC_buffer_V_6_we0 sc_out sc_logic 1 signal 23 } 
	{ matrixC_buffer_V_6_d0 sc_out sc_lv 32 signal 23 } 
	{ matrixC_buffer_V_6_q0 sc_in sc_lv 32 signal 23 } 
	{ matrixC_buffer_V_7_address0 sc_out sc_lv 3 signal 24 } 
	{ matrixC_buffer_V_7_ce0 sc_out sc_logic 1 signal 24 } 
	{ matrixC_buffer_V_7_we0 sc_out sc_logic 1 signal 24 } 
	{ matrixC_buffer_V_7_d0 sc_out sc_lv 32 signal 24 } 
	{ matrixC_buffer_V_7_q0 sc_in sc_lv 32 signal 24 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "fifoMatrixCIdx_i_4_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_4_V", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_4_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_4_V", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_4_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_4_V", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_4_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_4_V", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_4_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_4_V", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_4_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_4_V", "role": "read" }} , 
 	{ "name": "fifoMatrixCIdx_i_5_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_5_V", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_5_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_5_V", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_5_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_5_V", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_5_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_5_V", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_5_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_5_V", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_5_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_5_V", "role": "read" }} , 
 	{ "name": "fifoMatrixCIdx_i_6_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_6_V", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_6_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_6_V", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_6_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_6_V", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_6_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_6_V", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_6_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_6_V", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_6_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_6_V", "role": "read" }} , 
 	{ "name": "fifoMatrixCIdx_i_7_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_7_V", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_7_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_7_V", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_7_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_7_V", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_7_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_7_V", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_7_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_7_V", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_7_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_7_V", "role": "read" }} , 
 	{ "name": "zext_ln143_1", "direction": "in", "datatype": "sc_lv", "bitwidth":34, "type": "signal", "bundle":{"name": "zext_ln143_1", "role": "default" }} , 
 	{ "name": "fifoMatrixCIdx_i_3_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_3_V", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_3_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_3_V", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_3_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_3_V", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_3_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_3_V", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_3_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_3_V", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_3_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_3_V", "role": "read" }} , 
 	{ "name": "fifoMatrixCIdx_i_2_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_2_V", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_2_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_2_V", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_2_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_2_V", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_2_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_2_V", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_2_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_2_V", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_2_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_2_V", "role": "read" }} , 
 	{ "name": "fifoMatrixCIdx_i_1_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_1_V", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_1_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_1_V", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_1_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_1_V", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_1_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_1_V", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_1_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_1_V", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_1_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_1_V", "role": "read" }} , 
 	{ "name": "fifoMatrixCIdx_i_0_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_0_V", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_0_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_0_V", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_0_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_0_V", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_0_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_0_V", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_0_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_0_V", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_0_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_0_V", "role": "read" }} , 
 	{ "name": "matrixC_buffer_V_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "matrixC_buffer_V_0", "role": "address0" }} , 
 	{ "name": "matrixC_buffer_V_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matrixC_buffer_V_0", "role": "ce0" }} , 
 	{ "name": "matrixC_buffer_V_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matrixC_buffer_V_0", "role": "we0" }} , 
 	{ "name": "matrixC_buffer_V_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matrixC_buffer_V_0", "role": "d0" }} , 
 	{ "name": "matrixC_buffer_V_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matrixC_buffer_V_0", "role": "q0" }} , 
 	{ "name": "matrixC_buffer_V_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "matrixC_buffer_V_1", "role": "address0" }} , 
 	{ "name": "matrixC_buffer_V_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matrixC_buffer_V_1", "role": "ce0" }} , 
 	{ "name": "matrixC_buffer_V_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matrixC_buffer_V_1", "role": "we0" }} , 
 	{ "name": "matrixC_buffer_V_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matrixC_buffer_V_1", "role": "d0" }} , 
 	{ "name": "matrixC_buffer_V_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matrixC_buffer_V_1", "role": "q0" }} , 
 	{ "name": "matrixC_buffer_V_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "matrixC_buffer_V_2", "role": "address0" }} , 
 	{ "name": "matrixC_buffer_V_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matrixC_buffer_V_2", "role": "ce0" }} , 
 	{ "name": "matrixC_buffer_V_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matrixC_buffer_V_2", "role": "we0" }} , 
 	{ "name": "matrixC_buffer_V_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matrixC_buffer_V_2", "role": "d0" }} , 
 	{ "name": "matrixC_buffer_V_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matrixC_buffer_V_2", "role": "q0" }} , 
 	{ "name": "matrixC_buffer_V_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "matrixC_buffer_V_3", "role": "address0" }} , 
 	{ "name": "matrixC_buffer_V_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matrixC_buffer_V_3", "role": "ce0" }} , 
 	{ "name": "matrixC_buffer_V_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matrixC_buffer_V_3", "role": "we0" }} , 
 	{ "name": "matrixC_buffer_V_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matrixC_buffer_V_3", "role": "d0" }} , 
 	{ "name": "matrixC_buffer_V_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matrixC_buffer_V_3", "role": "q0" }} , 
 	{ "name": "matrixC_buffer_V_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "matrixC_buffer_V_4", "role": "address0" }} , 
 	{ "name": "matrixC_buffer_V_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matrixC_buffer_V_4", "role": "ce0" }} , 
 	{ "name": "matrixC_buffer_V_4_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matrixC_buffer_V_4", "role": "we0" }} , 
 	{ "name": "matrixC_buffer_V_4_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matrixC_buffer_V_4", "role": "d0" }} , 
 	{ "name": "matrixC_buffer_V_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matrixC_buffer_V_4", "role": "q0" }} , 
 	{ "name": "matrixC_buffer_V_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "matrixC_buffer_V_5", "role": "address0" }} , 
 	{ "name": "matrixC_buffer_V_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matrixC_buffer_V_5", "role": "ce0" }} , 
 	{ "name": "matrixC_buffer_V_5_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matrixC_buffer_V_5", "role": "we0" }} , 
 	{ "name": "matrixC_buffer_V_5_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matrixC_buffer_V_5", "role": "d0" }} , 
 	{ "name": "matrixC_buffer_V_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matrixC_buffer_V_5", "role": "q0" }} , 
 	{ "name": "matrixC_buffer_V_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "matrixC_buffer_V_6", "role": "address0" }} , 
 	{ "name": "matrixC_buffer_V_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matrixC_buffer_V_6", "role": "ce0" }} , 
 	{ "name": "matrixC_buffer_V_6_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matrixC_buffer_V_6", "role": "we0" }} , 
 	{ "name": "matrixC_buffer_V_6_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matrixC_buffer_V_6", "role": "d0" }} , 
 	{ "name": "matrixC_buffer_V_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matrixC_buffer_V_6", "role": "q0" }} , 
 	{ "name": "matrixC_buffer_V_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "matrixC_buffer_V_7", "role": "address0" }} , 
 	{ "name": "matrixC_buffer_V_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matrixC_buffer_V_7", "role": "ce0" }} , 
 	{ "name": "matrixC_buffer_V_7_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "matrixC_buffer_V_7", "role": "we0" }} , 
 	{ "name": "matrixC_buffer_V_7_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matrixC_buffer_V_7", "role": "d0" }} , 
 	{ "name": "matrixC_buffer_V_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "matrixC_buffer_V_7", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5"],
		"CDFG" : "sort_C_Pipeline_loop_diff_window_loop_diff_pe",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "zext_ln143_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "fifoMatrixCIdx_i_7_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fifoMatrixCIdx_i_7_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoCalcMatrixC_i_7_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fifoCalcMatrixC_i_7_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoMatrixCIdx_i_6_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fifoMatrixCIdx_i_6_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoCalcMatrixC_i_6_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fifoCalcMatrixC_i_6_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoMatrixCIdx_i_5_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fifoMatrixCIdx_i_5_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoCalcMatrixC_i_5_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fifoCalcMatrixC_i_5_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoMatrixCIdx_i_4_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fifoMatrixCIdx_i_4_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoCalcMatrixC_i_4_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fifoCalcMatrixC_i_4_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoMatrixCIdx_i_3_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fifoMatrixCIdx_i_3_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoCalcMatrixC_i_3_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fifoCalcMatrixC_i_3_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoMatrixCIdx_i_2_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fifoMatrixCIdx_i_2_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoCalcMatrixC_i_2_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fifoCalcMatrixC_i_2_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoMatrixCIdx_i_1_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fifoMatrixCIdx_i_1_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoCalcMatrixC_i_1_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fifoCalcMatrixC_i_1_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoMatrixCIdx_i_0_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fifoMatrixCIdx_i_0_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoCalcMatrixC_i_0_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fifoCalcMatrixC_i_0_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "matrixC_buffer_V_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "matrixC_buffer_V_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "matrixC_buffer_V_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "matrixC_buffer_V_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "matrixC_buffer_V_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "matrixC_buffer_V_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "matrixC_buffer_V_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "matrixC_buffer_V_7", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "loop_diff_window_loop_diff_pe", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U3", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U4", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	sort_C_Pipeline_loop_diff_window_loop_diff_pe {
		zext_ln143_1 {Type I LastRead 0 FirstWrite -1}
		fifoMatrixCIdx_i_7_V {Type I LastRead 3 FirstWrite -1}
		fifoCalcMatrixC_i_7_V {Type I LastRead 3 FirstWrite -1}
		fifoMatrixCIdx_i_6_V {Type I LastRead 3 FirstWrite -1}
		fifoCalcMatrixC_i_6_V {Type I LastRead 3 FirstWrite -1}
		fifoMatrixCIdx_i_5_V {Type I LastRead 3 FirstWrite -1}
		fifoCalcMatrixC_i_5_V {Type I LastRead 3 FirstWrite -1}
		fifoMatrixCIdx_i_4_V {Type I LastRead 3 FirstWrite -1}
		fifoCalcMatrixC_i_4_V {Type I LastRead 3 FirstWrite -1}
		fifoMatrixCIdx_i_3_V {Type I LastRead 2 FirstWrite -1}
		fifoCalcMatrixC_i_3_V {Type I LastRead 2 FirstWrite -1}
		fifoMatrixCIdx_i_2_V {Type I LastRead 2 FirstWrite -1}
		fifoCalcMatrixC_i_2_V {Type I LastRead 2 FirstWrite -1}
		fifoMatrixCIdx_i_1_V {Type I LastRead 2 FirstWrite -1}
		fifoCalcMatrixC_i_1_V {Type I LastRead 2 FirstWrite -1}
		fifoMatrixCIdx_i_0_V {Type I LastRead 2 FirstWrite -1}
		fifoCalcMatrixC_i_0_V {Type I LastRead 2 FirstWrite -1}
		matrixC_buffer_V_0 {Type IO LastRead 3 FirstWrite 4}
		matrixC_buffer_V_1 {Type IO LastRead 3 FirstWrite 4}
		matrixC_buffer_V_2 {Type IO LastRead 3 FirstWrite 4}
		matrixC_buffer_V_3 {Type IO LastRead 3 FirstWrite 4}
		matrixC_buffer_V_4 {Type IO LastRead 4 FirstWrite 5}
		matrixC_buffer_V_5 {Type IO LastRead 4 FirstWrite 5}
		matrixC_buffer_V_6 {Type IO LastRead 4 FirstWrite 5}
		matrixC_buffer_V_7 {Type IO LastRead 4 FirstWrite 5}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	zext_ln143_1 { ap_none {  { zext_ln143_1 in_data 0 34 } } }
	fifoMatrixCIdx_i_7_V { ap_fifo {  { fifoMatrixCIdx_i_7_V_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_7_V_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_7_V_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_7_V { ap_fifo {  { fifoCalcMatrixC_i_7_V_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_7_V_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_7_V_read fifo_update 1 1 } } }
	fifoMatrixCIdx_i_6_V { ap_fifo {  { fifoMatrixCIdx_i_6_V_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_6_V_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_6_V_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_6_V { ap_fifo {  { fifoCalcMatrixC_i_6_V_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_6_V_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_6_V_read fifo_update 1 1 } } }
	fifoMatrixCIdx_i_5_V { ap_fifo {  { fifoMatrixCIdx_i_5_V_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_5_V_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_5_V_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_5_V { ap_fifo {  { fifoCalcMatrixC_i_5_V_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_5_V_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_5_V_read fifo_update 1 1 } } }
	fifoMatrixCIdx_i_4_V { ap_fifo {  { fifoMatrixCIdx_i_4_V_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_4_V_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_4_V_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_4_V { ap_fifo {  { fifoCalcMatrixC_i_4_V_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_4_V_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_4_V_read fifo_update 1 1 } } }
	fifoMatrixCIdx_i_3_V { ap_fifo {  { fifoMatrixCIdx_i_3_V_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_3_V_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_3_V_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_3_V { ap_fifo {  { fifoCalcMatrixC_i_3_V_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_3_V_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_3_V_read fifo_update 1 1 } } }
	fifoMatrixCIdx_i_2_V { ap_fifo {  { fifoMatrixCIdx_i_2_V_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_2_V_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_2_V_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_2_V { ap_fifo {  { fifoCalcMatrixC_i_2_V_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_2_V_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_2_V_read fifo_update 1 1 } } }
	fifoMatrixCIdx_i_1_V { ap_fifo {  { fifoMatrixCIdx_i_1_V_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_1_V_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_1_V_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_1_V { ap_fifo {  { fifoCalcMatrixC_i_1_V_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_1_V_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_1_V_read fifo_update 1 1 } } }
	fifoMatrixCIdx_i_0_V { ap_fifo {  { fifoMatrixCIdx_i_0_V_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_0_V_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_0_V_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_0_V { ap_fifo {  { fifoCalcMatrixC_i_0_V_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_0_V_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_0_V_read fifo_update 1 1 } } }
	matrixC_buffer_V_0 { ap_memory {  { matrixC_buffer_V_0_address0 mem_address 1 3 }  { matrixC_buffer_V_0_ce0 mem_ce 1 1 }  { matrixC_buffer_V_0_we0 mem_we 1 1 }  { matrixC_buffer_V_0_d0 mem_din 1 32 }  { matrixC_buffer_V_0_q0 mem_dout 0 32 } } }
	matrixC_buffer_V_1 { ap_memory {  { matrixC_buffer_V_1_address0 mem_address 1 3 }  { matrixC_buffer_V_1_ce0 mem_ce 1 1 }  { matrixC_buffer_V_1_we0 mem_we 1 1 }  { matrixC_buffer_V_1_d0 mem_din 1 32 }  { matrixC_buffer_V_1_q0 mem_dout 0 32 } } }
	matrixC_buffer_V_2 { ap_memory {  { matrixC_buffer_V_2_address0 mem_address 1 3 }  { matrixC_buffer_V_2_ce0 mem_ce 1 1 }  { matrixC_buffer_V_2_we0 mem_we 1 1 }  { matrixC_buffer_V_2_d0 mem_din 1 32 }  { matrixC_buffer_V_2_q0 mem_dout 0 32 } } }
	matrixC_buffer_V_3 { ap_memory {  { matrixC_buffer_V_3_address0 mem_address 1 3 }  { matrixC_buffer_V_3_ce0 mem_ce 1 1 }  { matrixC_buffer_V_3_we0 mem_we 1 1 }  { matrixC_buffer_V_3_d0 mem_din 1 32 }  { matrixC_buffer_V_3_q0 mem_dout 0 32 } } }
	matrixC_buffer_V_4 { ap_memory {  { matrixC_buffer_V_4_address0 mem_address 1 3 }  { matrixC_buffer_V_4_ce0 mem_ce 1 1 }  { matrixC_buffer_V_4_we0 mem_we 1 1 }  { matrixC_buffer_V_4_d0 mem_din 1 32 }  { matrixC_buffer_V_4_q0 mem_dout 0 32 } } }
	matrixC_buffer_V_5 { ap_memory {  { matrixC_buffer_V_5_address0 mem_address 1 3 }  { matrixC_buffer_V_5_ce0 mem_ce 1 1 }  { matrixC_buffer_V_5_we0 mem_we 1 1 }  { matrixC_buffer_V_5_d0 mem_din 1 32 }  { matrixC_buffer_V_5_q0 mem_dout 0 32 } } }
	matrixC_buffer_V_6 { ap_memory {  { matrixC_buffer_V_6_address0 mem_address 1 3 }  { matrixC_buffer_V_6_ce0 mem_ce 1 1 }  { matrixC_buffer_V_6_we0 mem_we 1 1 }  { matrixC_buffer_V_6_d0 mem_din 1 32 }  { matrixC_buffer_V_6_q0 mem_dout 0 32 } } }
	matrixC_buffer_V_7 { ap_memory {  { matrixC_buffer_V_7_address0 mem_address 1 3 }  { matrixC_buffer_V_7_ce0 mem_ce 1 1 }  { matrixC_buffer_V_7_we0 mem_we 1 1 }  { matrixC_buffer_V_7_d0 mem_din 1 32 }  { matrixC_buffer_V_7_q0 mem_dout 0 32 } } }
}
