#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_lenEdgeListPtr "../tv/cdatafile/c.sort_C.autotvin_lenEdgeListPtr.dat"
#define AUTOTB_TVOUT_lenEdgeListPtr "../tv/cdatafile/c.sort_C.autotvout_lenEdgeListPtr.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoEdgeListPtr_i_V "../tv/cdatafile/c.sort_C.autotvin_fifoEdgeListPtr_i_V.dat"
#define AUTOTB_TVOUT_fifoEdgeListPtr_i_V "../tv/cdatafile/c.sort_C.autotvout_fifoEdgeListPtr_i_V.dat"
#define WRAPC_STREAM_SIZE_IN_fifoEdgeListPtr_i_V "../tv/stream_size/stream_size_in_fifoEdgeListPtr_i_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_fifoEdgeListPtr_i_V "../tv/stream_size/stream_ingress_status_fifoEdgeListPtr_i_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoMatrixCIdx_i_0_V "../tv/cdatafile/c.sort_C.autotvin_fifoMatrixCIdx_i_0_V.dat"
#define AUTOTB_TVOUT_fifoMatrixCIdx_i_0_V "../tv/cdatafile/c.sort_C.autotvout_fifoMatrixCIdx_i_0_V.dat"
#define WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_0_V "../tv/stream_size/stream_size_in_fifoMatrixCIdx_i_0_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_0_V "../tv/stream_size/stream_ingress_status_fifoMatrixCIdx_i_0_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoMatrixCIdx_i_1_V "../tv/cdatafile/c.sort_C.autotvin_fifoMatrixCIdx_i_1_V.dat"
#define AUTOTB_TVOUT_fifoMatrixCIdx_i_1_V "../tv/cdatafile/c.sort_C.autotvout_fifoMatrixCIdx_i_1_V.dat"
#define WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_1_V "../tv/stream_size/stream_size_in_fifoMatrixCIdx_i_1_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_1_V "../tv/stream_size/stream_ingress_status_fifoMatrixCIdx_i_1_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoMatrixCIdx_i_2_V "../tv/cdatafile/c.sort_C.autotvin_fifoMatrixCIdx_i_2_V.dat"
#define AUTOTB_TVOUT_fifoMatrixCIdx_i_2_V "../tv/cdatafile/c.sort_C.autotvout_fifoMatrixCIdx_i_2_V.dat"
#define WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_2_V "../tv/stream_size/stream_size_in_fifoMatrixCIdx_i_2_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_2_V "../tv/stream_size/stream_ingress_status_fifoMatrixCIdx_i_2_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoMatrixCIdx_i_3_V "../tv/cdatafile/c.sort_C.autotvin_fifoMatrixCIdx_i_3_V.dat"
#define AUTOTB_TVOUT_fifoMatrixCIdx_i_3_V "../tv/cdatafile/c.sort_C.autotvout_fifoMatrixCIdx_i_3_V.dat"
#define WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_3_V "../tv/stream_size/stream_size_in_fifoMatrixCIdx_i_3_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_3_V "../tv/stream_size/stream_ingress_status_fifoMatrixCIdx_i_3_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoMatrixCIdx_i_4_V "../tv/cdatafile/c.sort_C.autotvin_fifoMatrixCIdx_i_4_V.dat"
#define AUTOTB_TVOUT_fifoMatrixCIdx_i_4_V "../tv/cdatafile/c.sort_C.autotvout_fifoMatrixCIdx_i_4_V.dat"
#define WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_4_V "../tv/stream_size/stream_size_in_fifoMatrixCIdx_i_4_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_4_V "../tv/stream_size/stream_ingress_status_fifoMatrixCIdx_i_4_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoMatrixCIdx_i_5_V "../tv/cdatafile/c.sort_C.autotvin_fifoMatrixCIdx_i_5_V.dat"
#define AUTOTB_TVOUT_fifoMatrixCIdx_i_5_V "../tv/cdatafile/c.sort_C.autotvout_fifoMatrixCIdx_i_5_V.dat"
#define WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_5_V "../tv/stream_size/stream_size_in_fifoMatrixCIdx_i_5_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_5_V "../tv/stream_size/stream_ingress_status_fifoMatrixCIdx_i_5_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoMatrixCIdx_i_6_V "../tv/cdatafile/c.sort_C.autotvin_fifoMatrixCIdx_i_6_V.dat"
#define AUTOTB_TVOUT_fifoMatrixCIdx_i_6_V "../tv/cdatafile/c.sort_C.autotvout_fifoMatrixCIdx_i_6_V.dat"
#define WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_6_V "../tv/stream_size/stream_size_in_fifoMatrixCIdx_i_6_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_6_V "../tv/stream_size/stream_ingress_status_fifoMatrixCIdx_i_6_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoMatrixCIdx_i_7_V "../tv/cdatafile/c.sort_C.autotvin_fifoMatrixCIdx_i_7_V.dat"
#define AUTOTB_TVOUT_fifoMatrixCIdx_i_7_V "../tv/cdatafile/c.sort_C.autotvout_fifoMatrixCIdx_i_7_V.dat"
#define WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_7_V "../tv/stream_size/stream_size_in_fifoMatrixCIdx_i_7_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_7_V "../tv/stream_size/stream_ingress_status_fifoMatrixCIdx_i_7_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoCalcMatrixC_i_0_V "../tv/cdatafile/c.sort_C.autotvin_fifoCalcMatrixC_i_0_V.dat"
#define AUTOTB_TVOUT_fifoCalcMatrixC_i_0_V "../tv/cdatafile/c.sort_C.autotvout_fifoCalcMatrixC_i_0_V.dat"
#define WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_0_V "../tv/stream_size/stream_size_in_fifoCalcMatrixC_i_0_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_0_V "../tv/stream_size/stream_ingress_status_fifoCalcMatrixC_i_0_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoCalcMatrixC_i_1_V "../tv/cdatafile/c.sort_C.autotvin_fifoCalcMatrixC_i_1_V.dat"
#define AUTOTB_TVOUT_fifoCalcMatrixC_i_1_V "../tv/cdatafile/c.sort_C.autotvout_fifoCalcMatrixC_i_1_V.dat"
#define WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_1_V "../tv/stream_size/stream_size_in_fifoCalcMatrixC_i_1_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_1_V "../tv/stream_size/stream_ingress_status_fifoCalcMatrixC_i_1_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoCalcMatrixC_i_2_V "../tv/cdatafile/c.sort_C.autotvin_fifoCalcMatrixC_i_2_V.dat"
#define AUTOTB_TVOUT_fifoCalcMatrixC_i_2_V "../tv/cdatafile/c.sort_C.autotvout_fifoCalcMatrixC_i_2_V.dat"
#define WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_2_V "../tv/stream_size/stream_size_in_fifoCalcMatrixC_i_2_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_2_V "../tv/stream_size/stream_ingress_status_fifoCalcMatrixC_i_2_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoCalcMatrixC_i_3_V "../tv/cdatafile/c.sort_C.autotvin_fifoCalcMatrixC_i_3_V.dat"
#define AUTOTB_TVOUT_fifoCalcMatrixC_i_3_V "../tv/cdatafile/c.sort_C.autotvout_fifoCalcMatrixC_i_3_V.dat"
#define WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_3_V "../tv/stream_size/stream_size_in_fifoCalcMatrixC_i_3_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_3_V "../tv/stream_size/stream_ingress_status_fifoCalcMatrixC_i_3_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoCalcMatrixC_i_4_V "../tv/cdatafile/c.sort_C.autotvin_fifoCalcMatrixC_i_4_V.dat"
#define AUTOTB_TVOUT_fifoCalcMatrixC_i_4_V "../tv/cdatafile/c.sort_C.autotvout_fifoCalcMatrixC_i_4_V.dat"
#define WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_4_V "../tv/stream_size/stream_size_in_fifoCalcMatrixC_i_4_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_4_V "../tv/stream_size/stream_ingress_status_fifoCalcMatrixC_i_4_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoCalcMatrixC_i_5_V "../tv/cdatafile/c.sort_C.autotvin_fifoCalcMatrixC_i_5_V.dat"
#define AUTOTB_TVOUT_fifoCalcMatrixC_i_5_V "../tv/cdatafile/c.sort_C.autotvout_fifoCalcMatrixC_i_5_V.dat"
#define WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_5_V "../tv/stream_size/stream_size_in_fifoCalcMatrixC_i_5_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_5_V "../tv/stream_size/stream_ingress_status_fifoCalcMatrixC_i_5_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoCalcMatrixC_i_6_V "../tv/cdatafile/c.sort_C.autotvin_fifoCalcMatrixC_i_6_V.dat"
#define AUTOTB_TVOUT_fifoCalcMatrixC_i_6_V "../tv/cdatafile/c.sort_C.autotvout_fifoCalcMatrixC_i_6_V.dat"
#define WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_6_V "../tv/stream_size/stream_size_in_fifoCalcMatrixC_i_6_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_6_V "../tv/stream_size/stream_ingress_status_fifoCalcMatrixC_i_6_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoCalcMatrixC_i_7_V "../tv/cdatafile/c.sort_C.autotvin_fifoCalcMatrixC_i_7_V.dat"
#define AUTOTB_TVOUT_fifoCalcMatrixC_i_7_V "../tv/cdatafile/c.sort_C.autotvout_fifoCalcMatrixC_i_7_V.dat"
#define WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_7_V "../tv/stream_size/stream_size_in_fifoCalcMatrixC_i_7_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_7_V "../tv/stream_size/stream_ingress_status_fifoCalcMatrixC_i_7_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoSortMatrixC_o_0_V "../tv/cdatafile/c.sort_C.autotvin_fifoSortMatrixC_o_0_V.dat"
#define AUTOTB_TVOUT_fifoSortMatrixC_o_0_V "../tv/cdatafile/c.sort_C.autotvout_fifoSortMatrixC_o_0_V.dat"
#define WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_0_V "../tv/stream_size/stream_size_out_fifoSortMatrixC_o_0_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_fifoSortMatrixC_o_0_V "../tv/stream_size/stream_egress_status_fifoSortMatrixC_o_0_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoSortMatrixC_o_1_V "../tv/cdatafile/c.sort_C.autotvin_fifoSortMatrixC_o_1_V.dat"
#define AUTOTB_TVOUT_fifoSortMatrixC_o_1_V "../tv/cdatafile/c.sort_C.autotvout_fifoSortMatrixC_o_1_V.dat"
#define WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_1_V "../tv/stream_size/stream_size_out_fifoSortMatrixC_o_1_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_fifoSortMatrixC_o_1_V "../tv/stream_size/stream_egress_status_fifoSortMatrixC_o_1_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoSortMatrixC_o_2_V "../tv/cdatafile/c.sort_C.autotvin_fifoSortMatrixC_o_2_V.dat"
#define AUTOTB_TVOUT_fifoSortMatrixC_o_2_V "../tv/cdatafile/c.sort_C.autotvout_fifoSortMatrixC_o_2_V.dat"
#define WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_2_V "../tv/stream_size/stream_size_out_fifoSortMatrixC_o_2_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_fifoSortMatrixC_o_2_V "../tv/stream_size/stream_egress_status_fifoSortMatrixC_o_2_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoSortMatrixC_o_3_V "../tv/cdatafile/c.sort_C.autotvin_fifoSortMatrixC_o_3_V.dat"
#define AUTOTB_TVOUT_fifoSortMatrixC_o_3_V "../tv/cdatafile/c.sort_C.autotvout_fifoSortMatrixC_o_3_V.dat"
#define WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_3_V "../tv/stream_size/stream_size_out_fifoSortMatrixC_o_3_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_fifoSortMatrixC_o_3_V "../tv/stream_size/stream_egress_status_fifoSortMatrixC_o_3_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoSortMatrixC_o_4_V "../tv/cdatafile/c.sort_C.autotvin_fifoSortMatrixC_o_4_V.dat"
#define AUTOTB_TVOUT_fifoSortMatrixC_o_4_V "../tv/cdatafile/c.sort_C.autotvout_fifoSortMatrixC_o_4_V.dat"
#define WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_4_V "../tv/stream_size/stream_size_out_fifoSortMatrixC_o_4_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_fifoSortMatrixC_o_4_V "../tv/stream_size/stream_egress_status_fifoSortMatrixC_o_4_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoSortMatrixC_o_5_V "../tv/cdatafile/c.sort_C.autotvin_fifoSortMatrixC_o_5_V.dat"
#define AUTOTB_TVOUT_fifoSortMatrixC_o_5_V "../tv/cdatafile/c.sort_C.autotvout_fifoSortMatrixC_o_5_V.dat"
#define WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_5_V "../tv/stream_size/stream_size_out_fifoSortMatrixC_o_5_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_fifoSortMatrixC_o_5_V "../tv/stream_size/stream_egress_status_fifoSortMatrixC_o_5_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoSortMatrixC_o_6_V "../tv/cdatafile/c.sort_C.autotvin_fifoSortMatrixC_o_6_V.dat"
#define AUTOTB_TVOUT_fifoSortMatrixC_o_6_V "../tv/cdatafile/c.sort_C.autotvout_fifoSortMatrixC_o_6_V.dat"
#define WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_6_V "../tv/stream_size/stream_size_out_fifoSortMatrixC_o_6_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_fifoSortMatrixC_o_6_V "../tv/stream_size/stream_egress_status_fifoSortMatrixC_o_6_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_fifoSortMatrixC_o_7_V "../tv/cdatafile/c.sort_C.autotvin_fifoSortMatrixC_o_7_V.dat"
#define AUTOTB_TVOUT_fifoSortMatrixC_o_7_V "../tv/cdatafile/c.sort_C.autotvout_fifoSortMatrixC_o_7_V.dat"
#define WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_7_V "../tv/stream_size/stream_size_out_fifoSortMatrixC_o_7_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_fifoSortMatrixC_o_7_V "../tv/stream_size/stream_egress_status_fifoSortMatrixC_o_7_V.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_lenEdgeListPtr "../tv/rtldatafile/rtl.sort_C.autotvout_lenEdgeListPtr.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoEdgeListPtr_i_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoEdgeListPtr_i_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoMatrixCIdx_i_0_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoMatrixCIdx_i_0_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoMatrixCIdx_i_1_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoMatrixCIdx_i_1_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoMatrixCIdx_i_2_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoMatrixCIdx_i_2_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoMatrixCIdx_i_3_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoMatrixCIdx_i_3_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoMatrixCIdx_i_4_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoMatrixCIdx_i_4_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoMatrixCIdx_i_5_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoMatrixCIdx_i_5_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoMatrixCIdx_i_6_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoMatrixCIdx_i_6_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoMatrixCIdx_i_7_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoMatrixCIdx_i_7_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoCalcMatrixC_i_0_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoCalcMatrixC_i_0_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoCalcMatrixC_i_1_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoCalcMatrixC_i_1_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoCalcMatrixC_i_2_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoCalcMatrixC_i_2_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoCalcMatrixC_i_3_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoCalcMatrixC_i_3_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoCalcMatrixC_i_4_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoCalcMatrixC_i_4_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoCalcMatrixC_i_5_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoCalcMatrixC_i_5_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoCalcMatrixC_i_6_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoCalcMatrixC_i_6_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoCalcMatrixC_i_7_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoCalcMatrixC_i_7_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoSortMatrixC_o_0_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoSortMatrixC_o_0_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoSortMatrixC_o_1_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoSortMatrixC_o_1_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoSortMatrixC_o_2_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoSortMatrixC_o_2_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoSortMatrixC_o_3_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoSortMatrixC_o_3_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoSortMatrixC_o_4_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoSortMatrixC_o_4_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoSortMatrixC_o_5_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoSortMatrixC_o_5_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoSortMatrixC_o_6_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoSortMatrixC_o_6_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_fifoSortMatrixC_o_7_V "../tv/rtldatafile/rtl.sort_C.autotvout_fifoSortMatrixC_o_7_V.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  lenEdgeListPtr_depth = 0;
  fifoEdgeListPtr_i_V_depth = 0;
  fifoMatrixCIdx_i_0_V_depth = 0;
  fifoMatrixCIdx_i_1_V_depth = 0;
  fifoMatrixCIdx_i_2_V_depth = 0;
  fifoMatrixCIdx_i_3_V_depth = 0;
  fifoMatrixCIdx_i_4_V_depth = 0;
  fifoMatrixCIdx_i_5_V_depth = 0;
  fifoMatrixCIdx_i_6_V_depth = 0;
  fifoMatrixCIdx_i_7_V_depth = 0;
  fifoCalcMatrixC_i_0_V_depth = 0;
  fifoCalcMatrixC_i_1_V_depth = 0;
  fifoCalcMatrixC_i_2_V_depth = 0;
  fifoCalcMatrixC_i_3_V_depth = 0;
  fifoCalcMatrixC_i_4_V_depth = 0;
  fifoCalcMatrixC_i_5_V_depth = 0;
  fifoCalcMatrixC_i_6_V_depth = 0;
  fifoCalcMatrixC_i_7_V_depth = 0;
  fifoSortMatrixC_o_0_V_depth = 0;
  fifoSortMatrixC_o_1_V_depth = 0;
  fifoSortMatrixC_o_2_V_depth = 0;
  fifoSortMatrixC_o_3_V_depth = 0;
  fifoSortMatrixC_o_4_V_depth = 0;
  fifoSortMatrixC_o_5_V_depth = 0;
  fifoSortMatrixC_o_6_V_depth = 0;
  fifoSortMatrixC_o_7_V_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{lenEdgeListPtr " << lenEdgeListPtr_depth << "}\n";
  total_list << "{fifoEdgeListPtr_i_V " << fifoEdgeListPtr_i_V_depth << "}\n";
  total_list << "{fifoMatrixCIdx_i_0_V " << fifoMatrixCIdx_i_0_V_depth << "}\n";
  total_list << "{fifoMatrixCIdx_i_1_V " << fifoMatrixCIdx_i_1_V_depth << "}\n";
  total_list << "{fifoMatrixCIdx_i_2_V " << fifoMatrixCIdx_i_2_V_depth << "}\n";
  total_list << "{fifoMatrixCIdx_i_3_V " << fifoMatrixCIdx_i_3_V_depth << "}\n";
  total_list << "{fifoMatrixCIdx_i_4_V " << fifoMatrixCIdx_i_4_V_depth << "}\n";
  total_list << "{fifoMatrixCIdx_i_5_V " << fifoMatrixCIdx_i_5_V_depth << "}\n";
  total_list << "{fifoMatrixCIdx_i_6_V " << fifoMatrixCIdx_i_6_V_depth << "}\n";
  total_list << "{fifoMatrixCIdx_i_7_V " << fifoMatrixCIdx_i_7_V_depth << "}\n";
  total_list << "{fifoCalcMatrixC_i_0_V " << fifoCalcMatrixC_i_0_V_depth << "}\n";
  total_list << "{fifoCalcMatrixC_i_1_V " << fifoCalcMatrixC_i_1_V_depth << "}\n";
  total_list << "{fifoCalcMatrixC_i_2_V " << fifoCalcMatrixC_i_2_V_depth << "}\n";
  total_list << "{fifoCalcMatrixC_i_3_V " << fifoCalcMatrixC_i_3_V_depth << "}\n";
  total_list << "{fifoCalcMatrixC_i_4_V " << fifoCalcMatrixC_i_4_V_depth << "}\n";
  total_list << "{fifoCalcMatrixC_i_5_V " << fifoCalcMatrixC_i_5_V_depth << "}\n";
  total_list << "{fifoCalcMatrixC_i_6_V " << fifoCalcMatrixC_i_6_V_depth << "}\n";
  total_list << "{fifoCalcMatrixC_i_7_V " << fifoCalcMatrixC_i_7_V_depth << "}\n";
  total_list << "{fifoSortMatrixC_o_0_V " << fifoSortMatrixC_o_0_V_depth << "}\n";
  total_list << "{fifoSortMatrixC_o_1_V " << fifoSortMatrixC_o_1_V_depth << "}\n";
  total_list << "{fifoSortMatrixC_o_2_V " << fifoSortMatrixC_o_2_V_depth << "}\n";
  total_list << "{fifoSortMatrixC_o_3_V " << fifoSortMatrixC_o_3_V_depth << "}\n";
  total_list << "{fifoSortMatrixC_o_4_V " << fifoSortMatrixC_o_4_V_depth << "}\n";
  total_list << "{fifoSortMatrixC_o_5_V " << fifoSortMatrixC_o_5_V_depth << "}\n";
  total_list << "{fifoSortMatrixC_o_6_V " << fifoSortMatrixC_o_6_V_depth << "}\n";
  total_list << "{fifoSortMatrixC_o_7_V " << fifoSortMatrixC_o_7_V_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int lenEdgeListPtr_depth;
    int fifoEdgeListPtr_i_V_depth;
    int fifoMatrixCIdx_i_0_V_depth;
    int fifoMatrixCIdx_i_1_V_depth;
    int fifoMatrixCIdx_i_2_V_depth;
    int fifoMatrixCIdx_i_3_V_depth;
    int fifoMatrixCIdx_i_4_V_depth;
    int fifoMatrixCIdx_i_5_V_depth;
    int fifoMatrixCIdx_i_6_V_depth;
    int fifoMatrixCIdx_i_7_V_depth;
    int fifoCalcMatrixC_i_0_V_depth;
    int fifoCalcMatrixC_i_1_V_depth;
    int fifoCalcMatrixC_i_2_V_depth;
    int fifoCalcMatrixC_i_3_V_depth;
    int fifoCalcMatrixC_i_4_V_depth;
    int fifoCalcMatrixC_i_5_V_depth;
    int fifoCalcMatrixC_i_6_V_depth;
    int fifoCalcMatrixC_i_7_V_depth;
    int fifoSortMatrixC_o_0_V_depth;
    int fifoSortMatrixC_o_1_V_depth;
    int fifoSortMatrixC_o_2_V_depth;
    int fifoSortMatrixC_o_3_V_depth;
    int fifoSortMatrixC_o_4_V_depth;
    int fifoSortMatrixC_o_5_V_depth;
    int fifoSortMatrixC_o_6_V_depth;
    int fifoSortMatrixC_o_7_V_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
struct __cosim_s4__ { char data[4]; };
extern "C" void sort_C_hw_stub_wrapper(int, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_sort_C_hw(int __xlx_apatb_param_lenEdgeListPtr, volatile void * __xlx_apatb_param_fifoEdgeListPtr_i, volatile void * __xlx_apatb_param_fifoMatrixCIdx_i_0, volatile void * __xlx_apatb_param_fifoMatrixCIdx_i_1, volatile void * __xlx_apatb_param_fifoMatrixCIdx_i_2, volatile void * __xlx_apatb_param_fifoMatrixCIdx_i_3, volatile void * __xlx_apatb_param_fifoMatrixCIdx_i_4, volatile void * __xlx_apatb_param_fifoMatrixCIdx_i_5, volatile void * __xlx_apatb_param_fifoMatrixCIdx_i_6, volatile void * __xlx_apatb_param_fifoMatrixCIdx_i_7, volatile void * __xlx_apatb_param_fifoCalcMatrixC_i_0, volatile void * __xlx_apatb_param_fifoCalcMatrixC_i_1, volatile void * __xlx_apatb_param_fifoCalcMatrixC_i_2, volatile void * __xlx_apatb_param_fifoCalcMatrixC_i_3, volatile void * __xlx_apatb_param_fifoCalcMatrixC_i_4, volatile void * __xlx_apatb_param_fifoCalcMatrixC_i_5, volatile void * __xlx_apatb_param_fifoCalcMatrixC_i_6, volatile void * __xlx_apatb_param_fifoCalcMatrixC_i_7, volatile void * __xlx_apatb_param_fifoSortMatrixC_o_0, volatile void * __xlx_apatb_param_fifoSortMatrixC_o_1, volatile void * __xlx_apatb_param_fifoSortMatrixC_o_2, volatile void * __xlx_apatb_param_fifoSortMatrixC_o_3, volatile void * __xlx_apatb_param_fifoSortMatrixC_o_4, volatile void * __xlx_apatb_param_fifoSortMatrixC_o_5, volatile void * __xlx_apatb_param_fifoSortMatrixC_o_6, volatile void * __xlx_apatb_param_fifoSortMatrixC_o_7) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;long __xlx_apatb_param_fifoEdgeListPtr_i_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_fifoEdgeListPtr_i_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoEdgeListPtr_i_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_fifoEdgeListPtr_i_V_stream_buf_final_size; ++i)((hls::stream<__cosim_s4__>*)__xlx_apatb_param_fifoEdgeListPtr_i)->read();
long __xlx_apatb_param_fifoMatrixCIdx_i_0_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_0_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoMatrixCIdx_i_0_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_fifoMatrixCIdx_i_0_V_stream_buf_final_size; ++i)((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_0)->read();
long __xlx_apatb_param_fifoMatrixCIdx_i_1_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_1_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoMatrixCIdx_i_1_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_fifoMatrixCIdx_i_1_V_stream_buf_final_size; ++i)((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_1)->read();
long __xlx_apatb_param_fifoMatrixCIdx_i_2_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_2_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoMatrixCIdx_i_2_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_fifoMatrixCIdx_i_2_V_stream_buf_final_size; ++i)((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_2)->read();
long __xlx_apatb_param_fifoMatrixCIdx_i_3_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_3_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoMatrixCIdx_i_3_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_fifoMatrixCIdx_i_3_V_stream_buf_final_size; ++i)((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_3)->read();
long __xlx_apatb_param_fifoMatrixCIdx_i_4_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_4_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoMatrixCIdx_i_4_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_fifoMatrixCIdx_i_4_V_stream_buf_final_size; ++i)((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_4)->read();
long __xlx_apatb_param_fifoMatrixCIdx_i_5_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_5_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoMatrixCIdx_i_5_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_fifoMatrixCIdx_i_5_V_stream_buf_final_size; ++i)((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_5)->read();
long __xlx_apatb_param_fifoMatrixCIdx_i_6_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_6_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoMatrixCIdx_i_6_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_fifoMatrixCIdx_i_6_V_stream_buf_final_size; ++i)((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_6)->read();
long __xlx_apatb_param_fifoMatrixCIdx_i_7_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_7_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoMatrixCIdx_i_7_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_fifoMatrixCIdx_i_7_V_stream_buf_final_size; ++i)((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_7)->read();
long __xlx_apatb_param_fifoCalcMatrixC_i_0_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_0_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoCalcMatrixC_i_0_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_fifoCalcMatrixC_i_0_V_stream_buf_final_size; ++i)((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_0)->read();
long __xlx_apatb_param_fifoCalcMatrixC_i_1_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_1_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoCalcMatrixC_i_1_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_fifoCalcMatrixC_i_1_V_stream_buf_final_size; ++i)((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_1)->read();
long __xlx_apatb_param_fifoCalcMatrixC_i_2_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_2_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoCalcMatrixC_i_2_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_fifoCalcMatrixC_i_2_V_stream_buf_final_size; ++i)((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_2)->read();
long __xlx_apatb_param_fifoCalcMatrixC_i_3_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_3_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoCalcMatrixC_i_3_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_fifoCalcMatrixC_i_3_V_stream_buf_final_size; ++i)((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_3)->read();
long __xlx_apatb_param_fifoCalcMatrixC_i_4_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_4_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoCalcMatrixC_i_4_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_fifoCalcMatrixC_i_4_V_stream_buf_final_size; ++i)((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_4)->read();
long __xlx_apatb_param_fifoCalcMatrixC_i_5_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_5_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoCalcMatrixC_i_5_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_fifoCalcMatrixC_i_5_V_stream_buf_final_size; ++i)((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_5)->read();
long __xlx_apatb_param_fifoCalcMatrixC_i_6_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_6_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoCalcMatrixC_i_6_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_fifoCalcMatrixC_i_6_V_stream_buf_final_size; ++i)((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_6)->read();
long __xlx_apatb_param_fifoCalcMatrixC_i_7_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_7_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoCalcMatrixC_i_7_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_fifoCalcMatrixC_i_7_V_stream_buf_final_size; ++i)((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_7)->read();
long __xlx_apatb_param_fifoSortMatrixC_o_0_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_0_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoSortMatrixC_o_0_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_fifoSortMatrixC_o_0_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > fifoSortMatrixC_o_0_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "fifoSortMatrixC_o_0_V");
  
            // push token into output port buffer
            if (AESL_token != "") {
              fifoSortMatrixC_o_0_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
int xlx_stream_elt;
((char*)&xlx_stream_elt)[0*4+0] = fifoSortMatrixC_o_0_V_pc_buffer[j].range(7, 0).to_int64();
((char*)&xlx_stream_elt)[0*4+1] = fifoSortMatrixC_o_0_V_pc_buffer[j].range(15, 8).to_int64();
((char*)&xlx_stream_elt)[0*4+2] = fifoSortMatrixC_o_0_V_pc_buffer[j].range(23, 16).to_int64();
((char*)&xlx_stream_elt)[0*4+3] = fifoSortMatrixC_o_0_V_pc_buffer[j].range(31, 24).to_int64();
((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_0)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_fifoSortMatrixC_o_1_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_1_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoSortMatrixC_o_1_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_fifoSortMatrixC_o_1_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > fifoSortMatrixC_o_1_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "fifoSortMatrixC_o_1_V");
  
            // push token into output port buffer
            if (AESL_token != "") {
              fifoSortMatrixC_o_1_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
int xlx_stream_elt;
((char*)&xlx_stream_elt)[0*4+0] = fifoSortMatrixC_o_1_V_pc_buffer[j].range(7, 0).to_int64();
((char*)&xlx_stream_elt)[0*4+1] = fifoSortMatrixC_o_1_V_pc_buffer[j].range(15, 8).to_int64();
((char*)&xlx_stream_elt)[0*4+2] = fifoSortMatrixC_o_1_V_pc_buffer[j].range(23, 16).to_int64();
((char*)&xlx_stream_elt)[0*4+3] = fifoSortMatrixC_o_1_V_pc_buffer[j].range(31, 24).to_int64();
((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_1)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_fifoSortMatrixC_o_2_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_2_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoSortMatrixC_o_2_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_fifoSortMatrixC_o_2_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > fifoSortMatrixC_o_2_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "fifoSortMatrixC_o_2_V");
  
            // push token into output port buffer
            if (AESL_token != "") {
              fifoSortMatrixC_o_2_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
int xlx_stream_elt;
((char*)&xlx_stream_elt)[0*4+0] = fifoSortMatrixC_o_2_V_pc_buffer[j].range(7, 0).to_int64();
((char*)&xlx_stream_elt)[0*4+1] = fifoSortMatrixC_o_2_V_pc_buffer[j].range(15, 8).to_int64();
((char*)&xlx_stream_elt)[0*4+2] = fifoSortMatrixC_o_2_V_pc_buffer[j].range(23, 16).to_int64();
((char*)&xlx_stream_elt)[0*4+3] = fifoSortMatrixC_o_2_V_pc_buffer[j].range(31, 24).to_int64();
((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_2)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_fifoSortMatrixC_o_3_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_3_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoSortMatrixC_o_3_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_fifoSortMatrixC_o_3_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > fifoSortMatrixC_o_3_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "fifoSortMatrixC_o_3_V");
  
            // push token into output port buffer
            if (AESL_token != "") {
              fifoSortMatrixC_o_3_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
int xlx_stream_elt;
((char*)&xlx_stream_elt)[0*4+0] = fifoSortMatrixC_o_3_V_pc_buffer[j].range(7, 0).to_int64();
((char*)&xlx_stream_elt)[0*4+1] = fifoSortMatrixC_o_3_V_pc_buffer[j].range(15, 8).to_int64();
((char*)&xlx_stream_elt)[0*4+2] = fifoSortMatrixC_o_3_V_pc_buffer[j].range(23, 16).to_int64();
((char*)&xlx_stream_elt)[0*4+3] = fifoSortMatrixC_o_3_V_pc_buffer[j].range(31, 24).to_int64();
((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_3)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_fifoSortMatrixC_o_4_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_4_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoSortMatrixC_o_4_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_fifoSortMatrixC_o_4_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > fifoSortMatrixC_o_4_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "fifoSortMatrixC_o_4_V");
  
            // push token into output port buffer
            if (AESL_token != "") {
              fifoSortMatrixC_o_4_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
int xlx_stream_elt;
((char*)&xlx_stream_elt)[0*4+0] = fifoSortMatrixC_o_4_V_pc_buffer[j].range(7, 0).to_int64();
((char*)&xlx_stream_elt)[0*4+1] = fifoSortMatrixC_o_4_V_pc_buffer[j].range(15, 8).to_int64();
((char*)&xlx_stream_elt)[0*4+2] = fifoSortMatrixC_o_4_V_pc_buffer[j].range(23, 16).to_int64();
((char*)&xlx_stream_elt)[0*4+3] = fifoSortMatrixC_o_4_V_pc_buffer[j].range(31, 24).to_int64();
((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_4)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_fifoSortMatrixC_o_5_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_5_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoSortMatrixC_o_5_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_fifoSortMatrixC_o_5_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > fifoSortMatrixC_o_5_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "fifoSortMatrixC_o_5_V");
  
            // push token into output port buffer
            if (AESL_token != "") {
              fifoSortMatrixC_o_5_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
int xlx_stream_elt;
((char*)&xlx_stream_elt)[0*4+0] = fifoSortMatrixC_o_5_V_pc_buffer[j].range(7, 0).to_int64();
((char*)&xlx_stream_elt)[0*4+1] = fifoSortMatrixC_o_5_V_pc_buffer[j].range(15, 8).to_int64();
((char*)&xlx_stream_elt)[0*4+2] = fifoSortMatrixC_o_5_V_pc_buffer[j].range(23, 16).to_int64();
((char*)&xlx_stream_elt)[0*4+3] = fifoSortMatrixC_o_5_V_pc_buffer[j].range(31, 24).to_int64();
((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_5)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_fifoSortMatrixC_o_6_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_6_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoSortMatrixC_o_6_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_fifoSortMatrixC_o_6_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > fifoSortMatrixC_o_6_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "fifoSortMatrixC_o_6_V");
  
            // push token into output port buffer
            if (AESL_token != "") {
              fifoSortMatrixC_o_6_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
int xlx_stream_elt;
((char*)&xlx_stream_elt)[0*4+0] = fifoSortMatrixC_o_6_V_pc_buffer[j].range(7, 0).to_int64();
((char*)&xlx_stream_elt)[0*4+1] = fifoSortMatrixC_o_6_V_pc_buffer[j].range(15, 8).to_int64();
((char*)&xlx_stream_elt)[0*4+2] = fifoSortMatrixC_o_6_V_pc_buffer[j].range(23, 16).to_int64();
((char*)&xlx_stream_elt)[0*4+3] = fifoSortMatrixC_o_6_V_pc_buffer[j].range(31, 24).to_int64();
((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_6)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_fifoSortMatrixC_o_7_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_7_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_fifoSortMatrixC_o_7_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_fifoSortMatrixC_o_7_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > fifoSortMatrixC_o_7_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "fifoSortMatrixC_o_7_V");
  
            // push token into output port buffer
            if (AESL_token != "") {
              fifoSortMatrixC_o_7_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
int xlx_stream_elt;
((char*)&xlx_stream_elt)[0*4+0] = fifoSortMatrixC_o_7_V_pc_buffer[j].range(7, 0).to_int64();
((char*)&xlx_stream_elt)[0*4+1] = fifoSortMatrixC_o_7_V_pc_buffer[j].range(15, 8).to_int64();
((char*)&xlx_stream_elt)[0*4+2] = fifoSortMatrixC_o_7_V_pc_buffer[j].range(23, 16).to_int64();
((char*)&xlx_stream_elt)[0*4+3] = fifoSortMatrixC_o_7_V_pc_buffer[j].range(31, 24).to_int64();
((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_7)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//lenEdgeListPtr
aesl_fh.touch(AUTOTB_TVIN_lenEdgeListPtr);
aesl_fh.touch(AUTOTB_TVOUT_lenEdgeListPtr);
//fifoEdgeListPtr_i_V
aesl_fh.touch(AUTOTB_TVIN_fifoEdgeListPtr_i_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoEdgeListPtr_i_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_fifoEdgeListPtr_i_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_fifoEdgeListPtr_i_V);
//fifoMatrixCIdx_i_0_V
aesl_fh.touch(AUTOTB_TVIN_fifoMatrixCIdx_i_0_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoMatrixCIdx_i_0_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_0_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_0_V);
//fifoMatrixCIdx_i_1_V
aesl_fh.touch(AUTOTB_TVIN_fifoMatrixCIdx_i_1_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoMatrixCIdx_i_1_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_1_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_1_V);
//fifoMatrixCIdx_i_2_V
aesl_fh.touch(AUTOTB_TVIN_fifoMatrixCIdx_i_2_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoMatrixCIdx_i_2_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_2_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_2_V);
//fifoMatrixCIdx_i_3_V
aesl_fh.touch(AUTOTB_TVIN_fifoMatrixCIdx_i_3_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoMatrixCIdx_i_3_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_3_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_3_V);
//fifoMatrixCIdx_i_4_V
aesl_fh.touch(AUTOTB_TVIN_fifoMatrixCIdx_i_4_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoMatrixCIdx_i_4_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_4_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_4_V);
//fifoMatrixCIdx_i_5_V
aesl_fh.touch(AUTOTB_TVIN_fifoMatrixCIdx_i_5_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoMatrixCIdx_i_5_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_5_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_5_V);
//fifoMatrixCIdx_i_6_V
aesl_fh.touch(AUTOTB_TVIN_fifoMatrixCIdx_i_6_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoMatrixCIdx_i_6_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_6_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_6_V);
//fifoMatrixCIdx_i_7_V
aesl_fh.touch(AUTOTB_TVIN_fifoMatrixCIdx_i_7_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoMatrixCIdx_i_7_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_7_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_7_V);
//fifoCalcMatrixC_i_0_V
aesl_fh.touch(AUTOTB_TVIN_fifoCalcMatrixC_i_0_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoCalcMatrixC_i_0_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_0_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_0_V);
//fifoCalcMatrixC_i_1_V
aesl_fh.touch(AUTOTB_TVIN_fifoCalcMatrixC_i_1_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoCalcMatrixC_i_1_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_1_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_1_V);
//fifoCalcMatrixC_i_2_V
aesl_fh.touch(AUTOTB_TVIN_fifoCalcMatrixC_i_2_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoCalcMatrixC_i_2_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_2_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_2_V);
//fifoCalcMatrixC_i_3_V
aesl_fh.touch(AUTOTB_TVIN_fifoCalcMatrixC_i_3_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoCalcMatrixC_i_3_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_3_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_3_V);
//fifoCalcMatrixC_i_4_V
aesl_fh.touch(AUTOTB_TVIN_fifoCalcMatrixC_i_4_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoCalcMatrixC_i_4_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_4_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_4_V);
//fifoCalcMatrixC_i_5_V
aesl_fh.touch(AUTOTB_TVIN_fifoCalcMatrixC_i_5_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoCalcMatrixC_i_5_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_5_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_5_V);
//fifoCalcMatrixC_i_6_V
aesl_fh.touch(AUTOTB_TVIN_fifoCalcMatrixC_i_6_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoCalcMatrixC_i_6_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_6_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_6_V);
//fifoCalcMatrixC_i_7_V
aesl_fh.touch(AUTOTB_TVIN_fifoCalcMatrixC_i_7_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoCalcMatrixC_i_7_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_7_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_7_V);
//fifoSortMatrixC_o_0_V
aesl_fh.touch(AUTOTB_TVIN_fifoSortMatrixC_o_0_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoSortMatrixC_o_0_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_0_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_fifoSortMatrixC_o_0_V);
//fifoSortMatrixC_o_1_V
aesl_fh.touch(AUTOTB_TVIN_fifoSortMatrixC_o_1_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoSortMatrixC_o_1_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_1_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_fifoSortMatrixC_o_1_V);
//fifoSortMatrixC_o_2_V
aesl_fh.touch(AUTOTB_TVIN_fifoSortMatrixC_o_2_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoSortMatrixC_o_2_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_2_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_fifoSortMatrixC_o_2_V);
//fifoSortMatrixC_o_3_V
aesl_fh.touch(AUTOTB_TVIN_fifoSortMatrixC_o_3_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoSortMatrixC_o_3_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_3_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_fifoSortMatrixC_o_3_V);
//fifoSortMatrixC_o_4_V
aesl_fh.touch(AUTOTB_TVIN_fifoSortMatrixC_o_4_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoSortMatrixC_o_4_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_4_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_fifoSortMatrixC_o_4_V);
//fifoSortMatrixC_o_5_V
aesl_fh.touch(AUTOTB_TVIN_fifoSortMatrixC_o_5_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoSortMatrixC_o_5_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_5_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_fifoSortMatrixC_o_5_V);
//fifoSortMatrixC_o_6_V
aesl_fh.touch(AUTOTB_TVIN_fifoSortMatrixC_o_6_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoSortMatrixC_o_6_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_6_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_fifoSortMatrixC_o_6_V);
//fifoSortMatrixC_o_7_V
aesl_fh.touch(AUTOTB_TVIN_fifoSortMatrixC_o_7_V);
aesl_fh.touch(AUTOTB_TVOUT_fifoSortMatrixC_o_7_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_7_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_fifoSortMatrixC_o_7_V);
CodeState = DUMP_INPUTS;
// print lenEdgeListPtr Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_lenEdgeListPtr, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)&__xlx_apatb_param_lenEdgeListPtr);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_lenEdgeListPtr, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.lenEdgeListPtr_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_lenEdgeListPtr, __xlx_sprintf_buffer.data());
}
std::vector<__cosim_s4__> __xlx_apatb_param_fifoEdgeListPtr_i_stream_buf;
{
  while (!((hls::stream<__cosim_s4__>*)__xlx_apatb_param_fifoEdgeListPtr_i)->empty())
    __xlx_apatb_param_fifoEdgeListPtr_i_stream_buf.push_back(((hls::stream<__cosim_s4__>*)__xlx_apatb_param_fifoEdgeListPtr_i)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoEdgeListPtr_i_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_fifoEdgeListPtr_i)->write(__xlx_apatb_param_fifoEdgeListPtr_i_stream_buf[i]);
  }
long __xlx_apatb_param_fifoEdgeListPtr_i_stream_buf_size = ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_fifoEdgeListPtr_i)->size();
std::vector<short> __xlx_apatb_param_fifoMatrixCIdx_i_0_stream_buf;
{
  while (!((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_0)->empty())
    __xlx_apatb_param_fifoMatrixCIdx_i_0_stream_buf.push_back(((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_0)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoMatrixCIdx_i_0_stream_buf.size(); ++i)
    ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_0)->write(__xlx_apatb_param_fifoMatrixCIdx_i_0_stream_buf[i]);
  }
long __xlx_apatb_param_fifoMatrixCIdx_i_0_stream_buf_size = ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_0)->size();
std::vector<short> __xlx_apatb_param_fifoMatrixCIdx_i_1_stream_buf;
{
  while (!((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_1)->empty())
    __xlx_apatb_param_fifoMatrixCIdx_i_1_stream_buf.push_back(((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_1)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoMatrixCIdx_i_1_stream_buf.size(); ++i)
    ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_1)->write(__xlx_apatb_param_fifoMatrixCIdx_i_1_stream_buf[i]);
  }
long __xlx_apatb_param_fifoMatrixCIdx_i_1_stream_buf_size = ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_1)->size();
std::vector<short> __xlx_apatb_param_fifoMatrixCIdx_i_2_stream_buf;
{
  while (!((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_2)->empty())
    __xlx_apatb_param_fifoMatrixCIdx_i_2_stream_buf.push_back(((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_2)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoMatrixCIdx_i_2_stream_buf.size(); ++i)
    ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_2)->write(__xlx_apatb_param_fifoMatrixCIdx_i_2_stream_buf[i]);
  }
long __xlx_apatb_param_fifoMatrixCIdx_i_2_stream_buf_size = ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_2)->size();
std::vector<short> __xlx_apatb_param_fifoMatrixCIdx_i_3_stream_buf;
{
  while (!((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_3)->empty())
    __xlx_apatb_param_fifoMatrixCIdx_i_3_stream_buf.push_back(((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_3)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoMatrixCIdx_i_3_stream_buf.size(); ++i)
    ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_3)->write(__xlx_apatb_param_fifoMatrixCIdx_i_3_stream_buf[i]);
  }
long __xlx_apatb_param_fifoMatrixCIdx_i_3_stream_buf_size = ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_3)->size();
std::vector<short> __xlx_apatb_param_fifoMatrixCIdx_i_4_stream_buf;
{
  while (!((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_4)->empty())
    __xlx_apatb_param_fifoMatrixCIdx_i_4_stream_buf.push_back(((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_4)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoMatrixCIdx_i_4_stream_buf.size(); ++i)
    ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_4)->write(__xlx_apatb_param_fifoMatrixCIdx_i_4_stream_buf[i]);
  }
long __xlx_apatb_param_fifoMatrixCIdx_i_4_stream_buf_size = ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_4)->size();
std::vector<short> __xlx_apatb_param_fifoMatrixCIdx_i_5_stream_buf;
{
  while (!((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_5)->empty())
    __xlx_apatb_param_fifoMatrixCIdx_i_5_stream_buf.push_back(((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_5)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoMatrixCIdx_i_5_stream_buf.size(); ++i)
    ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_5)->write(__xlx_apatb_param_fifoMatrixCIdx_i_5_stream_buf[i]);
  }
long __xlx_apatb_param_fifoMatrixCIdx_i_5_stream_buf_size = ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_5)->size();
std::vector<short> __xlx_apatb_param_fifoMatrixCIdx_i_6_stream_buf;
{
  while (!((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_6)->empty())
    __xlx_apatb_param_fifoMatrixCIdx_i_6_stream_buf.push_back(((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_6)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoMatrixCIdx_i_6_stream_buf.size(); ++i)
    ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_6)->write(__xlx_apatb_param_fifoMatrixCIdx_i_6_stream_buf[i]);
  }
long __xlx_apatb_param_fifoMatrixCIdx_i_6_stream_buf_size = ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_6)->size();
std::vector<short> __xlx_apatb_param_fifoMatrixCIdx_i_7_stream_buf;
{
  while (!((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_7)->empty())
    __xlx_apatb_param_fifoMatrixCIdx_i_7_stream_buf.push_back(((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_7)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoMatrixCIdx_i_7_stream_buf.size(); ++i)
    ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_7)->write(__xlx_apatb_param_fifoMatrixCIdx_i_7_stream_buf[i]);
  }
long __xlx_apatb_param_fifoMatrixCIdx_i_7_stream_buf_size = ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_7)->size();
std::vector<int> __xlx_apatb_param_fifoCalcMatrixC_i_0_stream_buf;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_0)->empty())
    __xlx_apatb_param_fifoCalcMatrixC_i_0_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_0)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoCalcMatrixC_i_0_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_0)->write(__xlx_apatb_param_fifoCalcMatrixC_i_0_stream_buf[i]);
  }
long __xlx_apatb_param_fifoCalcMatrixC_i_0_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_0)->size();
std::vector<int> __xlx_apatb_param_fifoCalcMatrixC_i_1_stream_buf;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_1)->empty())
    __xlx_apatb_param_fifoCalcMatrixC_i_1_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_1)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoCalcMatrixC_i_1_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_1)->write(__xlx_apatb_param_fifoCalcMatrixC_i_1_stream_buf[i]);
  }
long __xlx_apatb_param_fifoCalcMatrixC_i_1_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_1)->size();
std::vector<int> __xlx_apatb_param_fifoCalcMatrixC_i_2_stream_buf;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_2)->empty())
    __xlx_apatb_param_fifoCalcMatrixC_i_2_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_2)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoCalcMatrixC_i_2_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_2)->write(__xlx_apatb_param_fifoCalcMatrixC_i_2_stream_buf[i]);
  }
long __xlx_apatb_param_fifoCalcMatrixC_i_2_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_2)->size();
std::vector<int> __xlx_apatb_param_fifoCalcMatrixC_i_3_stream_buf;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_3)->empty())
    __xlx_apatb_param_fifoCalcMatrixC_i_3_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_3)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoCalcMatrixC_i_3_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_3)->write(__xlx_apatb_param_fifoCalcMatrixC_i_3_stream_buf[i]);
  }
long __xlx_apatb_param_fifoCalcMatrixC_i_3_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_3)->size();
std::vector<int> __xlx_apatb_param_fifoCalcMatrixC_i_4_stream_buf;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_4)->empty())
    __xlx_apatb_param_fifoCalcMatrixC_i_4_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_4)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoCalcMatrixC_i_4_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_4)->write(__xlx_apatb_param_fifoCalcMatrixC_i_4_stream_buf[i]);
  }
long __xlx_apatb_param_fifoCalcMatrixC_i_4_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_4)->size();
std::vector<int> __xlx_apatb_param_fifoCalcMatrixC_i_5_stream_buf;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_5)->empty())
    __xlx_apatb_param_fifoCalcMatrixC_i_5_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_5)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoCalcMatrixC_i_5_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_5)->write(__xlx_apatb_param_fifoCalcMatrixC_i_5_stream_buf[i]);
  }
long __xlx_apatb_param_fifoCalcMatrixC_i_5_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_5)->size();
std::vector<int> __xlx_apatb_param_fifoCalcMatrixC_i_6_stream_buf;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_6)->empty())
    __xlx_apatb_param_fifoCalcMatrixC_i_6_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_6)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoCalcMatrixC_i_6_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_6)->write(__xlx_apatb_param_fifoCalcMatrixC_i_6_stream_buf[i]);
  }
long __xlx_apatb_param_fifoCalcMatrixC_i_6_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_6)->size();
std::vector<int> __xlx_apatb_param_fifoCalcMatrixC_i_7_stream_buf;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_7)->empty())
    __xlx_apatb_param_fifoCalcMatrixC_i_7_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_7)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoCalcMatrixC_i_7_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_7)->write(__xlx_apatb_param_fifoCalcMatrixC_i_7_stream_buf[i]);
  }
long __xlx_apatb_param_fifoCalcMatrixC_i_7_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_7)->size();
std::vector<int> __xlx_apatb_param_fifoSortMatrixC_o_0_stream_buf;
long __xlx_apatb_param_fifoSortMatrixC_o_0_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_0)->size();
std::vector<int> __xlx_apatb_param_fifoSortMatrixC_o_1_stream_buf;
long __xlx_apatb_param_fifoSortMatrixC_o_1_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_1)->size();
std::vector<int> __xlx_apatb_param_fifoSortMatrixC_o_2_stream_buf;
long __xlx_apatb_param_fifoSortMatrixC_o_2_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_2)->size();
std::vector<int> __xlx_apatb_param_fifoSortMatrixC_o_3_stream_buf;
long __xlx_apatb_param_fifoSortMatrixC_o_3_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_3)->size();
std::vector<int> __xlx_apatb_param_fifoSortMatrixC_o_4_stream_buf;
long __xlx_apatb_param_fifoSortMatrixC_o_4_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_4)->size();
std::vector<int> __xlx_apatb_param_fifoSortMatrixC_o_5_stream_buf;
long __xlx_apatb_param_fifoSortMatrixC_o_5_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_5)->size();
std::vector<int> __xlx_apatb_param_fifoSortMatrixC_o_6_stream_buf;
long __xlx_apatb_param_fifoSortMatrixC_o_6_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_6)->size();
std::vector<int> __xlx_apatb_param_fifoSortMatrixC_o_7_stream_buf;
long __xlx_apatb_param_fifoSortMatrixC_o_7_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_7)->size();
CodeState = CALL_C_DUT;
sort_C_hw_stub_wrapper(__xlx_apatb_param_lenEdgeListPtr, __xlx_apatb_param_fifoEdgeListPtr_i, __xlx_apatb_param_fifoMatrixCIdx_i_0, __xlx_apatb_param_fifoMatrixCIdx_i_1, __xlx_apatb_param_fifoMatrixCIdx_i_2, __xlx_apatb_param_fifoMatrixCIdx_i_3, __xlx_apatb_param_fifoMatrixCIdx_i_4, __xlx_apatb_param_fifoMatrixCIdx_i_5, __xlx_apatb_param_fifoMatrixCIdx_i_6, __xlx_apatb_param_fifoMatrixCIdx_i_7, __xlx_apatb_param_fifoCalcMatrixC_i_0, __xlx_apatb_param_fifoCalcMatrixC_i_1, __xlx_apatb_param_fifoCalcMatrixC_i_2, __xlx_apatb_param_fifoCalcMatrixC_i_3, __xlx_apatb_param_fifoCalcMatrixC_i_4, __xlx_apatb_param_fifoCalcMatrixC_i_5, __xlx_apatb_param_fifoCalcMatrixC_i_6, __xlx_apatb_param_fifoCalcMatrixC_i_7, __xlx_apatb_param_fifoSortMatrixC_o_0, __xlx_apatb_param_fifoSortMatrixC_o_1, __xlx_apatb_param_fifoSortMatrixC_o_2, __xlx_apatb_param_fifoSortMatrixC_o_3, __xlx_apatb_param_fifoSortMatrixC_o_4, __xlx_apatb_param_fifoSortMatrixC_o_5, __xlx_apatb_param_fifoSortMatrixC_o_6, __xlx_apatb_param_fifoSortMatrixC_o_7);
CodeState = DUMP_OUTPUTS;
long __xlx_apatb_param_fifoEdgeListPtr_i_stream_buf_final_size = __xlx_apatb_param_fifoEdgeListPtr_i_stream_buf_size - ((hls::stream<__cosim_s4__>*)__xlx_apatb_param_fifoEdgeListPtr_i)->size();
// print fifoEdgeListPtr_i_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fifoEdgeListPtr_i_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoEdgeListPtr_i_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv_hw;
sc_bv<32> __xlx_tmp_lv;
__xlx_tmp_lv = ((int*)&__xlx_apatb_param_fifoEdgeListPtr_i_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fifoEdgeListPtr_i_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoEdgeListPtr_i_stream_buf_final_size, &tcl_file.fifoEdgeListPtr_i_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fifoEdgeListPtr_i_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoEdgeListPtr_i_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_fifoEdgeListPtr_i_stream_buf_final_size > 0) {
  long fifoEdgeListPtr_i_V_stream_ingress_size = __xlx_apatb_param_fifoEdgeListPtr_i_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoEdgeListPtr_i_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoEdgeListPtr_i_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoEdgeListPtr_i_stream_buf_final_size; j != e; j++) {
    fifoEdgeListPtr_i_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoEdgeListPtr_i_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoEdgeListPtr_i_V, __xlx_sprintf_buffer.data());
  }
} else {
  long fifoEdgeListPtr_i_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoEdgeListPtr_i_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoEdgeListPtr_i_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoEdgeListPtr_i_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoEdgeListPtr_i_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoEdgeListPtr_i_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoEdgeListPtr_i_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoEdgeListPtr_i_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoMatrixCIdx_i_0_stream_buf_final_size = __xlx_apatb_param_fifoMatrixCIdx_i_0_stream_buf_size - ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_0)->size();
// print fifoMatrixCIdx_i_0_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_0_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoMatrixCIdx_i_0_stream_buf_final_size; j != e; ++j) {
sc_bv<16> __xlx_tmp_lv_hw;
sc_bv<16> __xlx_tmp_lv;
__xlx_tmp_lv = ((short*)&__xlx_apatb_param_fifoMatrixCIdx_i_0_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_0_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoMatrixCIdx_i_0_stream_buf_final_size, &tcl_file.fifoMatrixCIdx_i_0_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_0_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_0_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_fifoMatrixCIdx_i_0_stream_buf_final_size > 0) {
  long fifoMatrixCIdx_i_0_V_stream_ingress_size = __xlx_apatb_param_fifoMatrixCIdx_i_0_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_0_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_0_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoMatrixCIdx_i_0_stream_buf_final_size; j != e; j++) {
    fifoMatrixCIdx_i_0_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_0_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_0_V, __xlx_sprintf_buffer.data());
  }
} else {
  long fifoMatrixCIdx_i_0_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_0_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_0_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_0_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_0_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoMatrixCIdx_i_0_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_0_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_0_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoMatrixCIdx_i_1_stream_buf_final_size = __xlx_apatb_param_fifoMatrixCIdx_i_1_stream_buf_size - ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_1)->size();
// print fifoMatrixCIdx_i_1_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_1_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoMatrixCIdx_i_1_stream_buf_final_size; j != e; ++j) {
sc_bv<16> __xlx_tmp_lv_hw;
sc_bv<16> __xlx_tmp_lv;
__xlx_tmp_lv = ((short*)&__xlx_apatb_param_fifoMatrixCIdx_i_1_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_1_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoMatrixCIdx_i_1_stream_buf_final_size, &tcl_file.fifoMatrixCIdx_i_1_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_1_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_1_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_fifoMatrixCIdx_i_1_stream_buf_final_size > 0) {
  long fifoMatrixCIdx_i_1_V_stream_ingress_size = __xlx_apatb_param_fifoMatrixCIdx_i_1_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_1_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_1_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoMatrixCIdx_i_1_stream_buf_final_size; j != e; j++) {
    fifoMatrixCIdx_i_1_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_1_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_1_V, __xlx_sprintf_buffer.data());
  }
} else {
  long fifoMatrixCIdx_i_1_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_1_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_1_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_1_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_1_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoMatrixCIdx_i_1_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_1_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_1_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoMatrixCIdx_i_2_stream_buf_final_size = __xlx_apatb_param_fifoMatrixCIdx_i_2_stream_buf_size - ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_2)->size();
// print fifoMatrixCIdx_i_2_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_2_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoMatrixCIdx_i_2_stream_buf_final_size; j != e; ++j) {
sc_bv<16> __xlx_tmp_lv_hw;
sc_bv<16> __xlx_tmp_lv;
__xlx_tmp_lv = ((short*)&__xlx_apatb_param_fifoMatrixCIdx_i_2_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_2_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoMatrixCIdx_i_2_stream_buf_final_size, &tcl_file.fifoMatrixCIdx_i_2_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_2_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_2_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_fifoMatrixCIdx_i_2_stream_buf_final_size > 0) {
  long fifoMatrixCIdx_i_2_V_stream_ingress_size = __xlx_apatb_param_fifoMatrixCIdx_i_2_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_2_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_2_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoMatrixCIdx_i_2_stream_buf_final_size; j != e; j++) {
    fifoMatrixCIdx_i_2_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_2_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_2_V, __xlx_sprintf_buffer.data());
  }
} else {
  long fifoMatrixCIdx_i_2_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_2_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_2_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_2_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_2_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoMatrixCIdx_i_2_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_2_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_2_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoMatrixCIdx_i_3_stream_buf_final_size = __xlx_apatb_param_fifoMatrixCIdx_i_3_stream_buf_size - ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_3)->size();
// print fifoMatrixCIdx_i_3_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_3_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoMatrixCIdx_i_3_stream_buf_final_size; j != e; ++j) {
sc_bv<16> __xlx_tmp_lv_hw;
sc_bv<16> __xlx_tmp_lv;
__xlx_tmp_lv = ((short*)&__xlx_apatb_param_fifoMatrixCIdx_i_3_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_3_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoMatrixCIdx_i_3_stream_buf_final_size, &tcl_file.fifoMatrixCIdx_i_3_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_3_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_3_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_fifoMatrixCIdx_i_3_stream_buf_final_size > 0) {
  long fifoMatrixCIdx_i_3_V_stream_ingress_size = __xlx_apatb_param_fifoMatrixCIdx_i_3_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_3_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_3_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoMatrixCIdx_i_3_stream_buf_final_size; j != e; j++) {
    fifoMatrixCIdx_i_3_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_3_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_3_V, __xlx_sprintf_buffer.data());
  }
} else {
  long fifoMatrixCIdx_i_3_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_3_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_3_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_3_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_3_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoMatrixCIdx_i_3_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_3_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_3_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoMatrixCIdx_i_4_stream_buf_final_size = __xlx_apatb_param_fifoMatrixCIdx_i_4_stream_buf_size - ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_4)->size();
// print fifoMatrixCIdx_i_4_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_4_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoMatrixCIdx_i_4_stream_buf_final_size; j != e; ++j) {
sc_bv<16> __xlx_tmp_lv_hw;
sc_bv<16> __xlx_tmp_lv;
__xlx_tmp_lv = ((short*)&__xlx_apatb_param_fifoMatrixCIdx_i_4_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_4_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoMatrixCIdx_i_4_stream_buf_final_size, &tcl_file.fifoMatrixCIdx_i_4_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_4_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_4_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_fifoMatrixCIdx_i_4_stream_buf_final_size > 0) {
  long fifoMatrixCIdx_i_4_V_stream_ingress_size = __xlx_apatb_param_fifoMatrixCIdx_i_4_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_4_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_4_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoMatrixCIdx_i_4_stream_buf_final_size; j != e; j++) {
    fifoMatrixCIdx_i_4_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_4_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_4_V, __xlx_sprintf_buffer.data());
  }
} else {
  long fifoMatrixCIdx_i_4_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_4_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_4_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_4_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_4_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoMatrixCIdx_i_4_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_4_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_4_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoMatrixCIdx_i_5_stream_buf_final_size = __xlx_apatb_param_fifoMatrixCIdx_i_5_stream_buf_size - ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_5)->size();
// print fifoMatrixCIdx_i_5_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_5_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoMatrixCIdx_i_5_stream_buf_final_size; j != e; ++j) {
sc_bv<16> __xlx_tmp_lv_hw;
sc_bv<16> __xlx_tmp_lv;
__xlx_tmp_lv = ((short*)&__xlx_apatb_param_fifoMatrixCIdx_i_5_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_5_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoMatrixCIdx_i_5_stream_buf_final_size, &tcl_file.fifoMatrixCIdx_i_5_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_5_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_5_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_fifoMatrixCIdx_i_5_stream_buf_final_size > 0) {
  long fifoMatrixCIdx_i_5_V_stream_ingress_size = __xlx_apatb_param_fifoMatrixCIdx_i_5_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_5_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_5_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoMatrixCIdx_i_5_stream_buf_final_size; j != e; j++) {
    fifoMatrixCIdx_i_5_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_5_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_5_V, __xlx_sprintf_buffer.data());
  }
} else {
  long fifoMatrixCIdx_i_5_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_5_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_5_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_5_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_5_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoMatrixCIdx_i_5_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_5_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_5_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoMatrixCIdx_i_6_stream_buf_final_size = __xlx_apatb_param_fifoMatrixCIdx_i_6_stream_buf_size - ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_6)->size();
// print fifoMatrixCIdx_i_6_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_6_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoMatrixCIdx_i_6_stream_buf_final_size; j != e; ++j) {
sc_bv<16> __xlx_tmp_lv_hw;
sc_bv<16> __xlx_tmp_lv;
__xlx_tmp_lv = ((short*)&__xlx_apatb_param_fifoMatrixCIdx_i_6_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_6_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoMatrixCIdx_i_6_stream_buf_final_size, &tcl_file.fifoMatrixCIdx_i_6_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_6_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_6_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_fifoMatrixCIdx_i_6_stream_buf_final_size > 0) {
  long fifoMatrixCIdx_i_6_V_stream_ingress_size = __xlx_apatb_param_fifoMatrixCIdx_i_6_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_6_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_6_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoMatrixCIdx_i_6_stream_buf_final_size; j != e; j++) {
    fifoMatrixCIdx_i_6_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_6_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_6_V, __xlx_sprintf_buffer.data());
  }
} else {
  long fifoMatrixCIdx_i_6_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_6_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_6_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_6_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_6_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoMatrixCIdx_i_6_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_6_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_6_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoMatrixCIdx_i_7_stream_buf_final_size = __xlx_apatb_param_fifoMatrixCIdx_i_7_stream_buf_size - ((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_7)->size();
// print fifoMatrixCIdx_i_7_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_7_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoMatrixCIdx_i_7_stream_buf_final_size; j != e; ++j) {
sc_bv<16> __xlx_tmp_lv_hw;
sc_bv<16> __xlx_tmp_lv;
__xlx_tmp_lv = ((short*)&__xlx_apatb_param_fifoMatrixCIdx_i_7_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_7_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoMatrixCIdx_i_7_stream_buf_final_size, &tcl_file.fifoMatrixCIdx_i_7_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fifoMatrixCIdx_i_7_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_7_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_fifoMatrixCIdx_i_7_stream_buf_final_size > 0) {
  long fifoMatrixCIdx_i_7_V_stream_ingress_size = __xlx_apatb_param_fifoMatrixCIdx_i_7_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_7_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_7_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoMatrixCIdx_i_7_stream_buf_final_size; j != e; j++) {
    fifoMatrixCIdx_i_7_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_7_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_7_V, __xlx_sprintf_buffer.data());
  }
} else {
  long fifoMatrixCIdx_i_7_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoMatrixCIdx_i_7_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_7_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoMatrixCIdx_i_7_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_7_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoMatrixCIdx_i_7_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_7_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoMatrixCIdx_i_7_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoCalcMatrixC_i_0_stream_buf_final_size = __xlx_apatb_param_fifoCalcMatrixC_i_0_stream_buf_size - ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_0)->size();
// print fifoCalcMatrixC_i_0_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_0_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoCalcMatrixC_i_0_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv_hw;
sc_bv<32> __xlx_tmp_lv;
__xlx_tmp_lv = ((int*)&__xlx_apatb_param_fifoCalcMatrixC_i_0_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_0_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoCalcMatrixC_i_0_stream_buf_final_size, &tcl_file.fifoCalcMatrixC_i_0_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_0_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_0_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_fifoCalcMatrixC_i_0_stream_buf_final_size > 0) {
  long fifoCalcMatrixC_i_0_V_stream_ingress_size = __xlx_apatb_param_fifoCalcMatrixC_i_0_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_0_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_0_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoCalcMatrixC_i_0_stream_buf_final_size; j != e; j++) {
    fifoCalcMatrixC_i_0_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_0_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_0_V, __xlx_sprintf_buffer.data());
  }
} else {
  long fifoCalcMatrixC_i_0_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_0_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_0_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_0_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_0_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoCalcMatrixC_i_0_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_0_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_0_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoCalcMatrixC_i_1_stream_buf_final_size = __xlx_apatb_param_fifoCalcMatrixC_i_1_stream_buf_size - ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_1)->size();
// print fifoCalcMatrixC_i_1_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_1_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoCalcMatrixC_i_1_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv_hw;
sc_bv<32> __xlx_tmp_lv;
__xlx_tmp_lv = ((int*)&__xlx_apatb_param_fifoCalcMatrixC_i_1_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_1_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoCalcMatrixC_i_1_stream_buf_final_size, &tcl_file.fifoCalcMatrixC_i_1_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_1_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_1_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_fifoCalcMatrixC_i_1_stream_buf_final_size > 0) {
  long fifoCalcMatrixC_i_1_V_stream_ingress_size = __xlx_apatb_param_fifoCalcMatrixC_i_1_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_1_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_1_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoCalcMatrixC_i_1_stream_buf_final_size; j != e; j++) {
    fifoCalcMatrixC_i_1_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_1_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_1_V, __xlx_sprintf_buffer.data());
  }
} else {
  long fifoCalcMatrixC_i_1_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_1_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_1_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_1_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_1_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoCalcMatrixC_i_1_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_1_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_1_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoCalcMatrixC_i_2_stream_buf_final_size = __xlx_apatb_param_fifoCalcMatrixC_i_2_stream_buf_size - ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_2)->size();
// print fifoCalcMatrixC_i_2_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_2_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoCalcMatrixC_i_2_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv_hw;
sc_bv<32> __xlx_tmp_lv;
__xlx_tmp_lv = ((int*)&__xlx_apatb_param_fifoCalcMatrixC_i_2_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_2_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoCalcMatrixC_i_2_stream_buf_final_size, &tcl_file.fifoCalcMatrixC_i_2_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_2_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_2_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_fifoCalcMatrixC_i_2_stream_buf_final_size > 0) {
  long fifoCalcMatrixC_i_2_V_stream_ingress_size = __xlx_apatb_param_fifoCalcMatrixC_i_2_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_2_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_2_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoCalcMatrixC_i_2_stream_buf_final_size; j != e; j++) {
    fifoCalcMatrixC_i_2_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_2_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_2_V, __xlx_sprintf_buffer.data());
  }
} else {
  long fifoCalcMatrixC_i_2_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_2_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_2_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_2_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_2_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoCalcMatrixC_i_2_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_2_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_2_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoCalcMatrixC_i_3_stream_buf_final_size = __xlx_apatb_param_fifoCalcMatrixC_i_3_stream_buf_size - ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_3)->size();
// print fifoCalcMatrixC_i_3_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_3_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoCalcMatrixC_i_3_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv_hw;
sc_bv<32> __xlx_tmp_lv;
__xlx_tmp_lv = ((int*)&__xlx_apatb_param_fifoCalcMatrixC_i_3_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_3_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoCalcMatrixC_i_3_stream_buf_final_size, &tcl_file.fifoCalcMatrixC_i_3_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_3_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_3_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_fifoCalcMatrixC_i_3_stream_buf_final_size > 0) {
  long fifoCalcMatrixC_i_3_V_stream_ingress_size = __xlx_apatb_param_fifoCalcMatrixC_i_3_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_3_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_3_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoCalcMatrixC_i_3_stream_buf_final_size; j != e; j++) {
    fifoCalcMatrixC_i_3_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_3_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_3_V, __xlx_sprintf_buffer.data());
  }
} else {
  long fifoCalcMatrixC_i_3_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_3_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_3_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_3_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_3_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoCalcMatrixC_i_3_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_3_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_3_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoCalcMatrixC_i_4_stream_buf_final_size = __xlx_apatb_param_fifoCalcMatrixC_i_4_stream_buf_size - ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_4)->size();
// print fifoCalcMatrixC_i_4_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_4_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoCalcMatrixC_i_4_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv_hw;
sc_bv<32> __xlx_tmp_lv;
__xlx_tmp_lv = ((int*)&__xlx_apatb_param_fifoCalcMatrixC_i_4_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_4_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoCalcMatrixC_i_4_stream_buf_final_size, &tcl_file.fifoCalcMatrixC_i_4_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_4_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_4_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_fifoCalcMatrixC_i_4_stream_buf_final_size > 0) {
  long fifoCalcMatrixC_i_4_V_stream_ingress_size = __xlx_apatb_param_fifoCalcMatrixC_i_4_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_4_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_4_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoCalcMatrixC_i_4_stream_buf_final_size; j != e; j++) {
    fifoCalcMatrixC_i_4_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_4_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_4_V, __xlx_sprintf_buffer.data());
  }
} else {
  long fifoCalcMatrixC_i_4_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_4_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_4_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_4_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_4_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoCalcMatrixC_i_4_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_4_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_4_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoCalcMatrixC_i_5_stream_buf_final_size = __xlx_apatb_param_fifoCalcMatrixC_i_5_stream_buf_size - ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_5)->size();
// print fifoCalcMatrixC_i_5_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_5_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoCalcMatrixC_i_5_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv_hw;
sc_bv<32> __xlx_tmp_lv;
__xlx_tmp_lv = ((int*)&__xlx_apatb_param_fifoCalcMatrixC_i_5_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_5_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoCalcMatrixC_i_5_stream_buf_final_size, &tcl_file.fifoCalcMatrixC_i_5_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_5_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_5_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_fifoCalcMatrixC_i_5_stream_buf_final_size > 0) {
  long fifoCalcMatrixC_i_5_V_stream_ingress_size = __xlx_apatb_param_fifoCalcMatrixC_i_5_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_5_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_5_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoCalcMatrixC_i_5_stream_buf_final_size; j != e; j++) {
    fifoCalcMatrixC_i_5_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_5_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_5_V, __xlx_sprintf_buffer.data());
  }
} else {
  long fifoCalcMatrixC_i_5_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_5_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_5_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_5_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_5_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoCalcMatrixC_i_5_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_5_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_5_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoCalcMatrixC_i_6_stream_buf_final_size = __xlx_apatb_param_fifoCalcMatrixC_i_6_stream_buf_size - ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_6)->size();
// print fifoCalcMatrixC_i_6_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_6_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoCalcMatrixC_i_6_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv_hw;
sc_bv<32> __xlx_tmp_lv;
__xlx_tmp_lv = ((int*)&__xlx_apatb_param_fifoCalcMatrixC_i_6_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_6_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoCalcMatrixC_i_6_stream_buf_final_size, &tcl_file.fifoCalcMatrixC_i_6_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_6_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_6_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_fifoCalcMatrixC_i_6_stream_buf_final_size > 0) {
  long fifoCalcMatrixC_i_6_V_stream_ingress_size = __xlx_apatb_param_fifoCalcMatrixC_i_6_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_6_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_6_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoCalcMatrixC_i_6_stream_buf_final_size; j != e; j++) {
    fifoCalcMatrixC_i_6_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_6_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_6_V, __xlx_sprintf_buffer.data());
  }
} else {
  long fifoCalcMatrixC_i_6_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_6_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_6_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_6_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_6_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoCalcMatrixC_i_6_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_6_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_6_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoCalcMatrixC_i_7_stream_buf_final_size = __xlx_apatb_param_fifoCalcMatrixC_i_7_stream_buf_size - ((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_7)->size();
// print fifoCalcMatrixC_i_7_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_7_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoCalcMatrixC_i_7_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv_hw;
sc_bv<32> __xlx_tmp_lv;
__xlx_tmp_lv = ((int*)&__xlx_apatb_param_fifoCalcMatrixC_i_7_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_7_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoCalcMatrixC_i_7_stream_buf_final_size, &tcl_file.fifoCalcMatrixC_i_7_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_fifoCalcMatrixC_i_7_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_7_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_fifoCalcMatrixC_i_7_stream_buf_final_size > 0) {
  long fifoCalcMatrixC_i_7_V_stream_ingress_size = __xlx_apatb_param_fifoCalcMatrixC_i_7_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_7_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_7_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoCalcMatrixC_i_7_stream_buf_final_size; j != e; j++) {
    fifoCalcMatrixC_i_7_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_7_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_7_V, __xlx_sprintf_buffer.data());
  }
} else {
  long fifoCalcMatrixC_i_7_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", fifoCalcMatrixC_i_7_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_7_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_fifoCalcMatrixC_i_7_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_7_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoCalcMatrixC_i_7_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_7_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_fifoCalcMatrixC_i_7_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoSortMatrixC_o_0_stream_buf_final_size = ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_0)->size() - __xlx_apatb_param_fifoSortMatrixC_o_0_stream_buf_size;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_0)->empty())
    __xlx_apatb_param_fifoSortMatrixC_o_0_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_0)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoSortMatrixC_o_0_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_0)->write(__xlx_apatb_param_fifoSortMatrixC_o_0_stream_buf[i]);
  }
// print fifoSortMatrixC_o_0_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_0_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoSortMatrixC_o_0_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)&__xlx_apatb_param_fifoSortMatrixC_o_0_stream_buf[__xlx_apatb_param_fifoSortMatrixC_o_0_stream_buf_size+j])[0];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_0_V, s.append("\n")); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoSortMatrixC_o_0_stream_buf_final_size, &tcl_file.fifoSortMatrixC_o_0_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_0_V, __xlx_sprintf_buffer.data());
}
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_0_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoSortMatrixC_o_0_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_0_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_0_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoSortMatrixC_o_1_stream_buf_final_size = ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_1)->size() - __xlx_apatb_param_fifoSortMatrixC_o_1_stream_buf_size;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_1)->empty())
    __xlx_apatb_param_fifoSortMatrixC_o_1_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_1)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoSortMatrixC_o_1_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_1)->write(__xlx_apatb_param_fifoSortMatrixC_o_1_stream_buf[i]);
  }
// print fifoSortMatrixC_o_1_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_1_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoSortMatrixC_o_1_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)&__xlx_apatb_param_fifoSortMatrixC_o_1_stream_buf[__xlx_apatb_param_fifoSortMatrixC_o_1_stream_buf_size+j])[0];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_1_V, s.append("\n")); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoSortMatrixC_o_1_stream_buf_final_size, &tcl_file.fifoSortMatrixC_o_1_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_1_V, __xlx_sprintf_buffer.data());
}
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_1_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoSortMatrixC_o_1_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_1_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_1_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoSortMatrixC_o_2_stream_buf_final_size = ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_2)->size() - __xlx_apatb_param_fifoSortMatrixC_o_2_stream_buf_size;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_2)->empty())
    __xlx_apatb_param_fifoSortMatrixC_o_2_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_2)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoSortMatrixC_o_2_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_2)->write(__xlx_apatb_param_fifoSortMatrixC_o_2_stream_buf[i]);
  }
// print fifoSortMatrixC_o_2_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_2_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoSortMatrixC_o_2_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)&__xlx_apatb_param_fifoSortMatrixC_o_2_stream_buf[__xlx_apatb_param_fifoSortMatrixC_o_2_stream_buf_size+j])[0];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_2_V, s.append("\n")); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoSortMatrixC_o_2_stream_buf_final_size, &tcl_file.fifoSortMatrixC_o_2_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_2_V, __xlx_sprintf_buffer.data());
}
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_2_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoSortMatrixC_o_2_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_2_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_2_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoSortMatrixC_o_3_stream_buf_final_size = ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_3)->size() - __xlx_apatb_param_fifoSortMatrixC_o_3_stream_buf_size;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_3)->empty())
    __xlx_apatb_param_fifoSortMatrixC_o_3_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_3)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoSortMatrixC_o_3_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_3)->write(__xlx_apatb_param_fifoSortMatrixC_o_3_stream_buf[i]);
  }
// print fifoSortMatrixC_o_3_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_3_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoSortMatrixC_o_3_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)&__xlx_apatb_param_fifoSortMatrixC_o_3_stream_buf[__xlx_apatb_param_fifoSortMatrixC_o_3_stream_buf_size+j])[0];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_3_V, s.append("\n")); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoSortMatrixC_o_3_stream_buf_final_size, &tcl_file.fifoSortMatrixC_o_3_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_3_V, __xlx_sprintf_buffer.data());
}
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_3_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoSortMatrixC_o_3_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_3_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_3_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoSortMatrixC_o_4_stream_buf_final_size = ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_4)->size() - __xlx_apatb_param_fifoSortMatrixC_o_4_stream_buf_size;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_4)->empty())
    __xlx_apatb_param_fifoSortMatrixC_o_4_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_4)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoSortMatrixC_o_4_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_4)->write(__xlx_apatb_param_fifoSortMatrixC_o_4_stream_buf[i]);
  }
// print fifoSortMatrixC_o_4_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_4_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoSortMatrixC_o_4_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)&__xlx_apatb_param_fifoSortMatrixC_o_4_stream_buf[__xlx_apatb_param_fifoSortMatrixC_o_4_stream_buf_size+j])[0];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_4_V, s.append("\n")); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoSortMatrixC_o_4_stream_buf_final_size, &tcl_file.fifoSortMatrixC_o_4_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_4_V, __xlx_sprintf_buffer.data());
}
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_4_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoSortMatrixC_o_4_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_4_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_4_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoSortMatrixC_o_5_stream_buf_final_size = ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_5)->size() - __xlx_apatb_param_fifoSortMatrixC_o_5_stream_buf_size;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_5)->empty())
    __xlx_apatb_param_fifoSortMatrixC_o_5_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_5)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoSortMatrixC_o_5_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_5)->write(__xlx_apatb_param_fifoSortMatrixC_o_5_stream_buf[i]);
  }
// print fifoSortMatrixC_o_5_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_5_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoSortMatrixC_o_5_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)&__xlx_apatb_param_fifoSortMatrixC_o_5_stream_buf[__xlx_apatb_param_fifoSortMatrixC_o_5_stream_buf_size+j])[0];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_5_V, s.append("\n")); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoSortMatrixC_o_5_stream_buf_final_size, &tcl_file.fifoSortMatrixC_o_5_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_5_V, __xlx_sprintf_buffer.data());
}
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_5_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoSortMatrixC_o_5_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_5_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_5_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoSortMatrixC_o_6_stream_buf_final_size = ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_6)->size() - __xlx_apatb_param_fifoSortMatrixC_o_6_stream_buf_size;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_6)->empty())
    __xlx_apatb_param_fifoSortMatrixC_o_6_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_6)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoSortMatrixC_o_6_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_6)->write(__xlx_apatb_param_fifoSortMatrixC_o_6_stream_buf[i]);
  }
// print fifoSortMatrixC_o_6_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_6_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoSortMatrixC_o_6_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)&__xlx_apatb_param_fifoSortMatrixC_o_6_stream_buf[__xlx_apatb_param_fifoSortMatrixC_o_6_stream_buf_size+j])[0];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_6_V, s.append("\n")); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoSortMatrixC_o_6_stream_buf_final_size, &tcl_file.fifoSortMatrixC_o_6_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_6_V, __xlx_sprintf_buffer.data());
}
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_6_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoSortMatrixC_o_6_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_6_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_6_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_fifoSortMatrixC_o_7_stream_buf_final_size = ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_7)->size() - __xlx_apatb_param_fifoSortMatrixC_o_7_stream_buf_size;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_7)->empty())
    __xlx_apatb_param_fifoSortMatrixC_o_7_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_7)->read());
  for (int i = 0; i < __xlx_apatb_param_fifoSortMatrixC_o_7_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_7)->write(__xlx_apatb_param_fifoSortMatrixC_o_7_stream_buf[i]);
  }
// print fifoSortMatrixC_o_7_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_7_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_fifoSortMatrixC_o_7_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)&__xlx_apatb_param_fifoSortMatrixC_o_7_stream_buf[__xlx_apatb_param_fifoSortMatrixC_o_7_stream_buf_size+j])[0];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_7_V, s.append("\n")); 
  }

  tcl_file.set_num(__xlx_apatb_param_fifoSortMatrixC_o_7_stream_buf_final_size, &tcl_file.fifoSortMatrixC_o_7_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_fifoSortMatrixC_o_7_V, __xlx_sprintf_buffer.data());
}
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_7_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_fifoSortMatrixC_o_7_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_7_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_fifoSortMatrixC_o_7_V, __xlx_sprintf_buffer.data());
}CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
