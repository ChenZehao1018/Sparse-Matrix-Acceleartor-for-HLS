# This script segment is generated automatically by AutoPilot

set name krnl_sparse_matrix_acc_fmul_32ns_32ns_32_3_max_dsp_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {fmul} IMPL {maxdsp} LATENCY 2 ALLOW_PRAGMA 1
}


# Memory (RAM/ROM)  definition:
set ID 25
set hasByteEnable 0
set MemName krnl_sparse_matrix_acc_calc_C_matrixB_buffer
set CoreName ap_simcore_mem
set PortList { 2 3 }
set DataWd 32
set AddrRange 16
set AddrWd 4
set impl_style auto
set TrueReset 0
set IsROM 0
set ROMData { }
set HasInitializer 0
set Initializer $ROMData
set NumOfStage 2
set DelayBudget 0.677
set ClkPeriod 10
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $MemName BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


set CoreName RAM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_RAM] == "::AESL_LIB_VIRTEX::xil_gen_RAM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_RAM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_RAM, check your platform lib"
  }
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
    id 26 \
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
    id 27 \
    name fifoEdgeListPtr11 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoEdgeListPtr11 \
    op interface \
    ports { fifoEdgeListPtr11_dout { I 32 vector } fifoEdgeListPtr11_empty_n { I 1 bit } fifoEdgeListPtr11_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name fifoMatrixAIdx12 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoMatrixAIdx12 \
    op interface \
    ports { fifoMatrixAIdx12_dout { I 32 vector } fifoMatrixAIdx12_empty_n { I 1 bit } fifoMatrixAIdx12_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name fifoMatrixA13 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoMatrixA13 \
    op interface \
    ports { fifoMatrixA13_dout { I 32 vector } fifoMatrixA13_empty_n { I 1 bit } fifoMatrixA13_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name fifoMatrixB14 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoMatrixB14 \
    op interface \
    ports { fifoMatrixB14_dout { I 32 vector } fifoMatrixB14_empty_n { I 1 bit } fifoMatrixB14_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name fifoEdgeListPtr_calC15 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoEdgeListPtr_calC15 \
    op interface \
    ports { fifoEdgeListPtr_calC15_din { O 32 vector } fifoEdgeListPtr_calC15_full_n { I 1 bit } fifoEdgeListPtr_calC15_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 32 \
    name fifoMatrixCIdx_o_0_0_0_0 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoMatrixCIdx_o_0_0_0_0 \
    op interface \
    ports { fifoMatrixCIdx_o_0_0_0_0_din { O 16 vector } fifoMatrixCIdx_o_0_0_0_0_full_n { I 1 bit } fifoMatrixCIdx_o_0_0_0_0_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name fifoMatrixCIdx_o_0_0_0_01 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoMatrixCIdx_o_0_0_0_01 \
    op interface \
    ports { fifoMatrixCIdx_o_0_0_0_01_din { O 16 vector } fifoMatrixCIdx_o_0_0_0_01_full_n { I 1 bit } fifoMatrixCIdx_o_0_0_0_01_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 34 \
    name fifoCalcMatrixC_o_0 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoCalcMatrixC_o_0 \
    op interface \
    ports { fifoCalcMatrixC_o_0_din { O 32 vector } fifoCalcMatrixC_o_0_full_n { I 1 bit } fifoCalcMatrixC_o_0_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 35 \
    name fifoCalcMatrixC_o_02 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoCalcMatrixC_o_02 \
    op interface \
    ports { fifoCalcMatrixC_o_02_din { O 32 vector } fifoCalcMatrixC_o_02_full_n { I 1 bit } fifoCalcMatrixC_o_02_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 36 \
    name lenEdgeListPtr_c \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lenEdgeListPtr_c \
    op interface \
    ports { lenEdgeListPtr_c_din { O 32 vector } lenEdgeListPtr_c_full_n { I 1 bit } lenEdgeListPtr_c_write { O 1 bit } } \
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


