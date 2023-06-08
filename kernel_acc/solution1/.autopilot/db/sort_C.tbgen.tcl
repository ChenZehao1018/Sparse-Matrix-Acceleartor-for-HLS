set moduleName sort_C
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {sort_C}
set C_modelType { void 0 }
set C_modelArgList {
	{ lenEdgeListPtr int 32 regular  }
	{ fifoEdgeListPtr_i_V int 32 regular {fifo 0 volatile }  }
	{ fifoMatrixCIdx_i_0_V int 16 regular {fifo 0 volatile }  }
	{ fifoMatrixCIdx_i_1_V int 16 regular {fifo 0 volatile }  }
	{ fifoMatrixCIdx_i_2_V int 16 regular {fifo 0 volatile }  }
	{ fifoMatrixCIdx_i_3_V int 16 regular {fifo 0 volatile }  }
	{ fifoMatrixCIdx_i_4_V int 16 regular {fifo 0 volatile }  }
	{ fifoMatrixCIdx_i_5_V int 16 regular {fifo 0 volatile }  }
	{ fifoMatrixCIdx_i_6_V int 16 regular {fifo 0 volatile }  }
	{ fifoMatrixCIdx_i_7_V int 16 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_0_V int 32 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_1_V int 32 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_2_V int 32 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_3_V int 32 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_4_V int 32 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_5_V int 32 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_6_V int 32 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_7_V int 32 regular {fifo 0 volatile }  }
	{ fifoSortMatrixC_o_0_V int 32 regular {fifo 1 volatile }  }
	{ fifoSortMatrixC_o_1_V int 32 regular {fifo 1 volatile }  }
	{ fifoSortMatrixC_o_2_V int 32 regular {fifo 1 volatile }  }
	{ fifoSortMatrixC_o_3_V int 32 regular {fifo 1 volatile }  }
	{ fifoSortMatrixC_o_4_V int 32 regular {fifo 1 volatile }  }
	{ fifoSortMatrixC_o_5_V int 32 regular {fifo 1 volatile }  }
	{ fifoSortMatrixC_o_6_V int 32 regular {fifo 1 volatile }  }
	{ fifoSortMatrixC_o_7_V int 32 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "lenEdgeListPtr", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoEdgeListPtr_i_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_0_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_1_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_2_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_3_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_4_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_5_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_6_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_7_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_0_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_1_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_2_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_3_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_4_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_5_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_6_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_7_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoSortMatrixC_o_0_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fifoSortMatrixC_o_1_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fifoSortMatrixC_o_2_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fifoSortMatrixC_o_3_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fifoSortMatrixC_o_4_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fifoSortMatrixC_o_5_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fifoSortMatrixC_o_6_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fifoSortMatrixC_o_7_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 82
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ lenEdgeListPtr sc_in sc_lv 32 signal 0 } 
	{ fifoEdgeListPtr_i_V_dout sc_in sc_lv 32 signal 1 } 
	{ fifoEdgeListPtr_i_V_empty_n sc_in sc_logic 1 signal 1 } 
	{ fifoEdgeListPtr_i_V_read sc_out sc_logic 1 signal 1 } 
	{ fifoMatrixCIdx_i_0_V_dout sc_in sc_lv 16 signal 2 } 
	{ fifoMatrixCIdx_i_0_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ fifoMatrixCIdx_i_0_V_read sc_out sc_logic 1 signal 2 } 
	{ fifoMatrixCIdx_i_1_V_dout sc_in sc_lv 16 signal 3 } 
	{ fifoMatrixCIdx_i_1_V_empty_n sc_in sc_logic 1 signal 3 } 
	{ fifoMatrixCIdx_i_1_V_read sc_out sc_logic 1 signal 3 } 
	{ fifoMatrixCIdx_i_2_V_dout sc_in sc_lv 16 signal 4 } 
	{ fifoMatrixCIdx_i_2_V_empty_n sc_in sc_logic 1 signal 4 } 
	{ fifoMatrixCIdx_i_2_V_read sc_out sc_logic 1 signal 4 } 
	{ fifoMatrixCIdx_i_3_V_dout sc_in sc_lv 16 signal 5 } 
	{ fifoMatrixCIdx_i_3_V_empty_n sc_in sc_logic 1 signal 5 } 
	{ fifoMatrixCIdx_i_3_V_read sc_out sc_logic 1 signal 5 } 
	{ fifoMatrixCIdx_i_4_V_dout sc_in sc_lv 16 signal 6 } 
	{ fifoMatrixCIdx_i_4_V_empty_n sc_in sc_logic 1 signal 6 } 
	{ fifoMatrixCIdx_i_4_V_read sc_out sc_logic 1 signal 6 } 
	{ fifoMatrixCIdx_i_5_V_dout sc_in sc_lv 16 signal 7 } 
	{ fifoMatrixCIdx_i_5_V_empty_n sc_in sc_logic 1 signal 7 } 
	{ fifoMatrixCIdx_i_5_V_read sc_out sc_logic 1 signal 7 } 
	{ fifoMatrixCIdx_i_6_V_dout sc_in sc_lv 16 signal 8 } 
	{ fifoMatrixCIdx_i_6_V_empty_n sc_in sc_logic 1 signal 8 } 
	{ fifoMatrixCIdx_i_6_V_read sc_out sc_logic 1 signal 8 } 
	{ fifoMatrixCIdx_i_7_V_dout sc_in sc_lv 16 signal 9 } 
	{ fifoMatrixCIdx_i_7_V_empty_n sc_in sc_logic 1 signal 9 } 
	{ fifoMatrixCIdx_i_7_V_read sc_out sc_logic 1 signal 9 } 
	{ fifoCalcMatrixC_i_0_V_dout sc_in sc_lv 32 signal 10 } 
	{ fifoCalcMatrixC_i_0_V_empty_n sc_in sc_logic 1 signal 10 } 
	{ fifoCalcMatrixC_i_0_V_read sc_out sc_logic 1 signal 10 } 
	{ fifoCalcMatrixC_i_1_V_dout sc_in sc_lv 32 signal 11 } 
	{ fifoCalcMatrixC_i_1_V_empty_n sc_in sc_logic 1 signal 11 } 
	{ fifoCalcMatrixC_i_1_V_read sc_out sc_logic 1 signal 11 } 
	{ fifoCalcMatrixC_i_2_V_dout sc_in sc_lv 32 signal 12 } 
	{ fifoCalcMatrixC_i_2_V_empty_n sc_in sc_logic 1 signal 12 } 
	{ fifoCalcMatrixC_i_2_V_read sc_out sc_logic 1 signal 12 } 
	{ fifoCalcMatrixC_i_3_V_dout sc_in sc_lv 32 signal 13 } 
	{ fifoCalcMatrixC_i_3_V_empty_n sc_in sc_logic 1 signal 13 } 
	{ fifoCalcMatrixC_i_3_V_read sc_out sc_logic 1 signal 13 } 
	{ fifoCalcMatrixC_i_4_V_dout sc_in sc_lv 32 signal 14 } 
	{ fifoCalcMatrixC_i_4_V_empty_n sc_in sc_logic 1 signal 14 } 
	{ fifoCalcMatrixC_i_4_V_read sc_out sc_logic 1 signal 14 } 
	{ fifoCalcMatrixC_i_5_V_dout sc_in sc_lv 32 signal 15 } 
	{ fifoCalcMatrixC_i_5_V_empty_n sc_in sc_logic 1 signal 15 } 
	{ fifoCalcMatrixC_i_5_V_read sc_out sc_logic 1 signal 15 } 
	{ fifoCalcMatrixC_i_6_V_dout sc_in sc_lv 32 signal 16 } 
	{ fifoCalcMatrixC_i_6_V_empty_n sc_in sc_logic 1 signal 16 } 
	{ fifoCalcMatrixC_i_6_V_read sc_out sc_logic 1 signal 16 } 
	{ fifoCalcMatrixC_i_7_V_dout sc_in sc_lv 32 signal 17 } 
	{ fifoCalcMatrixC_i_7_V_empty_n sc_in sc_logic 1 signal 17 } 
	{ fifoCalcMatrixC_i_7_V_read sc_out sc_logic 1 signal 17 } 
	{ fifoSortMatrixC_o_0_V_din sc_out sc_lv 32 signal 18 } 
	{ fifoSortMatrixC_o_0_V_full_n sc_in sc_logic 1 signal 18 } 
	{ fifoSortMatrixC_o_0_V_write sc_out sc_logic 1 signal 18 } 
	{ fifoSortMatrixC_o_1_V_din sc_out sc_lv 32 signal 19 } 
	{ fifoSortMatrixC_o_1_V_full_n sc_in sc_logic 1 signal 19 } 
	{ fifoSortMatrixC_o_1_V_write sc_out sc_logic 1 signal 19 } 
	{ fifoSortMatrixC_o_2_V_din sc_out sc_lv 32 signal 20 } 
	{ fifoSortMatrixC_o_2_V_full_n sc_in sc_logic 1 signal 20 } 
	{ fifoSortMatrixC_o_2_V_write sc_out sc_logic 1 signal 20 } 
	{ fifoSortMatrixC_o_3_V_din sc_out sc_lv 32 signal 21 } 
	{ fifoSortMatrixC_o_3_V_full_n sc_in sc_logic 1 signal 21 } 
	{ fifoSortMatrixC_o_3_V_write sc_out sc_logic 1 signal 21 } 
	{ fifoSortMatrixC_o_4_V_din sc_out sc_lv 32 signal 22 } 
	{ fifoSortMatrixC_o_4_V_full_n sc_in sc_logic 1 signal 22 } 
	{ fifoSortMatrixC_o_4_V_write sc_out sc_logic 1 signal 22 } 
	{ fifoSortMatrixC_o_5_V_din sc_out sc_lv 32 signal 23 } 
	{ fifoSortMatrixC_o_5_V_full_n sc_in sc_logic 1 signal 23 } 
	{ fifoSortMatrixC_o_5_V_write sc_out sc_logic 1 signal 23 } 
	{ fifoSortMatrixC_o_6_V_din sc_out sc_lv 32 signal 24 } 
	{ fifoSortMatrixC_o_6_V_full_n sc_in sc_logic 1 signal 24 } 
	{ fifoSortMatrixC_o_6_V_write sc_out sc_logic 1 signal 24 } 
	{ fifoSortMatrixC_o_7_V_din sc_out sc_lv 32 signal 25 } 
	{ fifoSortMatrixC_o_7_V_full_n sc_in sc_logic 1 signal 25 } 
	{ fifoSortMatrixC_o_7_V_write sc_out sc_logic 1 signal 25 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "lenEdgeListPtr", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "lenEdgeListPtr", "role": "default" }} , 
 	{ "name": "fifoEdgeListPtr_i_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoEdgeListPtr_i_V", "role": "dout" }} , 
 	{ "name": "fifoEdgeListPtr_i_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoEdgeListPtr_i_V", "role": "empty_n" }} , 
 	{ "name": "fifoEdgeListPtr_i_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoEdgeListPtr_i_V", "role": "read" }} , 
 	{ "name": "fifoMatrixCIdx_i_0_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_0_V", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_0_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_0_V", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_0_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_0_V", "role": "read" }} , 
 	{ "name": "fifoMatrixCIdx_i_1_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_1_V", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_1_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_1_V", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_1_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_1_V", "role": "read" }} , 
 	{ "name": "fifoMatrixCIdx_i_2_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_2_V", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_2_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_2_V", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_2_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_2_V", "role": "read" }} , 
 	{ "name": "fifoMatrixCIdx_i_3_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_3_V", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_3_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_3_V", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_3_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_3_V", "role": "read" }} , 
 	{ "name": "fifoMatrixCIdx_i_4_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_4_V", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_4_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_4_V", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_4_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_4_V", "role": "read" }} , 
 	{ "name": "fifoMatrixCIdx_i_5_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_5_V", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_5_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_5_V", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_5_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_5_V", "role": "read" }} , 
 	{ "name": "fifoMatrixCIdx_i_6_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_6_V", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_6_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_6_V", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_6_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_6_V", "role": "read" }} , 
 	{ "name": "fifoMatrixCIdx_i_7_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_7_V", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_7_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_7_V", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_7_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_7_V", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_0_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_0_V", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_0_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_0_V", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_0_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_0_V", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_1_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_1_V", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_1_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_1_V", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_1_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_1_V", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_2_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_2_V", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_2_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_2_V", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_2_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_2_V", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_3_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_3_V", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_3_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_3_V", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_3_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_3_V", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_4_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_4_V", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_4_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_4_V", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_4_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_4_V", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_5_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_5_V", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_5_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_5_V", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_5_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_5_V", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_6_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_6_V", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_6_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_6_V", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_6_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_6_V", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_7_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_7_V", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_7_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_7_V", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_7_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_7_V", "role": "read" }} , 
 	{ "name": "fifoSortMatrixC_o_0_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_0_V", "role": "din" }} , 
 	{ "name": "fifoSortMatrixC_o_0_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_0_V", "role": "full_n" }} , 
 	{ "name": "fifoSortMatrixC_o_0_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_0_V", "role": "write" }} , 
 	{ "name": "fifoSortMatrixC_o_1_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_1_V", "role": "din" }} , 
 	{ "name": "fifoSortMatrixC_o_1_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_1_V", "role": "full_n" }} , 
 	{ "name": "fifoSortMatrixC_o_1_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_1_V", "role": "write" }} , 
 	{ "name": "fifoSortMatrixC_o_2_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_2_V", "role": "din" }} , 
 	{ "name": "fifoSortMatrixC_o_2_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_2_V", "role": "full_n" }} , 
 	{ "name": "fifoSortMatrixC_o_2_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_2_V", "role": "write" }} , 
 	{ "name": "fifoSortMatrixC_o_3_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_3_V", "role": "din" }} , 
 	{ "name": "fifoSortMatrixC_o_3_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_3_V", "role": "full_n" }} , 
 	{ "name": "fifoSortMatrixC_o_3_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_3_V", "role": "write" }} , 
 	{ "name": "fifoSortMatrixC_o_4_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_4_V", "role": "din" }} , 
 	{ "name": "fifoSortMatrixC_o_4_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_4_V", "role": "full_n" }} , 
 	{ "name": "fifoSortMatrixC_o_4_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_4_V", "role": "write" }} , 
 	{ "name": "fifoSortMatrixC_o_5_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_5_V", "role": "din" }} , 
 	{ "name": "fifoSortMatrixC_o_5_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_5_V", "role": "full_n" }} , 
 	{ "name": "fifoSortMatrixC_o_5_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_5_V", "role": "write" }} , 
 	{ "name": "fifoSortMatrixC_o_6_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_6_V", "role": "din" }} , 
 	{ "name": "fifoSortMatrixC_o_6_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_6_V", "role": "full_n" }} , 
 	{ "name": "fifoSortMatrixC_o_6_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_6_V", "role": "write" }} , 
 	{ "name": "fifoSortMatrixC_o_7_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_7_V", "role": "din" }} , 
 	{ "name": "fifoSortMatrixC_o_7_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_7_V", "role": "full_n" }} , 
 	{ "name": "fifoSortMatrixC_o_7_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_7_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "15"],
		"CDFG" : "sort_C",
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
			{"Name" : "lenEdgeListPtr", "Type" : "None", "Direction" : "I"},
			{"Name" : "fifoEdgeListPtr_i_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "fifoEdgeListPtr_i_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoMatrixCIdx_i_0_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475", "Port" : "fifoMatrixCIdx_i_0_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "fifoMatrixCIdx_i_1_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475", "Port" : "fifoMatrixCIdx_i_1_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "fifoMatrixCIdx_i_2_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475", "Port" : "fifoMatrixCIdx_i_2_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "fifoMatrixCIdx_i_3_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475", "Port" : "fifoMatrixCIdx_i_3_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "fifoMatrixCIdx_i_4_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475", "Port" : "fifoMatrixCIdx_i_4_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "fifoMatrixCIdx_i_5_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475", "Port" : "fifoMatrixCIdx_i_5_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "fifoMatrixCIdx_i_6_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475", "Port" : "fifoMatrixCIdx_i_6_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "fifoMatrixCIdx_i_7_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475", "Port" : "fifoMatrixCIdx_i_7_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "fifoCalcMatrixC_i_0_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475", "Port" : "fifoCalcMatrixC_i_0_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "fifoCalcMatrixC_i_1_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475", "Port" : "fifoCalcMatrixC_i_1_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "fifoCalcMatrixC_i_2_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475", "Port" : "fifoCalcMatrixC_i_2_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "fifoCalcMatrixC_i_3_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475", "Port" : "fifoCalcMatrixC_i_3_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "fifoCalcMatrixC_i_4_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475", "Port" : "fifoCalcMatrixC_i_4_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "fifoCalcMatrixC_i_5_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475", "Port" : "fifoCalcMatrixC_i_5_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "fifoCalcMatrixC_i_6_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475", "Port" : "fifoCalcMatrixC_i_6_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "fifoCalcMatrixC_i_7_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475", "Port" : "fifoCalcMatrixC_i_7_V", "Inst_start_state" : "6", "Inst_end_state" : "7"}]},
			{"Name" : "fifoSortMatrixC_o_0_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "fifoSortMatrixC_o_0_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoSortMatrixC_o_1_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "fifoSortMatrixC_o_1_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoSortMatrixC_o_2_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "fifoSortMatrixC_o_2_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoSortMatrixC_o_3_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "fifoSortMatrixC_o_3_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoSortMatrixC_o_4_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "fifoSortMatrixC_o_4_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoSortMatrixC_o_5_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "fifoSortMatrixC_o_5_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoSortMatrixC_o_6_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "fifoSortMatrixC_o_6_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoSortMatrixC_o_7_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "fifoSortMatrixC_o_7_V_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_136_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_135_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_repeat_iter", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_state5", "LastState" : ["ap_ST_fsm_state7"], "QuitState" : ["ap_ST_fsm_state5"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state8"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_169_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_state10", "LastState" : ["ap_ST_fsm_state11"], "QuitState" : ["ap_ST_fsm_state10"], "PreState" : ["ap_ST_fsm_state9"], "PostState" : ["ap_ST_fsm_state8"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_168_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "11", "FirstState" : "ap_ST_fsm_state8", "LastState" : ["ap_ST_fsm_state10"], "QuitState" : ["ap_ST_fsm_state8"], "PreState" : ["ap_ST_fsm_state5"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.matrixC_buffer_V_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.matrixC_buffer_V_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.matrixC_buffer_V_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.matrixC_buffer_V_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.matrixC_buffer_V_4_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.matrixC_buffer_V_5_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.matrixC_buffer_V_6_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.matrixC_buffer_V_7_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475", "Parent" : "0", "Child" : ["10", "11", "12", "13", "14"],
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
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475.fpext_32ns_64_2_no_dsp_1_U1", "Parent" : "9"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475.fpext_32ns_64_2_no_dsp_1_U2", "Parent" : "9"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475.fpext_32ns_64_2_no_dsp_1_U3", "Parent" : "9"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475.fpext_32ns_64_2_no_dsp_1_U4", "Parent" : "9"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_sort_C_Pipeline_loop_diff_window_loop_diff_pe_fu_475.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_83_32_1_1_U31", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	sort_C {
		lenEdgeListPtr {Type I LastRead 0 FirstWrite -1}
		fifoEdgeListPtr_i_V {Type I LastRead 2 FirstWrite -1}
		fifoMatrixCIdx_i_0_V {Type I LastRead 2 FirstWrite -1}
		fifoMatrixCIdx_i_1_V {Type I LastRead 2 FirstWrite -1}
		fifoMatrixCIdx_i_2_V {Type I LastRead 2 FirstWrite -1}
		fifoMatrixCIdx_i_3_V {Type I LastRead 2 FirstWrite -1}
		fifoMatrixCIdx_i_4_V {Type I LastRead 3 FirstWrite -1}
		fifoMatrixCIdx_i_5_V {Type I LastRead 3 FirstWrite -1}
		fifoMatrixCIdx_i_6_V {Type I LastRead 3 FirstWrite -1}
		fifoMatrixCIdx_i_7_V {Type I LastRead 3 FirstWrite -1}
		fifoCalcMatrixC_i_0_V {Type I LastRead 2 FirstWrite -1}
		fifoCalcMatrixC_i_1_V {Type I LastRead 2 FirstWrite -1}
		fifoCalcMatrixC_i_2_V {Type I LastRead 2 FirstWrite -1}
		fifoCalcMatrixC_i_3_V {Type I LastRead 2 FirstWrite -1}
		fifoCalcMatrixC_i_4_V {Type I LastRead 3 FirstWrite -1}
		fifoCalcMatrixC_i_5_V {Type I LastRead 3 FirstWrite -1}
		fifoCalcMatrixC_i_6_V {Type I LastRead 3 FirstWrite -1}
		fifoCalcMatrixC_i_7_V {Type I LastRead 3 FirstWrite -1}
		fifoSortMatrixC_o_0_V {Type O LastRead -1 FirstWrite 6}
		fifoSortMatrixC_o_1_V {Type O LastRead -1 FirstWrite 6}
		fifoSortMatrixC_o_2_V {Type O LastRead -1 FirstWrite 6}
		fifoSortMatrixC_o_3_V {Type O LastRead -1 FirstWrite 6}
		fifoSortMatrixC_o_4_V {Type O LastRead -1 FirstWrite 6}
		fifoSortMatrixC_o_5_V {Type O LastRead -1 FirstWrite 6}
		fifoSortMatrixC_o_6_V {Type O LastRead -1 FirstWrite 6}
		fifoSortMatrixC_o_7_V {Type O LastRead -1 FirstWrite 6}}
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
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	lenEdgeListPtr { ap_none {  { lenEdgeListPtr in_data 0 32 } } }
	fifoEdgeListPtr_i_V { ap_fifo {  { fifoEdgeListPtr_i_V_dout fifo_data 0 32 }  { fifoEdgeListPtr_i_V_empty_n fifo_status 0 1 }  { fifoEdgeListPtr_i_V_read fifo_update 1 1 } } }
	fifoMatrixCIdx_i_0_V { ap_fifo {  { fifoMatrixCIdx_i_0_V_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_0_V_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_0_V_read fifo_update 1 1 } } }
	fifoMatrixCIdx_i_1_V { ap_fifo {  { fifoMatrixCIdx_i_1_V_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_1_V_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_1_V_read fifo_update 1 1 } } }
	fifoMatrixCIdx_i_2_V { ap_fifo {  { fifoMatrixCIdx_i_2_V_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_2_V_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_2_V_read fifo_update 1 1 } } }
	fifoMatrixCIdx_i_3_V { ap_fifo {  { fifoMatrixCIdx_i_3_V_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_3_V_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_3_V_read fifo_update 1 1 } } }
	fifoMatrixCIdx_i_4_V { ap_fifo {  { fifoMatrixCIdx_i_4_V_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_4_V_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_4_V_read fifo_update 1 1 } } }
	fifoMatrixCIdx_i_5_V { ap_fifo {  { fifoMatrixCIdx_i_5_V_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_5_V_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_5_V_read fifo_update 1 1 } } }
	fifoMatrixCIdx_i_6_V { ap_fifo {  { fifoMatrixCIdx_i_6_V_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_6_V_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_6_V_read fifo_update 1 1 } } }
	fifoMatrixCIdx_i_7_V { ap_fifo {  { fifoMatrixCIdx_i_7_V_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_7_V_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_7_V_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_0_V { ap_fifo {  { fifoCalcMatrixC_i_0_V_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_0_V_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_0_V_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_1_V { ap_fifo {  { fifoCalcMatrixC_i_1_V_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_1_V_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_1_V_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_2_V { ap_fifo {  { fifoCalcMatrixC_i_2_V_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_2_V_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_2_V_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_3_V { ap_fifo {  { fifoCalcMatrixC_i_3_V_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_3_V_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_3_V_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_4_V { ap_fifo {  { fifoCalcMatrixC_i_4_V_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_4_V_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_4_V_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_5_V { ap_fifo {  { fifoCalcMatrixC_i_5_V_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_5_V_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_5_V_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_6_V { ap_fifo {  { fifoCalcMatrixC_i_6_V_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_6_V_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_6_V_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_7_V { ap_fifo {  { fifoCalcMatrixC_i_7_V_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_7_V_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_7_V_read fifo_update 1 1 } } }
	fifoSortMatrixC_o_0_V { ap_fifo {  { fifoSortMatrixC_o_0_V_din fifo_data 1 32 }  { fifoSortMatrixC_o_0_V_full_n fifo_status 0 1 }  { fifoSortMatrixC_o_0_V_write fifo_update 1 1 } } }
	fifoSortMatrixC_o_1_V { ap_fifo {  { fifoSortMatrixC_o_1_V_din fifo_data 1 32 }  { fifoSortMatrixC_o_1_V_full_n fifo_status 0 1 }  { fifoSortMatrixC_o_1_V_write fifo_update 1 1 } } }
	fifoSortMatrixC_o_2_V { ap_fifo {  { fifoSortMatrixC_o_2_V_din fifo_data 1 32 }  { fifoSortMatrixC_o_2_V_full_n fifo_status 0 1 }  { fifoSortMatrixC_o_2_V_write fifo_update 1 1 } } }
	fifoSortMatrixC_o_3_V { ap_fifo {  { fifoSortMatrixC_o_3_V_din fifo_data 1 32 }  { fifoSortMatrixC_o_3_V_full_n fifo_status 0 1 }  { fifoSortMatrixC_o_3_V_write fifo_update 1 1 } } }
	fifoSortMatrixC_o_4_V { ap_fifo {  { fifoSortMatrixC_o_4_V_din fifo_data 1 32 }  { fifoSortMatrixC_o_4_V_full_n fifo_status 0 1 }  { fifoSortMatrixC_o_4_V_write fifo_update 1 1 } } }
	fifoSortMatrixC_o_5_V { ap_fifo {  { fifoSortMatrixC_o_5_V_din fifo_data 1 32 }  { fifoSortMatrixC_o_5_V_full_n fifo_status 0 1 }  { fifoSortMatrixC_o_5_V_write fifo_update 1 1 } } }
	fifoSortMatrixC_o_6_V { ap_fifo {  { fifoSortMatrixC_o_6_V_din fifo_data 1 32 }  { fifoSortMatrixC_o_6_V_full_n fifo_status 0 1 }  { fifoSortMatrixC_o_6_V_write fifo_update 1 1 } } }
	fifoSortMatrixC_o_7_V { ap_fifo {  { fifoSortMatrixC_o_7_V_din fifo_data 1 32 }  { fifoSortMatrixC_o_7_V_full_n fifo_status 0 1 }  { fifoSortMatrixC_o_7_V_write fifo_update 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
	fifoEdgeListPtr_i_V { fifo_read 2 no_conditional }
	fifoMatrixCIdx_i_0_V { fifo_read 1 no_conditional }
	fifoMatrixCIdx_i_1_V { fifo_read 1 no_conditional }
	fifoMatrixCIdx_i_2_V { fifo_read 1 no_conditional }
	fifoMatrixCIdx_i_3_V { fifo_read 1 no_conditional }
	fifoMatrixCIdx_i_4_V { fifo_read 1 no_conditional }
	fifoMatrixCIdx_i_5_V { fifo_read 1 no_conditional }
	fifoMatrixCIdx_i_6_V { fifo_read 1 no_conditional }
	fifoMatrixCIdx_i_7_V { fifo_read 1 no_conditional }
	fifoCalcMatrixC_i_0_V { fifo_read 1 no_conditional }
	fifoCalcMatrixC_i_1_V { fifo_read 1 no_conditional }
	fifoCalcMatrixC_i_2_V { fifo_read 1 no_conditional }
	fifoCalcMatrixC_i_3_V { fifo_read 1 no_conditional }
	fifoCalcMatrixC_i_4_V { fifo_read 1 no_conditional }
	fifoCalcMatrixC_i_5_V { fifo_read 1 no_conditional }
	fifoCalcMatrixC_i_6_V { fifo_read 1 no_conditional }
	fifoCalcMatrixC_i_7_V { fifo_read 1 no_conditional }
	fifoSortMatrixC_o_0_V { fifo_write 8 has_conditional }
	fifoSortMatrixC_o_1_V { fifo_write 8 has_conditional }
	fifoSortMatrixC_o_2_V { fifo_write 8 has_conditional }
	fifoSortMatrixC_o_3_V { fifo_write 8 has_conditional }
	fifoSortMatrixC_o_4_V { fifo_write 8 has_conditional }
	fifoSortMatrixC_o_5_V { fifo_write 8 has_conditional }
	fifoSortMatrixC_o_6_V { fifo_write 8 has_conditional }
	fifoSortMatrixC_o_7_V { fifo_write 8 has_conditional }
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
