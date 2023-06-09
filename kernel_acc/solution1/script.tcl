############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
############################################################
open_project kernel_acc
set_top krnl_sparse_matrix_acc
add_files kernel.cpp
add_files kernel.h
add_files -tb kernel_test.cpp
open_solution "solution1" -flow_target vivado
set_part {xczu7ev-ffvc1156-2-e}
create_clock -period 10 -name default
config_compile -pipeline_loops 0
config_export -vivado_clock 10
source "./kernel_acc/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -flow syn -rtl verilog -format ip_catalog
