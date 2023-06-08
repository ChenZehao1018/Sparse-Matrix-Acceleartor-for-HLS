# This script segment is generated automatically by AutoPilot

set name sort_C_fpext_32ns_64_2_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fpext} IMPL {auto} LATENCY 1 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 23 \
    name matrixC_buffer_V_0 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename matrixC_buffer_V_0 \
    op interface \
    ports { matrixC_buffer_V_0_address0 { O 3 vector } matrixC_buffer_V_0_ce0 { O 1 bit } matrixC_buffer_V_0_we0 { O 1 bit } matrixC_buffer_V_0_d0 { O 32 vector } matrixC_buffer_V_0_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'matrixC_buffer_V_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 24 \
    name matrixC_buffer_V_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename matrixC_buffer_V_1 \
    op interface \
    ports { matrixC_buffer_V_1_address0 { O 3 vector } matrixC_buffer_V_1_ce0 { O 1 bit } matrixC_buffer_V_1_we0 { O 1 bit } matrixC_buffer_V_1_d0 { O 32 vector } matrixC_buffer_V_1_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'matrixC_buffer_V_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 25 \
    name matrixC_buffer_V_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename matrixC_buffer_V_2 \
    op interface \
    ports { matrixC_buffer_V_2_address0 { O 3 vector } matrixC_buffer_V_2_ce0 { O 1 bit } matrixC_buffer_V_2_we0 { O 1 bit } matrixC_buffer_V_2_d0 { O 32 vector } matrixC_buffer_V_2_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'matrixC_buffer_V_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 26 \
    name matrixC_buffer_V_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename matrixC_buffer_V_3 \
    op interface \
    ports { matrixC_buffer_V_3_address0 { O 3 vector } matrixC_buffer_V_3_ce0 { O 1 bit } matrixC_buffer_V_3_we0 { O 1 bit } matrixC_buffer_V_3_d0 { O 32 vector } matrixC_buffer_V_3_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'matrixC_buffer_V_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 27 \
    name matrixC_buffer_V_4 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename matrixC_buffer_V_4 \
    op interface \
    ports { matrixC_buffer_V_4_address0 { O 3 vector } matrixC_buffer_V_4_ce0 { O 1 bit } matrixC_buffer_V_4_we0 { O 1 bit } matrixC_buffer_V_4_d0 { O 32 vector } matrixC_buffer_V_4_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'matrixC_buffer_V_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 28 \
    name matrixC_buffer_V_5 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename matrixC_buffer_V_5 \
    op interface \
    ports { matrixC_buffer_V_5_address0 { O 3 vector } matrixC_buffer_V_5_ce0 { O 1 bit } matrixC_buffer_V_5_we0 { O 1 bit } matrixC_buffer_V_5_d0 { O 32 vector } matrixC_buffer_V_5_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'matrixC_buffer_V_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 29 \
    name matrixC_buffer_V_6 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename matrixC_buffer_V_6 \
    op interface \
    ports { matrixC_buffer_V_6_address0 { O 3 vector } matrixC_buffer_V_6_ce0 { O 1 bit } matrixC_buffer_V_6_we0 { O 1 bit } matrixC_buffer_V_6_d0 { O 32 vector } matrixC_buffer_V_6_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'matrixC_buffer_V_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 30 \
    name matrixC_buffer_V_7 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename matrixC_buffer_V_7 \
    op interface \
    ports { matrixC_buffer_V_7_address0 { O 3 vector } matrixC_buffer_V_7_ce0 { O 1 bit } matrixC_buffer_V_7_we0 { O 1 bit } matrixC_buffer_V_7_d0 { O 32 vector } matrixC_buffer_V_7_q0 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'matrixC_buffer_V_7'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name zext_ln143_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln143_1 \
    op interface \
    ports { zext_ln143_1 { I 34 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name fifoMatrixCIdx_i_7_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoMatrixCIdx_i_7_V \
    op interface \
    ports { fifoMatrixCIdx_i_7_V_dout { I 16 vector } fifoMatrixCIdx_i_7_V_empty_n { I 1 bit } fifoMatrixCIdx_i_7_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name fifoCalcMatrixC_i_7_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoCalcMatrixC_i_7_V \
    op interface \
    ports { fifoCalcMatrixC_i_7_V_dout { I 32 vector } fifoCalcMatrixC_i_7_V_empty_n { I 1 bit } fifoCalcMatrixC_i_7_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name fifoMatrixCIdx_i_6_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoMatrixCIdx_i_6_V \
    op interface \
    ports { fifoMatrixCIdx_i_6_V_dout { I 16 vector } fifoMatrixCIdx_i_6_V_empty_n { I 1 bit } fifoMatrixCIdx_i_6_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name fifoCalcMatrixC_i_6_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoCalcMatrixC_i_6_V \
    op interface \
    ports { fifoCalcMatrixC_i_6_V_dout { I 32 vector } fifoCalcMatrixC_i_6_V_empty_n { I 1 bit } fifoCalcMatrixC_i_6_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name fifoMatrixCIdx_i_5_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoMatrixCIdx_i_5_V \
    op interface \
    ports { fifoMatrixCIdx_i_5_V_dout { I 16 vector } fifoMatrixCIdx_i_5_V_empty_n { I 1 bit } fifoMatrixCIdx_i_5_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name fifoCalcMatrixC_i_5_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoCalcMatrixC_i_5_V \
    op interface \
    ports { fifoCalcMatrixC_i_5_V_dout { I 32 vector } fifoCalcMatrixC_i_5_V_empty_n { I 1 bit } fifoCalcMatrixC_i_5_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name fifoMatrixCIdx_i_4_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoMatrixCIdx_i_4_V \
    op interface \
    ports { fifoMatrixCIdx_i_4_V_dout { I 16 vector } fifoMatrixCIdx_i_4_V_empty_n { I 1 bit } fifoMatrixCIdx_i_4_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name fifoCalcMatrixC_i_4_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoCalcMatrixC_i_4_V \
    op interface \
    ports { fifoCalcMatrixC_i_4_V_dout { I 32 vector } fifoCalcMatrixC_i_4_V_empty_n { I 1 bit } fifoCalcMatrixC_i_4_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 15 \
    name fifoMatrixCIdx_i_3_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoMatrixCIdx_i_3_V \
    op interface \
    ports { fifoMatrixCIdx_i_3_V_dout { I 16 vector } fifoMatrixCIdx_i_3_V_empty_n { I 1 bit } fifoMatrixCIdx_i_3_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 16 \
    name fifoCalcMatrixC_i_3_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoCalcMatrixC_i_3_V \
    op interface \
    ports { fifoCalcMatrixC_i_3_V_dout { I 32 vector } fifoCalcMatrixC_i_3_V_empty_n { I 1 bit } fifoCalcMatrixC_i_3_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 17 \
    name fifoMatrixCIdx_i_2_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoMatrixCIdx_i_2_V \
    op interface \
    ports { fifoMatrixCIdx_i_2_V_dout { I 16 vector } fifoMatrixCIdx_i_2_V_empty_n { I 1 bit } fifoMatrixCIdx_i_2_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 18 \
    name fifoCalcMatrixC_i_2_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoCalcMatrixC_i_2_V \
    op interface \
    ports { fifoCalcMatrixC_i_2_V_dout { I 32 vector } fifoCalcMatrixC_i_2_V_empty_n { I 1 bit } fifoCalcMatrixC_i_2_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 19 \
    name fifoMatrixCIdx_i_1_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoMatrixCIdx_i_1_V \
    op interface \
    ports { fifoMatrixCIdx_i_1_V_dout { I 16 vector } fifoMatrixCIdx_i_1_V_empty_n { I 1 bit } fifoMatrixCIdx_i_1_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 20 \
    name fifoCalcMatrixC_i_1_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoCalcMatrixC_i_1_V \
    op interface \
    ports { fifoCalcMatrixC_i_1_V_dout { I 32 vector } fifoCalcMatrixC_i_1_V_empty_n { I 1 bit } fifoCalcMatrixC_i_1_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name fifoMatrixCIdx_i_0_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoMatrixCIdx_i_0_V \
    op interface \
    ports { fifoMatrixCIdx_i_0_V_dout { I 16 vector } fifoMatrixCIdx_i_0_V_empty_n { I 1 bit } fifoMatrixCIdx_i_0_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name fifoCalcMatrixC_i_0_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoCalcMatrixC_i_0_V \
    op interface \
    ports { fifoCalcMatrixC_i_0_V_dout { I 32 vector } fifoCalcMatrixC_i_0_V_empty_n { I 1 bit } fifoCalcMatrixC_i_0_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName sort_C_flow_control_loop_pipe_sequential_init_U
set CompName sort_C_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix sort_C_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


