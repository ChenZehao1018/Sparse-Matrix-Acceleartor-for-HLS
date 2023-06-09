set moduleName calc_C
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {calc_C}
set C_modelType { void 0 }
set C_modelArgList {
	{ lenEdgeListPtr int 32 regular {fifo 0}  }
	{ fifoEdgeListPtr11 int 32 regular {fifo 0 volatile }  }
	{ fifoMatrixAIdx12 int 32 regular {fifo 0 volatile }  }
	{ fifoMatrixA13 int 32 regular {fifo 0 volatile }  }
	{ fifoMatrixB14 int 32 regular {fifo 0 volatile }  }
	{ fifoEdgeListPtr_calC15 int 32 regular {fifo 1 volatile }  }
	{ fifoMatrixCIdx_o_0_0_0_0 int 16 regular {fifo 1 volatile }  }
	{ fifoMatrixCIdx_o_0_0_0_01 int 16 regular {fifo 1 volatile }  }
	{ fifoCalcMatrixC_o_0 float 32 regular {fifo 1 volatile }  }
	{ fifoCalcMatrixC_o_02 float 32 regular {fifo 1 volatile }  }
	{ lenEdgeListPtr_c int 32 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "lenEdgeListPtr", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoEdgeListPtr11", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixAIdx12", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixA13", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixB14", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoEdgeListPtr_calC15", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_o_0_0_0_0", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_o_0_0_0_01", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_o_0", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_o_02", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "lenEdgeListPtr_c", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 43
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ lenEdgeListPtr_dout sc_in sc_lv 32 signal 0 } 
	{ lenEdgeListPtr_empty_n sc_in sc_logic 1 signal 0 } 
	{ lenEdgeListPtr_read sc_out sc_logic 1 signal 0 } 
	{ fifoEdgeListPtr11_dout sc_in sc_lv 32 signal 1 } 
	{ fifoEdgeListPtr11_empty_n sc_in sc_logic 1 signal 1 } 
	{ fifoEdgeListPtr11_read sc_out sc_logic 1 signal 1 } 
	{ fifoMatrixAIdx12_dout sc_in sc_lv 32 signal 2 } 
	{ fifoMatrixAIdx12_empty_n sc_in sc_logic 1 signal 2 } 
	{ fifoMatrixAIdx12_read sc_out sc_logic 1 signal 2 } 
	{ fifoMatrixA13_dout sc_in sc_lv 32 signal 3 } 
	{ fifoMatrixA13_empty_n sc_in sc_logic 1 signal 3 } 
	{ fifoMatrixA13_read sc_out sc_logic 1 signal 3 } 
	{ fifoMatrixB14_dout sc_in sc_lv 32 signal 4 } 
	{ fifoMatrixB14_empty_n sc_in sc_logic 1 signal 4 } 
	{ fifoMatrixB14_read sc_out sc_logic 1 signal 4 } 
	{ fifoEdgeListPtr_calC15_din sc_out sc_lv 32 signal 5 } 
	{ fifoEdgeListPtr_calC15_full_n sc_in sc_logic 1 signal 5 } 
	{ fifoEdgeListPtr_calC15_write sc_out sc_logic 1 signal 5 } 
	{ fifoMatrixCIdx_o_0_0_0_0_din sc_out sc_lv 16 signal 6 } 
	{ fifoMatrixCIdx_o_0_0_0_0_full_n sc_in sc_logic 1 signal 6 } 
	{ fifoMatrixCIdx_o_0_0_0_0_write sc_out sc_logic 1 signal 6 } 
	{ fifoMatrixCIdx_o_0_0_0_01_din sc_out sc_lv 16 signal 7 } 
	{ fifoMatrixCIdx_o_0_0_0_01_full_n sc_in sc_logic 1 signal 7 } 
	{ fifoMatrixCIdx_o_0_0_0_01_write sc_out sc_logic 1 signal 7 } 
	{ fifoCalcMatrixC_o_0_din sc_out sc_lv 32 signal 8 } 
	{ fifoCalcMatrixC_o_0_full_n sc_in sc_logic 1 signal 8 } 
	{ fifoCalcMatrixC_o_0_write sc_out sc_logic 1 signal 8 } 
	{ fifoCalcMatrixC_o_02_din sc_out sc_lv 32 signal 9 } 
	{ fifoCalcMatrixC_o_02_full_n sc_in sc_logic 1 signal 9 } 
	{ fifoCalcMatrixC_o_02_write sc_out sc_logic 1 signal 9 } 
	{ lenEdgeListPtr_c_din sc_out sc_lv 32 signal 10 } 
	{ lenEdgeListPtr_c_full_n sc_in sc_logic 1 signal 10 } 
	{ lenEdgeListPtr_c_write sc_out sc_logic 1 signal 10 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "lenEdgeListPtr_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "lenEdgeListPtr", "role": "dout" }} , 
 	{ "name": "lenEdgeListPtr_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "lenEdgeListPtr", "role": "empty_n" }} , 
 	{ "name": "lenEdgeListPtr_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "lenEdgeListPtr", "role": "read" }} , 
 	{ "name": "fifoEdgeListPtr11_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoEdgeListPtr11", "role": "dout" }} , 
 	{ "name": "fifoEdgeListPtr11_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoEdgeListPtr11", "role": "empty_n" }} , 
 	{ "name": "fifoEdgeListPtr11_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoEdgeListPtr11", "role": "read" }} , 
 	{ "name": "fifoMatrixAIdx12_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoMatrixAIdx12", "role": "dout" }} , 
 	{ "name": "fifoMatrixAIdx12_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixAIdx12", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixAIdx12_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixAIdx12", "role": "read" }} , 
 	{ "name": "fifoMatrixA13_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoMatrixA13", "role": "dout" }} , 
 	{ "name": "fifoMatrixA13_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixA13", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixA13_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixA13", "role": "read" }} , 
 	{ "name": "fifoMatrixB14_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoMatrixB14", "role": "dout" }} , 
 	{ "name": "fifoMatrixB14_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixB14", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixB14_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixB14", "role": "read" }} , 
 	{ "name": "fifoEdgeListPtr_calC15_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoEdgeListPtr_calC15", "role": "din" }} , 
 	{ "name": "fifoEdgeListPtr_calC15_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoEdgeListPtr_calC15", "role": "full_n" }} , 
 	{ "name": "fifoEdgeListPtr_calC15_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoEdgeListPtr_calC15", "role": "write" }} , 
 	{ "name": "fifoMatrixCIdx_o_0_0_0_0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_o_0_0_0_0", "role": "din" }} , 
 	{ "name": "fifoMatrixCIdx_o_0_0_0_0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_o_0_0_0_0", "role": "full_n" }} , 
 	{ "name": "fifoMatrixCIdx_o_0_0_0_0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_o_0_0_0_0", "role": "write" }} , 
 	{ "name": "fifoMatrixCIdx_o_0_0_0_01_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_o_0_0_0_01", "role": "din" }} , 
 	{ "name": "fifoMatrixCIdx_o_0_0_0_01_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_o_0_0_0_01", "role": "full_n" }} , 
 	{ "name": "fifoMatrixCIdx_o_0_0_0_01_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_o_0_0_0_01", "role": "write" }} , 
 	{ "name": "fifoCalcMatrixC_o_0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_o_0", "role": "din" }} , 
 	{ "name": "fifoCalcMatrixC_o_0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_o_0", "role": "full_n" }} , 
 	{ "name": "fifoCalcMatrixC_o_0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_o_0", "role": "write" }} , 
 	{ "name": "fifoCalcMatrixC_o_02_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_o_02", "role": "din" }} , 
 	{ "name": "fifoCalcMatrixC_o_02_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_o_02", "role": "full_n" }} , 
 	{ "name": "fifoCalcMatrixC_o_02_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_o_02", "role": "write" }} , 
 	{ "name": "lenEdgeListPtr_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "lenEdgeListPtr_c", "role": "din" }} , 
 	{ "name": "lenEdgeListPtr_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "lenEdgeListPtr_c", "role": "full_n" }} , 
 	{ "name": "lenEdgeListPtr_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "lenEdgeListPtr_c", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "calc_C",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"Port" : [
			{"Name" : "lenEdgeListPtr", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "lenEdgeListPtr_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoEdgeListPtr11", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "fifoEdgeListPtr11_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoMatrixAIdx12", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "fifoMatrixAIdx12_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoMatrixA13", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "fifoMatrixA13_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoMatrixB14", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "fifoMatrixB14_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoEdgeListPtr_calC15", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "fifoEdgeListPtr_calC15_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoMatrixCIdx_o_0_0_0_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "fifoMatrixCIdx_o_0_0_0_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoMatrixCIdx_o_0_0_0_01", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "fifoMatrixCIdx_o_0_0_0_01_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoCalcMatrixC_o_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "fifoCalcMatrixC_o_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoCalcMatrixC_o_02", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "fifoCalcMatrixC_o_02_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "lenEdgeListPtr_c", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "lenEdgeListPtr_c_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_67_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state4"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_66_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_for_col", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state8", "LastState" : ["ap_ST_fsm_state13"], "QuitState" : ["ap_ST_fsm_state8"], "PreState" : ["ap_ST_fsm_state7"], "PostState" : ["ap_ST_fsm_state7"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_diff_pe", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state7", "LastState" : ["ap_ST_fsm_state8"], "QuitState" : ["ap_ST_fsm_state7"], "PreState" : ["ap_ST_fsm_state6"], "PostState" : ["ap_ST_fsm_state6"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_diff_window", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state7"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state5"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_repeat_iter", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "13", "FirstState" : "ap_ST_fsm_state5", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state5"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.matrixB_buffer_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_3_max_dsp_1_U23", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	calc_C {
		lenEdgeListPtr {Type I LastRead 0 FirstWrite -1}
		fifoEdgeListPtr11 {Type I LastRead 2 FirstWrite -1}
		fifoMatrixAIdx12 {Type I LastRead 4 FirstWrite -1}
		fifoMatrixA13 {Type I LastRead 4 FirstWrite -1}
		fifoMatrixB14 {Type I LastRead 2 FirstWrite -1}
		fifoEdgeListPtr_calC15 {Type O LastRead -1 FirstWrite 1}
		fifoMatrixCIdx_o_0_0_0_0 {Type O LastRead -1 FirstWrite 10}
		fifoMatrixCIdx_o_0_0_0_01 {Type O LastRead -1 FirstWrite 10}
		fifoCalcMatrixC_o_0 {Type O LastRead -1 FirstWrite 10}
		fifoCalcMatrixC_o_02 {Type O LastRead -1 FirstWrite 10}
		lenEdgeListPtr_c {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	lenEdgeListPtr { ap_fifo {  { lenEdgeListPtr_dout fifo_data 0 32 }  { lenEdgeListPtr_empty_n fifo_status 0 1 }  { lenEdgeListPtr_read fifo_update 1 1 } } }
	fifoEdgeListPtr11 { ap_fifo {  { fifoEdgeListPtr11_dout fifo_data 0 32 }  { fifoEdgeListPtr11_empty_n fifo_status 0 1 }  { fifoEdgeListPtr11_read fifo_update 1 1 } } }
	fifoMatrixAIdx12 { ap_fifo {  { fifoMatrixAIdx12_dout fifo_data 0 32 }  { fifoMatrixAIdx12_empty_n fifo_status 0 1 }  { fifoMatrixAIdx12_read fifo_update 1 1 } } }
	fifoMatrixA13 { ap_fifo {  { fifoMatrixA13_dout fifo_data 0 32 }  { fifoMatrixA13_empty_n fifo_status 0 1 }  { fifoMatrixA13_read fifo_update 1 1 } } }
	fifoMatrixB14 { ap_fifo {  { fifoMatrixB14_dout fifo_data 0 32 }  { fifoMatrixB14_empty_n fifo_status 0 1 }  { fifoMatrixB14_read fifo_update 1 1 } } }
	fifoEdgeListPtr_calC15 { ap_fifo {  { fifoEdgeListPtr_calC15_din fifo_data 1 32 }  { fifoEdgeListPtr_calC15_full_n fifo_status 0 1 }  { fifoEdgeListPtr_calC15_write fifo_update 1 1 } } }
	fifoMatrixCIdx_o_0_0_0_0 { ap_fifo {  { fifoMatrixCIdx_o_0_0_0_0_din fifo_data 1 16 }  { fifoMatrixCIdx_o_0_0_0_0_full_n fifo_status 0 1 }  { fifoMatrixCIdx_o_0_0_0_0_write fifo_update 1 1 } } }
	fifoMatrixCIdx_o_0_0_0_01 { ap_fifo {  { fifoMatrixCIdx_o_0_0_0_01_din fifo_data 1 16 }  { fifoMatrixCIdx_o_0_0_0_01_full_n fifo_status 0 1 }  { fifoMatrixCIdx_o_0_0_0_01_write fifo_update 1 1 } } }
	fifoCalcMatrixC_o_0 { ap_fifo {  { fifoCalcMatrixC_o_0_din fifo_data 1 32 }  { fifoCalcMatrixC_o_0_full_n fifo_status 0 1 }  { fifoCalcMatrixC_o_0_write fifo_update 1 1 } } }
	fifoCalcMatrixC_o_02 { ap_fifo {  { fifoCalcMatrixC_o_02_din fifo_data 1 32 }  { fifoCalcMatrixC_o_02_full_n fifo_status 0 1 }  { fifoCalcMatrixC_o_02_write fifo_update 1 1 } } }
	lenEdgeListPtr_c { ap_fifo {  { lenEdgeListPtr_c_din fifo_data 1 32 }  { lenEdgeListPtr_c_full_n fifo_status 0 1 }  { lenEdgeListPtr_c_write fifo_update 1 1 } } }
}
