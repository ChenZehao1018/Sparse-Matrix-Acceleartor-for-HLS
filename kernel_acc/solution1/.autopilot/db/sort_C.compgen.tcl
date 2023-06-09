# This script segment is generated automatically by AutoPilot

set name krnl_sparse_matrix_acc_fpext_32ns_64_2_no_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fpext} IMPL {auto} LATENCY 1 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 39 \
    name lenEdgeListPtr \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_lenEdgeListPtr \
    op interface \
    ports { lenEdgeListPtr_dout { I 32 vector } lenEdgeListPtr_empty_n { I 1 bit } lenEdgeListPtr_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 40 \
    name fifoEdgeListPtr_calC15 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoEdgeListPtr_calC15 \
    op interface \
    ports { fifoEdgeListPtr_calC15_dout { I 32 vector } fifoEdgeListPtr_calC15_empty_n { I 1 bit } fifoEdgeListPtr_calC15_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 41 \
    name fifoMatrixCIdx_i_0_0_0_0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoMatrixCIdx_i_0_0_0_0 \
    op interface \
    ports { fifoMatrixCIdx_i_0_0_0_0_dout { I 16 vector } fifoMatrixCIdx_i_0_0_0_0_empty_n { I 1 bit } fifoMatrixCIdx_i_0_0_0_0_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 42 \
    name fifoMatrixCIdx_i_0_0_0_01 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoMatrixCIdx_i_0_0_0_01 \
    op interface \
    ports { fifoMatrixCIdx_i_0_0_0_01_dout { I 16 vector } fifoMatrixCIdx_i_0_0_0_01_empty_n { I 1 bit } fifoMatrixCIdx_i_0_0_0_01_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 43 \
    name fifoCalcMatrixC_i_0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoCalcMatrixC_i_0 \
    op interface \
    ports { fifoCalcMatrixC_i_0_dout { I 32 vector } fifoCalcMatrixC_i_0_empty_n { I 1 bit } fifoCalcMatrixC_i_0_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 44 \
    name fifoCalcMatrixC_i_02 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoCalcMatrixC_i_02 \
    op interface \
    ports { fifoCalcMatrixC_i_02_dout { I 32 vector } fifoCalcMatrixC_i_02_empty_n { I 1 bit } fifoCalcMatrixC_i_02_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 45 \
    name fifoSortMatrixC_o_0 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoSortMatrixC_o_0 \
    op interface \
    ports { fifoSortMatrixC_o_0_din { O 32 vector } fifoSortMatrixC_o_0_full_n { I 1 bit } fifoSortMatrixC_o_0_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 46 \
    name fifoSortMatrixC_o_03 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoSortMatrixC_o_03 \
    op interface \
    ports { fifoSortMatrixC_o_03_din { O 32 vector } fifoSortMatrixC_o_03_full_n { I 1 bit } fifoSortMatrixC_o_03_write { O 1 bit } } \
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
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
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


