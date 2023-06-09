set moduleName sort_C
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
set C_modelName {sort_C}
set C_modelType { void 0 }
set C_modelArgList {
	{ lenEdgeListPtr int 32 regular {fifo 0}  }
	{ fifoEdgeListPtr_calC15 int 32 regular {fifo 0 volatile }  }
	{ fifoMatrixCIdx_i_0_0_0_0 int 16 regular {fifo 0 volatile }  }
	{ fifoMatrixCIdx_i_0_0_0_01 int 16 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_0 float 32 regular {fifo 0 volatile }  }
	{ fifoCalcMatrixC_i_02 float 32 regular {fifo 0 volatile }  }
	{ fifoSortMatrixC_o_0 float 32 regular {fifo 1 volatile }  }
	{ fifoSortMatrixC_o_03 float 32 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "lenEdgeListPtr", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoEdgeListPtr_calC15", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_0_0_0_0", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoMatrixCIdx_i_0_0_0_01", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_0", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoCalcMatrixC_i_02", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "fifoSortMatrixC_o_0", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "fifoSortMatrixC_o_03", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 31
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ lenEdgeListPtr_dout sc_in sc_lv 32 signal 0 } 
	{ lenEdgeListPtr_empty_n sc_in sc_logic 1 signal 0 } 
	{ lenEdgeListPtr_read sc_out sc_logic 1 signal 0 } 
	{ fifoEdgeListPtr_calC15_dout sc_in sc_lv 32 signal 1 } 
	{ fifoEdgeListPtr_calC15_empty_n sc_in sc_logic 1 signal 1 } 
	{ fifoEdgeListPtr_calC15_read sc_out sc_logic 1 signal 1 } 
	{ fifoMatrixCIdx_i_0_0_0_0_dout sc_in sc_lv 16 signal 2 } 
	{ fifoMatrixCIdx_i_0_0_0_0_empty_n sc_in sc_logic 1 signal 2 } 
	{ fifoMatrixCIdx_i_0_0_0_0_read sc_out sc_logic 1 signal 2 } 
	{ fifoMatrixCIdx_i_0_0_0_01_dout sc_in sc_lv 16 signal 3 } 
	{ fifoMatrixCIdx_i_0_0_0_01_empty_n sc_in sc_logic 1 signal 3 } 
	{ fifoMatrixCIdx_i_0_0_0_01_read sc_out sc_logic 1 signal 3 } 
	{ fifoCalcMatrixC_i_0_dout sc_in sc_lv 32 signal 4 } 
	{ fifoCalcMatrixC_i_0_empty_n sc_in sc_logic 1 signal 4 } 
	{ fifoCalcMatrixC_i_0_read sc_out sc_logic 1 signal 4 } 
	{ fifoCalcMatrixC_i_02_dout sc_in sc_lv 32 signal 5 } 
	{ fifoCalcMatrixC_i_02_empty_n sc_in sc_logic 1 signal 5 } 
	{ fifoCalcMatrixC_i_02_read sc_out sc_logic 1 signal 5 } 
	{ fifoSortMatrixC_o_0_din sc_out sc_lv 32 signal 6 } 
	{ fifoSortMatrixC_o_0_full_n sc_in sc_logic 1 signal 6 } 
	{ fifoSortMatrixC_o_0_write sc_out sc_logic 1 signal 6 } 
	{ fifoSortMatrixC_o_03_din sc_out sc_lv 32 signal 7 } 
	{ fifoSortMatrixC_o_03_full_n sc_in sc_logic 1 signal 7 } 
	{ fifoSortMatrixC_o_03_write sc_out sc_logic 1 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "lenEdgeListPtr_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "lenEdgeListPtr", "role": "dout" }} , 
 	{ "name": "lenEdgeListPtr_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "lenEdgeListPtr", "role": "empty_n" }} , 
 	{ "name": "lenEdgeListPtr_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "lenEdgeListPtr", "role": "read" }} , 
 	{ "name": "fifoEdgeListPtr_calC15_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoEdgeListPtr_calC15", "role": "dout" }} , 
 	{ "name": "fifoEdgeListPtr_calC15_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoEdgeListPtr_calC15", "role": "empty_n" }} , 
 	{ "name": "fifoEdgeListPtr_calC15_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoEdgeListPtr_calC15", "role": "read" }} , 
 	{ "name": "fifoMatrixCIdx_i_0_0_0_0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_0_0_0_0", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_0_0_0_0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_0_0_0_0", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_0_0_0_0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_0_0_0_0", "role": "read" }} , 
 	{ "name": "fifoMatrixCIdx_i_0_0_0_01_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_0_0_0_01", "role": "dout" }} , 
 	{ "name": "fifoMatrixCIdx_i_0_0_0_01_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_0_0_0_01", "role": "empty_n" }} , 
 	{ "name": "fifoMatrixCIdx_i_0_0_0_01_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoMatrixCIdx_i_0_0_0_01", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_0", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_0", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_0", "role": "read" }} , 
 	{ "name": "fifoCalcMatrixC_i_02_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_02", "role": "dout" }} , 
 	{ "name": "fifoCalcMatrixC_i_02_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_02", "role": "empty_n" }} , 
 	{ "name": "fifoCalcMatrixC_i_02_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoCalcMatrixC_i_02", "role": "read" }} , 
 	{ "name": "fifoSortMatrixC_o_0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_0", "role": "din" }} , 
 	{ "name": "fifoSortMatrixC_o_0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_0", "role": "full_n" }} , 
 	{ "name": "fifoSortMatrixC_o_0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_0", "role": "write" }} , 
 	{ "name": "fifoSortMatrixC_o_03_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_03", "role": "din" }} , 
 	{ "name": "fifoSortMatrixC_o_03_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_03", "role": "full_n" }} , 
 	{ "name": "fifoSortMatrixC_o_03_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fifoSortMatrixC_o_03", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "sort_C",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "lenEdgeListPtr", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "lenEdgeListPtr_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoEdgeListPtr_calC15", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "fifoEdgeListPtr_calC15_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoMatrixCIdx_i_0_0_0_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "fifoMatrixCIdx_i_0_0_0_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoMatrixCIdx_i_0_0_0_01", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "fifoMatrixCIdx_i_0_0_0_01_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoCalcMatrixC_i_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "fifoCalcMatrixC_i_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoCalcMatrixC_i_02", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "fifoCalcMatrixC_i_02_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoSortMatrixC_o_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "fifoSortMatrixC_o_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "fifoSortMatrixC_o_03", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "32", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "fifoSortMatrixC_o_03_blk_n", "Type" : "RtlSignal"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_136_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "14", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state2"], "OneDepthLoop" : "1", "OneStateBlock": "ap_ST_fsm_state3_blk"}},
			{"Name" : "VITIS_LOOP_135_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "14", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state3"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_for_col", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "14", "FirstState" : "ap_ST_fsm_state7", "LastState" : ["ap_ST_fsm_state10"], "QuitState" : ["ap_ST_fsm_state7"], "PreState" : ["ap_ST_fsm_state6"], "PostState" : ["ap_ST_fsm_state6"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_diff_pe", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "14", "FirstState" : "ap_ST_fsm_state6", "LastState" : ["ap_ST_fsm_state7"], "QuitState" : ["ap_ST_fsm_state6"], "PreState" : ["ap_ST_fsm_state5"], "PostState" : ["ap_ST_fsm_state5"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_diff_window", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "14", "FirstState" : "ap_ST_fsm_state5", "LastState" : ["ap_ST_fsm_state6"], "QuitState" : ["ap_ST_fsm_state5"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state4"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "loop_repeat_iter", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "14", "FirstState" : "ap_ST_fsm_state4", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state4"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state11"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_169_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "14", "FirstState" : "ap_ST_fsm_state12", "LastState" : ["ap_ST_fsm_state14"], "QuitState" : ["ap_ST_fsm_state12"], "PreState" : ["ap_ST_fsm_state11"], "PostState" : ["ap_ST_fsm_state11"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_168_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "14", "FirstState" : "ap_ST_fsm_state11", "LastState" : ["ap_ST_fsm_state12"], "QuitState" : ["ap_ST_fsm_state11"], "PreState" : ["ap_ST_fsm_state4"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.matrixC_buffer_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fpext_32ns_64_2_no_dsp_1_U37", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	sort_C {
		lenEdgeListPtr {Type I LastRead 0 FirstWrite -1}
		fifoEdgeListPtr_calC15 {Type I LastRead 2 FirstWrite -1}
		fifoMatrixCIdx_i_0_0_0_0 {Type I LastRead 5 FirstWrite -1}
		fifoMatrixCIdx_i_0_0_0_01 {Type I LastRead 5 FirstWrite -1}
		fifoCalcMatrixC_i_0 {Type I LastRead 5 FirstWrite -1}
		fifoCalcMatrixC_i_02 {Type I LastRead 5 FirstWrite -1}
		fifoSortMatrixC_o_0 {Type O LastRead -1 FirstWrite 6}
		fifoSortMatrixC_o_03 {Type O LastRead -1 FirstWrite 6}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	lenEdgeListPtr { ap_fifo {  { lenEdgeListPtr_dout fifo_data 0 32 }  { lenEdgeListPtr_empty_n fifo_status 0 1 }  { lenEdgeListPtr_read fifo_update 1 1 } } }
	fifoEdgeListPtr_calC15 { ap_fifo {  { fifoEdgeListPtr_calC15_dout fifo_data 0 32 }  { fifoEdgeListPtr_calC15_empty_n fifo_status 0 1 }  { fifoEdgeListPtr_calC15_read fifo_update 1 1 } } }
	fifoMatrixCIdx_i_0_0_0_0 { ap_fifo {  { fifoMatrixCIdx_i_0_0_0_0_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_0_0_0_0_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_0_0_0_0_read fifo_update 1 1 } } }
	fifoMatrixCIdx_i_0_0_0_01 { ap_fifo {  { fifoMatrixCIdx_i_0_0_0_01_dout fifo_data 0 16 }  { fifoMatrixCIdx_i_0_0_0_01_empty_n fifo_status 0 1 }  { fifoMatrixCIdx_i_0_0_0_01_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_0 { ap_fifo {  { fifoCalcMatrixC_i_0_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_0_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_0_read fifo_update 1 1 } } }
	fifoCalcMatrixC_i_02 { ap_fifo {  { fifoCalcMatrixC_i_02_dout fifo_data 0 32 }  { fifoCalcMatrixC_i_02_empty_n fifo_status 0 1 }  { fifoCalcMatrixC_i_02_read fifo_update 1 1 } } }
	fifoSortMatrixC_o_0 { ap_fifo {  { fifoSortMatrixC_o_0_din fifo_data 1 32 }  { fifoSortMatrixC_o_0_full_n fifo_status 0 1 }  { fifoSortMatrixC_o_0_write fifo_update 1 1 } } }
	fifoSortMatrixC_o_03 { ap_fifo {  { fifoSortMatrixC_o_03_din fifo_data 1 32 }  { fifoSortMatrixC_o_03_full_n fifo_status 0 1 }  { fifoSortMatrixC_o_03_write fifo_update 1 1 } } }
}
