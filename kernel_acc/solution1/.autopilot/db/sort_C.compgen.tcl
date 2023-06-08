# This script segment is generated automatically by AutoPilot

set id 31
set name sort_C_mux_83_32_1_1
set corename simcore_mux
set op mux
set stage_num 1
set din0_width 32
set din0_signed 0
set din1_width 32
set din1_signed 0
set din2_width 32
set din2_signed 0
set din3_width 32
set din3_signed 0
set din4_width 32
set din4_signed 0
set din5_width 32
set din5_signed 0
set din6_width 32
set din6_signed 0
set din7_width 32
set din7_signed 0
set din8_width 3
set din8_signed 0
set dout_width 32
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mux} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set op mux
set corename Multiplexer
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_pipemux] == "::AESL_LIB_VIRTEX::xil_gen_pipemux"} {
eval "::AESL_LIB_VIRTEX::xil_gen_pipemux { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    din0_width ${din0_width} \
    din0_signed ${din0_signed} \
    din1_width ${din1_width} \
    din1_signed ${din1_signed} \
    din2_width ${din2_width} \
    din2_signed ${din2_signed} \
    din3_width ${din3_width} \
    din3_signed ${din3_signed} \
    din4_width ${din4_width} \
    din4_signed ${din4_signed} \
    din5_width ${din5_width} \
    din5_signed ${din5_signed} \
    din6_width ${din6_width} \
    din6_signed ${din6_signed} \
    din7_width ${din7_width} \
    din7_signed ${din7_signed} \
    din8_width ${din8_width} \
    din8_signed ${din8_signed} \
    dout_width ${dout_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_pipemux, check your platform lib"
}
}


# Memory (RAM/ROM)  definition:
set ID 33
set hasByteEnable 0
set MemName sort_C_matrixC_buffer_V_0
set CoreName ap_simcore_mem
set PortList { 2 3 }
set DataWd 32
set AddrRange 8
set AddrWd 3
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

set axilite_register_dict [dict create]
# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 34 \
    name lenEdgeListPtr \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_lenEdgeListPtr \
    op interface \
    ports { lenEdgeListPtr { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 35 \
    name fifoEdgeListPtr_i_V \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoEdgeListPtr_i_V \
    op interface \
    ports { fifoEdgeListPtr_i_V_dout { I 32 vector } fifoEdgeListPtr_i_V_empty_n { I 1 bit } fifoEdgeListPtr_i_V_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 36 \
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
    id 37 \
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
    id 38 \
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
    id 39 \
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
    id 40 \
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
    id 41 \
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
    id 42 \
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
    id 43 \
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
    id 44 \
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
    id 45 \
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
    id 46 \
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
    id 47 \
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
    id 48 \
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
    id 49 \
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
    id 50 \
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
    id 51 \
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
    id 52 \
    name fifoSortMatrixC_o_0_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoSortMatrixC_o_0_V \
    op interface \
    ports { fifoSortMatrixC_o_0_V_din { O 32 vector } fifoSortMatrixC_o_0_V_full_n { I 1 bit } fifoSortMatrixC_o_0_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 53 \
    name fifoSortMatrixC_o_1_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoSortMatrixC_o_1_V \
    op interface \
    ports { fifoSortMatrixC_o_1_V_din { O 32 vector } fifoSortMatrixC_o_1_V_full_n { I 1 bit } fifoSortMatrixC_o_1_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 54 \
    name fifoSortMatrixC_o_2_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoSortMatrixC_o_2_V \
    op interface \
    ports { fifoSortMatrixC_o_2_V_din { O 32 vector } fifoSortMatrixC_o_2_V_full_n { I 1 bit } fifoSortMatrixC_o_2_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 55 \
    name fifoSortMatrixC_o_3_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoSortMatrixC_o_3_V \
    op interface \
    ports { fifoSortMatrixC_o_3_V_din { O 32 vector } fifoSortMatrixC_o_3_V_full_n { I 1 bit } fifoSortMatrixC_o_3_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 56 \
    name fifoSortMatrixC_o_4_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoSortMatrixC_o_4_V \
    op interface \
    ports { fifoSortMatrixC_o_4_V_din { O 32 vector } fifoSortMatrixC_o_4_V_full_n { I 1 bit } fifoSortMatrixC_o_4_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 57 \
    name fifoSortMatrixC_o_5_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoSortMatrixC_o_5_V \
    op interface \
    ports { fifoSortMatrixC_o_5_V_din { O 32 vector } fifoSortMatrixC_o_5_V_full_n { I 1 bit } fifoSortMatrixC_o_5_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 58 \
    name fifoSortMatrixC_o_6_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoSortMatrixC_o_6_V \
    op interface \
    ports { fifoSortMatrixC_o_6_V_din { O 32 vector } fifoSortMatrixC_o_6_V_full_n { I 1 bit } fifoSortMatrixC_o_6_V_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 59 \
    name fifoSortMatrixC_o_7_V \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fifoSortMatrixC_o_7_V \
    op interface \
    ports { fifoSortMatrixC_o_7_V_din { O 32 vector } fifoSortMatrixC_o_7_V_full_n { I 1 bit } fifoSortMatrixC_o_7_V_write { O 1 bit } } \
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


