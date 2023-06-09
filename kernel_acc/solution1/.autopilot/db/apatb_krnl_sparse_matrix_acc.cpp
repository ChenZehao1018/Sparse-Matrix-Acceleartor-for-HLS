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
#define AUTOTB_TVIN_gmem0 "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvin_gmem0.dat"
#define AUTOTB_TVOUT_gmem0 "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvout_gmem0.dat"
// wrapc file define:
#define AUTOTB_TVIN_gmem1 "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvin_gmem1.dat"
#define AUTOTB_TVOUT_gmem1 "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvout_gmem1.dat"
// wrapc file define:
#define AUTOTB_TVIN_gmem2 "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvin_gmem2.dat"
#define AUTOTB_TVOUT_gmem2 "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvout_gmem2.dat"
// wrapc file define:
#define AUTOTB_TVIN_gmem3 "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvin_gmem3.dat"
#define AUTOTB_TVOUT_gmem3 "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvout_gmem3.dat"
// wrapc file define:
#define AUTOTB_TVIN_gmem4 "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvin_gmem4.dat"
#define AUTOTB_TVOUT_gmem4 "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvout_gmem4.dat"
// wrapc file define:
#define AUTOTB_TVIN_HLSPtr_i "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvin_HLSPtr_i.dat"
#define AUTOTB_TVOUT_HLSPtr_i "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvout_HLSPtr_i.dat"
// wrapc file define:
#define AUTOTB_TVIN_matrixA_hls_idx "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvin_matrixA_hls_idx.dat"
#define AUTOTB_TVOUT_matrixA_hls_idx "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvout_matrixA_hls_idx.dat"
// wrapc file define:
#define AUTOTB_TVIN_matrixA_i "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvin_matrixA_i.dat"
#define AUTOTB_TVOUT_matrixA_i "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvout_matrixA_i.dat"
// wrapc file define:
#define AUTOTB_TVIN_matrixB_i "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvin_matrixB_i.dat"
#define AUTOTB_TVOUT_matrixB_i "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvout_matrixB_i.dat"
// wrapc file define:
#define AUTOTB_TVIN_matrixC_o "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvin_matrixC_o.dat"
#define AUTOTB_TVOUT_matrixC_o "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvout_matrixC_o.dat"
// wrapc file define:
#define AUTOTB_TVIN_lenEdgeListPtr "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvin_lenEdgeListPtr.dat"
#define AUTOTB_TVOUT_lenEdgeListPtr "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvout_lenEdgeListPtr.dat"
// wrapc file define:
#define AUTOTB_TVIN_lenEdgePtr "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvin_lenEdgePtr.dat"
#define AUTOTB_TVOUT_lenEdgePtr "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvout_lenEdgePtr.dat"
// wrapc file define:
#define AUTOTB_TVIN_M "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvin_M.dat"
#define AUTOTB_TVOUT_M "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvout_M.dat"
// wrapc file define:
#define AUTOTB_TVIN_K "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvin_K.dat"
#define AUTOTB_TVOUT_K "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvout_K.dat"
// wrapc file define:
#define AUTOTB_TVIN_N "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvin_N.dat"
#define AUTOTB_TVOUT_N "../tv/cdatafile/c.krnl_sparse_matrix_acc.autotvout_N.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_gmem0 "../tv/rtldatafile/rtl.krnl_sparse_matrix_acc.autotvout_gmem0.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_gmem1 "../tv/rtldatafile/rtl.krnl_sparse_matrix_acc.autotvout_gmem1.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_gmem2 "../tv/rtldatafile/rtl.krnl_sparse_matrix_acc.autotvout_gmem2.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_gmem3 "../tv/rtldatafile/rtl.krnl_sparse_matrix_acc.autotvout_gmem3.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_gmem4 "../tv/rtldatafile/rtl.krnl_sparse_matrix_acc.autotvout_gmem4.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_HLSPtr_i "../tv/rtldatafile/rtl.krnl_sparse_matrix_acc.autotvout_HLSPtr_i.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_matrixA_hls_idx "../tv/rtldatafile/rtl.krnl_sparse_matrix_acc.autotvout_matrixA_hls_idx.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_matrixA_i "../tv/rtldatafile/rtl.krnl_sparse_matrix_acc.autotvout_matrixA_i.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_matrixB_i "../tv/rtldatafile/rtl.krnl_sparse_matrix_acc.autotvout_matrixB_i.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_matrixC_o "../tv/rtldatafile/rtl.krnl_sparse_matrix_acc.autotvout_matrixC_o.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_lenEdgeListPtr "../tv/rtldatafile/rtl.krnl_sparse_matrix_acc.autotvout_lenEdgeListPtr.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_lenEdgePtr "../tv/rtldatafile/rtl.krnl_sparse_matrix_acc.autotvout_lenEdgePtr.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_M "../tv/rtldatafile/rtl.krnl_sparse_matrix_acc.autotvout_M.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_K "../tv/rtldatafile/rtl.krnl_sparse_matrix_acc.autotvout_K.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_N "../tv/rtldatafile/rtl.krnl_sparse_matrix_acc.autotvout_N.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  gmem0_depth = 0;
  gmem1_depth = 0;
  gmem2_depth = 0;
  gmem3_depth = 0;
  gmem4_depth = 0;
  HLSPtr_i_depth = 0;
  matrixA_hls_idx_depth = 0;
  matrixA_i_depth = 0;
  matrixB_i_depth = 0;
  matrixC_o_depth = 0;
  lenEdgeListPtr_depth = 0;
  lenEdgePtr_depth = 0;
  M_depth = 0;
  K_depth = 0;
  N_depth = 0;
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
  total_list << "{gmem0 " << gmem0_depth << "}\n";
  total_list << "{gmem1 " << gmem1_depth << "}\n";
  total_list << "{gmem2 " << gmem2_depth << "}\n";
  total_list << "{gmem3 " << gmem3_depth << "}\n";
  total_list << "{gmem4 " << gmem4_depth << "}\n";
  total_list << "{HLSPtr_i " << HLSPtr_i_depth << "}\n";
  total_list << "{matrixA_hls_idx " << matrixA_hls_idx_depth << "}\n";
  total_list << "{matrixA_i " << matrixA_i_depth << "}\n";
  total_list << "{matrixB_i " << matrixB_i_depth << "}\n";
  total_list << "{matrixC_o " << matrixC_o_depth << "}\n";
  total_list << "{lenEdgeListPtr " << lenEdgeListPtr_depth << "}\n";
  total_list << "{lenEdgePtr " << lenEdgePtr_depth << "}\n";
  total_list << "{M " << M_depth << "}\n";
  total_list << "{K " << K_depth << "}\n";
  total_list << "{N " << N_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int gmem0_depth;
    int gmem1_depth;
    int gmem2_depth;
    int gmem3_depth;
    int gmem4_depth;
    int HLSPtr_i_depth;
    int matrixA_hls_idx_depth;
    int matrixA_i_depth;
    int matrixB_i_depth;
    int matrixC_o_depth;
    int lenEdgeListPtr_depth;
    int lenEdgePtr_depth;
    int M_depth;
    int K_depth;
    int N_depth;
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
extern "C" void krnl_sparse_matrix_acc_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, int, int, int, int, int);

extern "C" void apatb_krnl_sparse_matrix_acc_hw(volatile void * __xlx_apatb_param_HLSPtr_i, volatile void * __xlx_apatb_param_matrixA_hls_idx, volatile void * __xlx_apatb_param_matrixA_i, volatile void * __xlx_apatb_param_matrixB_i, volatile void * __xlx_apatb_param_matrixC_o, int __xlx_apatb_param_lenEdgeListPtr, int __xlx_apatb_param_lenEdgePtr, int __xlx_apatb_param_M, int __xlx_apatb_param_K, int __xlx_apatb_param_N) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_gmem4);
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
          std::vector<sc_bv<32> > gmem4_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "gmem4");
  
            // push token into output port buffer
            if (AESL_token != "") {
              gmem4_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 1; j < e; j += 1, ++i) {((char*)__xlx_apatb_param_matrixC_o)[j*4+0] = gmem4_pc_buffer[i].range(7, 0).to_int64();
((char*)__xlx_apatb_param_matrixC_o)[j*4+1] = gmem4_pc_buffer[i].range(15, 8).to_int64();
((char*)__xlx_apatb_param_matrixC_o)[j*4+2] = gmem4_pc_buffer[i].range(23, 16).to_int64();
((char*)__xlx_apatb_param_matrixC_o)[j*4+3] = gmem4_pc_buffer[i].range(31, 24).to_int64();
}}}
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
//gmem0
aesl_fh.touch(AUTOTB_TVIN_gmem0);
aesl_fh.touch(AUTOTB_TVOUT_gmem0);
//gmem1
aesl_fh.touch(AUTOTB_TVIN_gmem1);
aesl_fh.touch(AUTOTB_TVOUT_gmem1);
//gmem2
aesl_fh.touch(AUTOTB_TVIN_gmem2);
aesl_fh.touch(AUTOTB_TVOUT_gmem2);
//gmem3
aesl_fh.touch(AUTOTB_TVIN_gmem3);
aesl_fh.touch(AUTOTB_TVOUT_gmem3);
//gmem4
aesl_fh.touch(AUTOTB_TVIN_gmem4);
aesl_fh.touch(AUTOTB_TVOUT_gmem4);
//HLSPtr_i
aesl_fh.touch(AUTOTB_TVIN_HLSPtr_i);
aesl_fh.touch(AUTOTB_TVOUT_HLSPtr_i);
//matrixA_hls_idx
aesl_fh.touch(AUTOTB_TVIN_matrixA_hls_idx);
aesl_fh.touch(AUTOTB_TVOUT_matrixA_hls_idx);
//matrixA_i
aesl_fh.touch(AUTOTB_TVIN_matrixA_i);
aesl_fh.touch(AUTOTB_TVOUT_matrixA_i);
//matrixB_i
aesl_fh.touch(AUTOTB_TVIN_matrixB_i);
aesl_fh.touch(AUTOTB_TVOUT_matrixB_i);
//matrixC_o
aesl_fh.touch(AUTOTB_TVIN_matrixC_o);
aesl_fh.touch(AUTOTB_TVOUT_matrixC_o);
//lenEdgeListPtr
aesl_fh.touch(AUTOTB_TVIN_lenEdgeListPtr);
aesl_fh.touch(AUTOTB_TVOUT_lenEdgeListPtr);
//lenEdgePtr
aesl_fh.touch(AUTOTB_TVIN_lenEdgePtr);
aesl_fh.touch(AUTOTB_TVOUT_lenEdgePtr);
//M
aesl_fh.touch(AUTOTB_TVIN_M);
aesl_fh.touch(AUTOTB_TVOUT_M);
//K
aesl_fh.touch(AUTOTB_TVIN_K);
aesl_fh.touch(AUTOTB_TVOUT_K);
//N
aesl_fh.touch(AUTOTB_TVIN_N);
aesl_fh.touch(AUTOTB_TVOUT_N);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_HLSPtr_i = 0;
// print gmem0 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_gmem0, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_HLSPtr_i = 0*4;
  if (__xlx_apatb_param_HLSPtr_i) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_HLSPtr_i)[j];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_gmem0, s.append("\n")); 
      }
  }
}
  tcl_file.set_num(1, &tcl_file.gmem0_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_gmem0, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_matrixA_hls_idx = 0;
// print gmem1 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_gmem1, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_matrixA_hls_idx = 0*4;
  if (__xlx_apatb_param_matrixA_hls_idx) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_matrixA_hls_idx)[j];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_gmem1, s.append("\n")); 
      }
  }
}
  tcl_file.set_num(1, &tcl_file.gmem1_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_gmem1, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_matrixA_i = 0;
// print gmem2 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_gmem2, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_matrixA_i = 0*4;
  if (__xlx_apatb_param_matrixA_i) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_matrixA_i)[j];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_gmem2, s.append("\n")); 
      }
  }
}
  tcl_file.set_num(1, &tcl_file.gmem2_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_gmem2, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_matrixB_i = 0;
// print gmem3 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_gmem3, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_matrixB_i = 0*4;
  if (__xlx_apatb_param_matrixB_i) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_matrixB_i)[j];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_gmem3, s.append("\n")); 
      }
  }
}
  tcl_file.set_num(1, &tcl_file.gmem3_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_gmem3, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_matrixC_o = 0;
// print gmem4 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_gmem4, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_matrixC_o = 0*4;
  if (__xlx_apatb_param_matrixC_o) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_matrixC_o)[j];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_gmem4, s.append("\n")); 
      }
  }
}
  tcl_file.set_num(1, &tcl_file.gmem4_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_gmem4, __xlx_sprintf_buffer.data());
}
// print HLSPtr_i Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_HLSPtr_i, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_HLSPtr_i;

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_HLSPtr_i, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.HLSPtr_i_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_HLSPtr_i, __xlx_sprintf_buffer.data());
}
// print matrixA_hls_idx Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_matrixA_hls_idx, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_matrixA_hls_idx;

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_matrixA_hls_idx, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.matrixA_hls_idx_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_matrixA_hls_idx, __xlx_sprintf_buffer.data());
}
// print matrixA_i Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_matrixA_i, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_matrixA_i;

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_matrixA_i, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.matrixA_i_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_matrixA_i, __xlx_sprintf_buffer.data());
}
// print matrixB_i Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_matrixB_i, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_matrixB_i;

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_matrixB_i, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.matrixB_i_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_matrixB_i, __xlx_sprintf_buffer.data());
}
// print matrixC_o Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_matrixC_o, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_matrixC_o;

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_matrixC_o, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.matrixC_o_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_matrixC_o, __xlx_sprintf_buffer.data());
}
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
// print lenEdgePtr Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_lenEdgePtr, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)&__xlx_apatb_param_lenEdgePtr);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_lenEdgePtr, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.lenEdgePtr_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_lenEdgePtr, __xlx_sprintf_buffer.data());
}
// print M Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_M, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)&__xlx_apatb_param_M);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_M, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.M_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_M, __xlx_sprintf_buffer.data());
}
// print K Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_K, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)&__xlx_apatb_param_K);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_K, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.K_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_K, __xlx_sprintf_buffer.data());
}
// print N Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_N, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)&__xlx_apatb_param_N);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_N, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.N_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_N, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
krnl_sparse_matrix_acc_hw_stub_wrapper(__xlx_apatb_param_HLSPtr_i, __xlx_apatb_param_matrixA_hls_idx, __xlx_apatb_param_matrixA_i, __xlx_apatb_param_matrixB_i, __xlx_apatb_param_matrixC_o, __xlx_apatb_param_lenEdgeListPtr, __xlx_apatb_param_lenEdgePtr, __xlx_apatb_param_M, __xlx_apatb_param_K, __xlx_apatb_param_N);
CodeState = DUMP_OUTPUTS;
// print gmem4 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_gmem4, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_matrixC_o = 0*4;
  if (__xlx_apatb_param_matrixC_o) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_matrixC_o)[j];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_gmem4, s.append("\n")); 
      }
  }
}
  tcl_file.set_num(1, &tcl_file.gmem4_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_gmem4, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
