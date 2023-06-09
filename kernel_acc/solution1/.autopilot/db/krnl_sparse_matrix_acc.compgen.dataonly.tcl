# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
HLSPtr_i { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
matrixA_hls_idx { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 28
	offset_end 39
}
matrixA_i { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 40
	offset_end 51
}
matrixB_i { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 52
	offset_end 63
}
matrixC_o { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 64
	offset_end 75
}
lenEdgeListPtr { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 76
	offset_end 83
}
lenEdgePtr { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 84
	offset_end 91
}
M { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 92
	offset_end 99
}
K { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 100
	offset_end 107
}
N { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 108
	offset_end 115
}
ap_start {
	mailbox_input_ctrl 0
	mailbox_output_ctrl 0
	auto_restart_enabled 1
	auto_restart_counter_num 0
	auto_restart_counter_offset 16
	auto_restart_counter_size 32
}
ap_done { }
ap_ready { }
ap_idle { }
}
dict set axilite_register_dict control $port_control


