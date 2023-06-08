#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
unsigned int ap_apatb_fifoEdgeListPtr_i_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoEdgeListPtr_i_V_size_Reader("../tv/stream_size/stream_size_in_fifoEdgeListPtr_i_V.dat");
unsigned int ap_apatb_fifoMatrixCIdx_i_0_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoMatrixCIdx_i_0_V_size_Reader("../tv/stream_size/stream_size_in_fifoMatrixCIdx_i_0_V.dat");
unsigned int ap_apatb_fifoMatrixCIdx_i_1_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoMatrixCIdx_i_1_V_size_Reader("../tv/stream_size/stream_size_in_fifoMatrixCIdx_i_1_V.dat");
unsigned int ap_apatb_fifoMatrixCIdx_i_2_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoMatrixCIdx_i_2_V_size_Reader("../tv/stream_size/stream_size_in_fifoMatrixCIdx_i_2_V.dat");
unsigned int ap_apatb_fifoMatrixCIdx_i_3_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoMatrixCIdx_i_3_V_size_Reader("../tv/stream_size/stream_size_in_fifoMatrixCIdx_i_3_V.dat");
unsigned int ap_apatb_fifoMatrixCIdx_i_4_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoMatrixCIdx_i_4_V_size_Reader("../tv/stream_size/stream_size_in_fifoMatrixCIdx_i_4_V.dat");
unsigned int ap_apatb_fifoMatrixCIdx_i_5_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoMatrixCIdx_i_5_V_size_Reader("../tv/stream_size/stream_size_in_fifoMatrixCIdx_i_5_V.dat");
unsigned int ap_apatb_fifoMatrixCIdx_i_6_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoMatrixCIdx_i_6_V_size_Reader("../tv/stream_size/stream_size_in_fifoMatrixCIdx_i_6_V.dat");
unsigned int ap_apatb_fifoMatrixCIdx_i_7_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoMatrixCIdx_i_7_V_size_Reader("../tv/stream_size/stream_size_in_fifoMatrixCIdx_i_7_V.dat");
unsigned int ap_apatb_fifoCalcMatrixC_i_0_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoCalcMatrixC_i_0_V_size_Reader("../tv/stream_size/stream_size_in_fifoCalcMatrixC_i_0_V.dat");
unsigned int ap_apatb_fifoCalcMatrixC_i_1_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoCalcMatrixC_i_1_V_size_Reader("../tv/stream_size/stream_size_in_fifoCalcMatrixC_i_1_V.dat");
unsigned int ap_apatb_fifoCalcMatrixC_i_2_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoCalcMatrixC_i_2_V_size_Reader("../tv/stream_size/stream_size_in_fifoCalcMatrixC_i_2_V.dat");
unsigned int ap_apatb_fifoCalcMatrixC_i_3_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoCalcMatrixC_i_3_V_size_Reader("../tv/stream_size/stream_size_in_fifoCalcMatrixC_i_3_V.dat");
unsigned int ap_apatb_fifoCalcMatrixC_i_4_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoCalcMatrixC_i_4_V_size_Reader("../tv/stream_size/stream_size_in_fifoCalcMatrixC_i_4_V.dat");
unsigned int ap_apatb_fifoCalcMatrixC_i_5_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoCalcMatrixC_i_5_V_size_Reader("../tv/stream_size/stream_size_in_fifoCalcMatrixC_i_5_V.dat");
unsigned int ap_apatb_fifoCalcMatrixC_i_6_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoCalcMatrixC_i_6_V_size_Reader("../tv/stream_size/stream_size_in_fifoCalcMatrixC_i_6_V.dat");
unsigned int ap_apatb_fifoCalcMatrixC_i_7_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoCalcMatrixC_i_7_V_size_Reader("../tv/stream_size/stream_size_in_fifoCalcMatrixC_i_7_V.dat");
unsigned int ap_apatb_fifoSortMatrixC_o_0_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoSortMatrixC_o_0_V_size_Reader("../tv/stream_size/stream_size_out_fifoSortMatrixC_o_0_V.dat");
unsigned int ap_apatb_fifoSortMatrixC_o_1_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoSortMatrixC_o_1_V_size_Reader("../tv/stream_size/stream_size_out_fifoSortMatrixC_o_1_V.dat");
unsigned int ap_apatb_fifoSortMatrixC_o_2_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoSortMatrixC_o_2_V_size_Reader("../tv/stream_size/stream_size_out_fifoSortMatrixC_o_2_V.dat");
unsigned int ap_apatb_fifoSortMatrixC_o_3_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoSortMatrixC_o_3_V_size_Reader("../tv/stream_size/stream_size_out_fifoSortMatrixC_o_3_V.dat");
unsigned int ap_apatb_fifoSortMatrixC_o_4_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoSortMatrixC_o_4_V_size_Reader("../tv/stream_size/stream_size_out_fifoSortMatrixC_o_4_V.dat");
unsigned int ap_apatb_fifoSortMatrixC_o_5_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoSortMatrixC_o_5_V_size_Reader("../tv/stream_size/stream_size_out_fifoSortMatrixC_o_5_V.dat");
unsigned int ap_apatb_fifoSortMatrixC_o_6_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoSortMatrixC_o_6_V_size_Reader("../tv/stream_size/stream_size_out_fifoSortMatrixC_o_6_V.dat");
unsigned int ap_apatb_fifoSortMatrixC_o_7_V_cap_bc;
static AESL_RUNTIME_BC __xlx_fifoSortMatrixC_o_7_V_size_Reader("../tv/stream_size/stream_size_out_fifoSortMatrixC_o_7_V.dat");
struct __cosim_s4__ { char data[4]; };
extern "C" void sort_C(int, __cosim_s4__*, short*, short*, short*, short*, short*, short*, short*, short*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*, int*);
extern "C" void apatb_sort_C_hw(int __xlx_apatb_param_lenEdgeListPtr, volatile void * __xlx_apatb_param_fifoEdgeListPtr_i, volatile void * __xlx_apatb_param_fifoMatrixCIdx_i_0, volatile void * __xlx_apatb_param_fifoMatrixCIdx_i_1, volatile void * __xlx_apatb_param_fifoMatrixCIdx_i_2, volatile void * __xlx_apatb_param_fifoMatrixCIdx_i_3, volatile void * __xlx_apatb_param_fifoMatrixCIdx_i_4, volatile void * __xlx_apatb_param_fifoMatrixCIdx_i_5, volatile void * __xlx_apatb_param_fifoMatrixCIdx_i_6, volatile void * __xlx_apatb_param_fifoMatrixCIdx_i_7, volatile void * __xlx_apatb_param_fifoCalcMatrixC_i_0, volatile void * __xlx_apatb_param_fifoCalcMatrixC_i_1, volatile void * __xlx_apatb_param_fifoCalcMatrixC_i_2, volatile void * __xlx_apatb_param_fifoCalcMatrixC_i_3, volatile void * __xlx_apatb_param_fifoCalcMatrixC_i_4, volatile void * __xlx_apatb_param_fifoCalcMatrixC_i_5, volatile void * __xlx_apatb_param_fifoCalcMatrixC_i_6, volatile void * __xlx_apatb_param_fifoCalcMatrixC_i_7, volatile void * __xlx_apatb_param_fifoSortMatrixC_o_0, volatile void * __xlx_apatb_param_fifoSortMatrixC_o_1, volatile void * __xlx_apatb_param_fifoSortMatrixC_o_2, volatile void * __xlx_apatb_param_fifoSortMatrixC_o_3, volatile void * __xlx_apatb_param_fifoSortMatrixC_o_4, volatile void * __xlx_apatb_param_fifoSortMatrixC_o_5, volatile void * __xlx_apatb_param_fifoSortMatrixC_o_6, volatile void * __xlx_apatb_param_fifoSortMatrixC_o_7) {
  // collect __xlx_fifoEdgeListPtr_i_tmp_vec
  unsigned __xlx_fifoEdgeListPtr_i_V_tmp_Count = 0;
  unsigned __xlx_fifoEdgeListPtr_i_V_read_Size = __xlx_fifoEdgeListPtr_i_V_size_Reader.read_size();
  vector<__cosim_s4__> __xlx_fifoEdgeListPtr_i_tmp_vec;
  while (!((hls::stream<__cosim_s4__>*)__xlx_apatb_param_fifoEdgeListPtr_i)->empty() && __xlx_fifoEdgeListPtr_i_V_tmp_Count < __xlx_fifoEdgeListPtr_i_V_read_Size) {
    __xlx_fifoEdgeListPtr_i_tmp_vec.push_back(((hls::stream<__cosim_s4__>*)__xlx_apatb_param_fifoEdgeListPtr_i)->read());
    __xlx_fifoEdgeListPtr_i_V_tmp_Count++;
  }
  ap_apatb_fifoEdgeListPtr_i_V_cap_bc = __xlx_fifoEdgeListPtr_i_tmp_vec.size();
  // store input buffer
  __cosim_s4__* __xlx_fifoEdgeListPtr_i_input_buffer= new __cosim_s4__[__xlx_fifoEdgeListPtr_i_tmp_vec.size()];
  for (int i = 0; i < __xlx_fifoEdgeListPtr_i_tmp_vec.size(); ++i) {
    __xlx_fifoEdgeListPtr_i_input_buffer[i] = __xlx_fifoEdgeListPtr_i_tmp_vec[i];
  }
  // collect __xlx_fifoMatrixCIdx_i_0_tmp_vec
  unsigned __xlx_fifoMatrixCIdx_i_0_V_tmp_Count = 0;
  unsigned __xlx_fifoMatrixCIdx_i_0_V_read_Size = __xlx_fifoMatrixCIdx_i_0_V_size_Reader.read_size();
  vector<short> __xlx_fifoMatrixCIdx_i_0_tmp_vec;
  while (!((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_0)->empty() && __xlx_fifoMatrixCIdx_i_0_V_tmp_Count < __xlx_fifoMatrixCIdx_i_0_V_read_Size) {
    __xlx_fifoMatrixCIdx_i_0_tmp_vec.push_back(((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_0)->read());
    __xlx_fifoMatrixCIdx_i_0_V_tmp_Count++;
  }
  ap_apatb_fifoMatrixCIdx_i_0_V_cap_bc = __xlx_fifoMatrixCIdx_i_0_tmp_vec.size();
  // store input buffer
  short* __xlx_fifoMatrixCIdx_i_0_input_buffer= new short[__xlx_fifoMatrixCIdx_i_0_tmp_vec.size()];
  for (int i = 0; i < __xlx_fifoMatrixCIdx_i_0_tmp_vec.size(); ++i) {
    __xlx_fifoMatrixCIdx_i_0_input_buffer[i] = __xlx_fifoMatrixCIdx_i_0_tmp_vec[i];
  }
  // collect __xlx_fifoMatrixCIdx_i_1_tmp_vec
  unsigned __xlx_fifoMatrixCIdx_i_1_V_tmp_Count = 0;
  unsigned __xlx_fifoMatrixCIdx_i_1_V_read_Size = __xlx_fifoMatrixCIdx_i_1_V_size_Reader.read_size();
  vector<short> __xlx_fifoMatrixCIdx_i_1_tmp_vec;
  while (!((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_1)->empty() && __xlx_fifoMatrixCIdx_i_1_V_tmp_Count < __xlx_fifoMatrixCIdx_i_1_V_read_Size) {
    __xlx_fifoMatrixCIdx_i_1_tmp_vec.push_back(((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_1)->read());
    __xlx_fifoMatrixCIdx_i_1_V_tmp_Count++;
  }
  ap_apatb_fifoMatrixCIdx_i_1_V_cap_bc = __xlx_fifoMatrixCIdx_i_1_tmp_vec.size();
  // store input buffer
  short* __xlx_fifoMatrixCIdx_i_1_input_buffer= new short[__xlx_fifoMatrixCIdx_i_1_tmp_vec.size()];
  for (int i = 0; i < __xlx_fifoMatrixCIdx_i_1_tmp_vec.size(); ++i) {
    __xlx_fifoMatrixCIdx_i_1_input_buffer[i] = __xlx_fifoMatrixCIdx_i_1_tmp_vec[i];
  }
  // collect __xlx_fifoMatrixCIdx_i_2_tmp_vec
  unsigned __xlx_fifoMatrixCIdx_i_2_V_tmp_Count = 0;
  unsigned __xlx_fifoMatrixCIdx_i_2_V_read_Size = __xlx_fifoMatrixCIdx_i_2_V_size_Reader.read_size();
  vector<short> __xlx_fifoMatrixCIdx_i_2_tmp_vec;
  while (!((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_2)->empty() && __xlx_fifoMatrixCIdx_i_2_V_tmp_Count < __xlx_fifoMatrixCIdx_i_2_V_read_Size) {
    __xlx_fifoMatrixCIdx_i_2_tmp_vec.push_back(((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_2)->read());
    __xlx_fifoMatrixCIdx_i_2_V_tmp_Count++;
  }
  ap_apatb_fifoMatrixCIdx_i_2_V_cap_bc = __xlx_fifoMatrixCIdx_i_2_tmp_vec.size();
  // store input buffer
  short* __xlx_fifoMatrixCIdx_i_2_input_buffer= new short[__xlx_fifoMatrixCIdx_i_2_tmp_vec.size()];
  for (int i = 0; i < __xlx_fifoMatrixCIdx_i_2_tmp_vec.size(); ++i) {
    __xlx_fifoMatrixCIdx_i_2_input_buffer[i] = __xlx_fifoMatrixCIdx_i_2_tmp_vec[i];
  }
  // collect __xlx_fifoMatrixCIdx_i_3_tmp_vec
  unsigned __xlx_fifoMatrixCIdx_i_3_V_tmp_Count = 0;
  unsigned __xlx_fifoMatrixCIdx_i_3_V_read_Size = __xlx_fifoMatrixCIdx_i_3_V_size_Reader.read_size();
  vector<short> __xlx_fifoMatrixCIdx_i_3_tmp_vec;
  while (!((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_3)->empty() && __xlx_fifoMatrixCIdx_i_3_V_tmp_Count < __xlx_fifoMatrixCIdx_i_3_V_read_Size) {
    __xlx_fifoMatrixCIdx_i_3_tmp_vec.push_back(((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_3)->read());
    __xlx_fifoMatrixCIdx_i_3_V_tmp_Count++;
  }
  ap_apatb_fifoMatrixCIdx_i_3_V_cap_bc = __xlx_fifoMatrixCIdx_i_3_tmp_vec.size();
  // store input buffer
  short* __xlx_fifoMatrixCIdx_i_3_input_buffer= new short[__xlx_fifoMatrixCIdx_i_3_tmp_vec.size()];
  for (int i = 0; i < __xlx_fifoMatrixCIdx_i_3_tmp_vec.size(); ++i) {
    __xlx_fifoMatrixCIdx_i_3_input_buffer[i] = __xlx_fifoMatrixCIdx_i_3_tmp_vec[i];
  }
  // collect __xlx_fifoMatrixCIdx_i_4_tmp_vec
  unsigned __xlx_fifoMatrixCIdx_i_4_V_tmp_Count = 0;
  unsigned __xlx_fifoMatrixCIdx_i_4_V_read_Size = __xlx_fifoMatrixCIdx_i_4_V_size_Reader.read_size();
  vector<short> __xlx_fifoMatrixCIdx_i_4_tmp_vec;
  while (!((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_4)->empty() && __xlx_fifoMatrixCIdx_i_4_V_tmp_Count < __xlx_fifoMatrixCIdx_i_4_V_read_Size) {
    __xlx_fifoMatrixCIdx_i_4_tmp_vec.push_back(((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_4)->read());
    __xlx_fifoMatrixCIdx_i_4_V_tmp_Count++;
  }
  ap_apatb_fifoMatrixCIdx_i_4_V_cap_bc = __xlx_fifoMatrixCIdx_i_4_tmp_vec.size();
  // store input buffer
  short* __xlx_fifoMatrixCIdx_i_4_input_buffer= new short[__xlx_fifoMatrixCIdx_i_4_tmp_vec.size()];
  for (int i = 0; i < __xlx_fifoMatrixCIdx_i_4_tmp_vec.size(); ++i) {
    __xlx_fifoMatrixCIdx_i_4_input_buffer[i] = __xlx_fifoMatrixCIdx_i_4_tmp_vec[i];
  }
  // collect __xlx_fifoMatrixCIdx_i_5_tmp_vec
  unsigned __xlx_fifoMatrixCIdx_i_5_V_tmp_Count = 0;
  unsigned __xlx_fifoMatrixCIdx_i_5_V_read_Size = __xlx_fifoMatrixCIdx_i_5_V_size_Reader.read_size();
  vector<short> __xlx_fifoMatrixCIdx_i_5_tmp_vec;
  while (!((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_5)->empty() && __xlx_fifoMatrixCIdx_i_5_V_tmp_Count < __xlx_fifoMatrixCIdx_i_5_V_read_Size) {
    __xlx_fifoMatrixCIdx_i_5_tmp_vec.push_back(((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_5)->read());
    __xlx_fifoMatrixCIdx_i_5_V_tmp_Count++;
  }
  ap_apatb_fifoMatrixCIdx_i_5_V_cap_bc = __xlx_fifoMatrixCIdx_i_5_tmp_vec.size();
  // store input buffer
  short* __xlx_fifoMatrixCIdx_i_5_input_buffer= new short[__xlx_fifoMatrixCIdx_i_5_tmp_vec.size()];
  for (int i = 0; i < __xlx_fifoMatrixCIdx_i_5_tmp_vec.size(); ++i) {
    __xlx_fifoMatrixCIdx_i_5_input_buffer[i] = __xlx_fifoMatrixCIdx_i_5_tmp_vec[i];
  }
  // collect __xlx_fifoMatrixCIdx_i_6_tmp_vec
  unsigned __xlx_fifoMatrixCIdx_i_6_V_tmp_Count = 0;
  unsigned __xlx_fifoMatrixCIdx_i_6_V_read_Size = __xlx_fifoMatrixCIdx_i_6_V_size_Reader.read_size();
  vector<short> __xlx_fifoMatrixCIdx_i_6_tmp_vec;
  while (!((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_6)->empty() && __xlx_fifoMatrixCIdx_i_6_V_tmp_Count < __xlx_fifoMatrixCIdx_i_6_V_read_Size) {
    __xlx_fifoMatrixCIdx_i_6_tmp_vec.push_back(((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_6)->read());
    __xlx_fifoMatrixCIdx_i_6_V_tmp_Count++;
  }
  ap_apatb_fifoMatrixCIdx_i_6_V_cap_bc = __xlx_fifoMatrixCIdx_i_6_tmp_vec.size();
  // store input buffer
  short* __xlx_fifoMatrixCIdx_i_6_input_buffer= new short[__xlx_fifoMatrixCIdx_i_6_tmp_vec.size()];
  for (int i = 0; i < __xlx_fifoMatrixCIdx_i_6_tmp_vec.size(); ++i) {
    __xlx_fifoMatrixCIdx_i_6_input_buffer[i] = __xlx_fifoMatrixCIdx_i_6_tmp_vec[i];
  }
  // collect __xlx_fifoMatrixCIdx_i_7_tmp_vec
  unsigned __xlx_fifoMatrixCIdx_i_7_V_tmp_Count = 0;
  unsigned __xlx_fifoMatrixCIdx_i_7_V_read_Size = __xlx_fifoMatrixCIdx_i_7_V_size_Reader.read_size();
  vector<short> __xlx_fifoMatrixCIdx_i_7_tmp_vec;
  while (!((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_7)->empty() && __xlx_fifoMatrixCIdx_i_7_V_tmp_Count < __xlx_fifoMatrixCIdx_i_7_V_read_Size) {
    __xlx_fifoMatrixCIdx_i_7_tmp_vec.push_back(((hls::stream<short>*)__xlx_apatb_param_fifoMatrixCIdx_i_7)->read());
    __xlx_fifoMatrixCIdx_i_7_V_tmp_Count++;
  }
  ap_apatb_fifoMatrixCIdx_i_7_V_cap_bc = __xlx_fifoMatrixCIdx_i_7_tmp_vec.size();
  // store input buffer
  short* __xlx_fifoMatrixCIdx_i_7_input_buffer= new short[__xlx_fifoMatrixCIdx_i_7_tmp_vec.size()];
  for (int i = 0; i < __xlx_fifoMatrixCIdx_i_7_tmp_vec.size(); ++i) {
    __xlx_fifoMatrixCIdx_i_7_input_buffer[i] = __xlx_fifoMatrixCIdx_i_7_tmp_vec[i];
  }
  // collect __xlx_fifoCalcMatrixC_i_0_tmp_vec
  unsigned __xlx_fifoCalcMatrixC_i_0_V_tmp_Count = 0;
  unsigned __xlx_fifoCalcMatrixC_i_0_V_read_Size = __xlx_fifoCalcMatrixC_i_0_V_size_Reader.read_size();
  vector<int> __xlx_fifoCalcMatrixC_i_0_tmp_vec;
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_0)->empty() && __xlx_fifoCalcMatrixC_i_0_V_tmp_Count < __xlx_fifoCalcMatrixC_i_0_V_read_Size) {
    __xlx_fifoCalcMatrixC_i_0_tmp_vec.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_0)->read());
    __xlx_fifoCalcMatrixC_i_0_V_tmp_Count++;
  }
  ap_apatb_fifoCalcMatrixC_i_0_V_cap_bc = __xlx_fifoCalcMatrixC_i_0_tmp_vec.size();
  // store input buffer
  int* __xlx_fifoCalcMatrixC_i_0_input_buffer= new int[__xlx_fifoCalcMatrixC_i_0_tmp_vec.size()];
  for (int i = 0; i < __xlx_fifoCalcMatrixC_i_0_tmp_vec.size(); ++i) {
    __xlx_fifoCalcMatrixC_i_0_input_buffer[i] = __xlx_fifoCalcMatrixC_i_0_tmp_vec[i];
  }
  // collect __xlx_fifoCalcMatrixC_i_1_tmp_vec
  unsigned __xlx_fifoCalcMatrixC_i_1_V_tmp_Count = 0;
  unsigned __xlx_fifoCalcMatrixC_i_1_V_read_Size = __xlx_fifoCalcMatrixC_i_1_V_size_Reader.read_size();
  vector<int> __xlx_fifoCalcMatrixC_i_1_tmp_vec;
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_1)->empty() && __xlx_fifoCalcMatrixC_i_1_V_tmp_Count < __xlx_fifoCalcMatrixC_i_1_V_read_Size) {
    __xlx_fifoCalcMatrixC_i_1_tmp_vec.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_1)->read());
    __xlx_fifoCalcMatrixC_i_1_V_tmp_Count++;
  }
  ap_apatb_fifoCalcMatrixC_i_1_V_cap_bc = __xlx_fifoCalcMatrixC_i_1_tmp_vec.size();
  // store input buffer
  int* __xlx_fifoCalcMatrixC_i_1_input_buffer= new int[__xlx_fifoCalcMatrixC_i_1_tmp_vec.size()];
  for (int i = 0; i < __xlx_fifoCalcMatrixC_i_1_tmp_vec.size(); ++i) {
    __xlx_fifoCalcMatrixC_i_1_input_buffer[i] = __xlx_fifoCalcMatrixC_i_1_tmp_vec[i];
  }
  // collect __xlx_fifoCalcMatrixC_i_2_tmp_vec
  unsigned __xlx_fifoCalcMatrixC_i_2_V_tmp_Count = 0;
  unsigned __xlx_fifoCalcMatrixC_i_2_V_read_Size = __xlx_fifoCalcMatrixC_i_2_V_size_Reader.read_size();
  vector<int> __xlx_fifoCalcMatrixC_i_2_tmp_vec;
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_2)->empty() && __xlx_fifoCalcMatrixC_i_2_V_tmp_Count < __xlx_fifoCalcMatrixC_i_2_V_read_Size) {
    __xlx_fifoCalcMatrixC_i_2_tmp_vec.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_2)->read());
    __xlx_fifoCalcMatrixC_i_2_V_tmp_Count++;
  }
  ap_apatb_fifoCalcMatrixC_i_2_V_cap_bc = __xlx_fifoCalcMatrixC_i_2_tmp_vec.size();
  // store input buffer
  int* __xlx_fifoCalcMatrixC_i_2_input_buffer= new int[__xlx_fifoCalcMatrixC_i_2_tmp_vec.size()];
  for (int i = 0; i < __xlx_fifoCalcMatrixC_i_2_tmp_vec.size(); ++i) {
    __xlx_fifoCalcMatrixC_i_2_input_buffer[i] = __xlx_fifoCalcMatrixC_i_2_tmp_vec[i];
  }
  // collect __xlx_fifoCalcMatrixC_i_3_tmp_vec
  unsigned __xlx_fifoCalcMatrixC_i_3_V_tmp_Count = 0;
  unsigned __xlx_fifoCalcMatrixC_i_3_V_read_Size = __xlx_fifoCalcMatrixC_i_3_V_size_Reader.read_size();
  vector<int> __xlx_fifoCalcMatrixC_i_3_tmp_vec;
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_3)->empty() && __xlx_fifoCalcMatrixC_i_3_V_tmp_Count < __xlx_fifoCalcMatrixC_i_3_V_read_Size) {
    __xlx_fifoCalcMatrixC_i_3_tmp_vec.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_3)->read());
    __xlx_fifoCalcMatrixC_i_3_V_tmp_Count++;
  }
  ap_apatb_fifoCalcMatrixC_i_3_V_cap_bc = __xlx_fifoCalcMatrixC_i_3_tmp_vec.size();
  // store input buffer
  int* __xlx_fifoCalcMatrixC_i_3_input_buffer= new int[__xlx_fifoCalcMatrixC_i_3_tmp_vec.size()];
  for (int i = 0; i < __xlx_fifoCalcMatrixC_i_3_tmp_vec.size(); ++i) {
    __xlx_fifoCalcMatrixC_i_3_input_buffer[i] = __xlx_fifoCalcMatrixC_i_3_tmp_vec[i];
  }
  // collect __xlx_fifoCalcMatrixC_i_4_tmp_vec
  unsigned __xlx_fifoCalcMatrixC_i_4_V_tmp_Count = 0;
  unsigned __xlx_fifoCalcMatrixC_i_4_V_read_Size = __xlx_fifoCalcMatrixC_i_4_V_size_Reader.read_size();
  vector<int> __xlx_fifoCalcMatrixC_i_4_tmp_vec;
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_4)->empty() && __xlx_fifoCalcMatrixC_i_4_V_tmp_Count < __xlx_fifoCalcMatrixC_i_4_V_read_Size) {
    __xlx_fifoCalcMatrixC_i_4_tmp_vec.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_4)->read());
    __xlx_fifoCalcMatrixC_i_4_V_tmp_Count++;
  }
  ap_apatb_fifoCalcMatrixC_i_4_V_cap_bc = __xlx_fifoCalcMatrixC_i_4_tmp_vec.size();
  // store input buffer
  int* __xlx_fifoCalcMatrixC_i_4_input_buffer= new int[__xlx_fifoCalcMatrixC_i_4_tmp_vec.size()];
  for (int i = 0; i < __xlx_fifoCalcMatrixC_i_4_tmp_vec.size(); ++i) {
    __xlx_fifoCalcMatrixC_i_4_input_buffer[i] = __xlx_fifoCalcMatrixC_i_4_tmp_vec[i];
  }
  // collect __xlx_fifoCalcMatrixC_i_5_tmp_vec
  unsigned __xlx_fifoCalcMatrixC_i_5_V_tmp_Count = 0;
  unsigned __xlx_fifoCalcMatrixC_i_5_V_read_Size = __xlx_fifoCalcMatrixC_i_5_V_size_Reader.read_size();
  vector<int> __xlx_fifoCalcMatrixC_i_5_tmp_vec;
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_5)->empty() && __xlx_fifoCalcMatrixC_i_5_V_tmp_Count < __xlx_fifoCalcMatrixC_i_5_V_read_Size) {
    __xlx_fifoCalcMatrixC_i_5_tmp_vec.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_5)->read());
    __xlx_fifoCalcMatrixC_i_5_V_tmp_Count++;
  }
  ap_apatb_fifoCalcMatrixC_i_5_V_cap_bc = __xlx_fifoCalcMatrixC_i_5_tmp_vec.size();
  // store input buffer
  int* __xlx_fifoCalcMatrixC_i_5_input_buffer= new int[__xlx_fifoCalcMatrixC_i_5_tmp_vec.size()];
  for (int i = 0; i < __xlx_fifoCalcMatrixC_i_5_tmp_vec.size(); ++i) {
    __xlx_fifoCalcMatrixC_i_5_input_buffer[i] = __xlx_fifoCalcMatrixC_i_5_tmp_vec[i];
  }
  // collect __xlx_fifoCalcMatrixC_i_6_tmp_vec
  unsigned __xlx_fifoCalcMatrixC_i_6_V_tmp_Count = 0;
  unsigned __xlx_fifoCalcMatrixC_i_6_V_read_Size = __xlx_fifoCalcMatrixC_i_6_V_size_Reader.read_size();
  vector<int> __xlx_fifoCalcMatrixC_i_6_tmp_vec;
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_6)->empty() && __xlx_fifoCalcMatrixC_i_6_V_tmp_Count < __xlx_fifoCalcMatrixC_i_6_V_read_Size) {
    __xlx_fifoCalcMatrixC_i_6_tmp_vec.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_6)->read());
    __xlx_fifoCalcMatrixC_i_6_V_tmp_Count++;
  }
  ap_apatb_fifoCalcMatrixC_i_6_V_cap_bc = __xlx_fifoCalcMatrixC_i_6_tmp_vec.size();
  // store input buffer
  int* __xlx_fifoCalcMatrixC_i_6_input_buffer= new int[__xlx_fifoCalcMatrixC_i_6_tmp_vec.size()];
  for (int i = 0; i < __xlx_fifoCalcMatrixC_i_6_tmp_vec.size(); ++i) {
    __xlx_fifoCalcMatrixC_i_6_input_buffer[i] = __xlx_fifoCalcMatrixC_i_6_tmp_vec[i];
  }
  // collect __xlx_fifoCalcMatrixC_i_7_tmp_vec
  unsigned __xlx_fifoCalcMatrixC_i_7_V_tmp_Count = 0;
  unsigned __xlx_fifoCalcMatrixC_i_7_V_read_Size = __xlx_fifoCalcMatrixC_i_7_V_size_Reader.read_size();
  vector<int> __xlx_fifoCalcMatrixC_i_7_tmp_vec;
  while (!((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_7)->empty() && __xlx_fifoCalcMatrixC_i_7_V_tmp_Count < __xlx_fifoCalcMatrixC_i_7_V_read_Size) {
    __xlx_fifoCalcMatrixC_i_7_tmp_vec.push_back(((hls::stream<int>*)__xlx_apatb_param_fifoCalcMatrixC_i_7)->read());
    __xlx_fifoCalcMatrixC_i_7_V_tmp_Count++;
  }
  ap_apatb_fifoCalcMatrixC_i_7_V_cap_bc = __xlx_fifoCalcMatrixC_i_7_tmp_vec.size();
  // store input buffer
  int* __xlx_fifoCalcMatrixC_i_7_input_buffer= new int[__xlx_fifoCalcMatrixC_i_7_tmp_vec.size()];
  for (int i = 0; i < __xlx_fifoCalcMatrixC_i_7_tmp_vec.size(); ++i) {
    __xlx_fifoCalcMatrixC_i_7_input_buffer[i] = __xlx_fifoCalcMatrixC_i_7_tmp_vec[i];
  }
  //Create input buffer for fifoSortMatrixC_o_0
  ap_apatb_fifoSortMatrixC_o_0_V_cap_bc = __xlx_fifoSortMatrixC_o_0_V_size_Reader.read_size();
  int* __xlx_fifoSortMatrixC_o_0_input_buffer= new int[ap_apatb_fifoSortMatrixC_o_0_V_cap_bc];
  //Create input buffer for fifoSortMatrixC_o_1
  ap_apatb_fifoSortMatrixC_o_1_V_cap_bc = __xlx_fifoSortMatrixC_o_1_V_size_Reader.read_size();
  int* __xlx_fifoSortMatrixC_o_1_input_buffer= new int[ap_apatb_fifoSortMatrixC_o_1_V_cap_bc];
  //Create input buffer for fifoSortMatrixC_o_2
  ap_apatb_fifoSortMatrixC_o_2_V_cap_bc = __xlx_fifoSortMatrixC_o_2_V_size_Reader.read_size();
  int* __xlx_fifoSortMatrixC_o_2_input_buffer= new int[ap_apatb_fifoSortMatrixC_o_2_V_cap_bc];
  //Create input buffer for fifoSortMatrixC_o_3
  ap_apatb_fifoSortMatrixC_o_3_V_cap_bc = __xlx_fifoSortMatrixC_o_3_V_size_Reader.read_size();
  int* __xlx_fifoSortMatrixC_o_3_input_buffer= new int[ap_apatb_fifoSortMatrixC_o_3_V_cap_bc];
  //Create input buffer for fifoSortMatrixC_o_4
  ap_apatb_fifoSortMatrixC_o_4_V_cap_bc = __xlx_fifoSortMatrixC_o_4_V_size_Reader.read_size();
  int* __xlx_fifoSortMatrixC_o_4_input_buffer= new int[ap_apatb_fifoSortMatrixC_o_4_V_cap_bc];
  //Create input buffer for fifoSortMatrixC_o_5
  ap_apatb_fifoSortMatrixC_o_5_V_cap_bc = __xlx_fifoSortMatrixC_o_5_V_size_Reader.read_size();
  int* __xlx_fifoSortMatrixC_o_5_input_buffer= new int[ap_apatb_fifoSortMatrixC_o_5_V_cap_bc];
  //Create input buffer for fifoSortMatrixC_o_6
  ap_apatb_fifoSortMatrixC_o_6_V_cap_bc = __xlx_fifoSortMatrixC_o_6_V_size_Reader.read_size();
  int* __xlx_fifoSortMatrixC_o_6_input_buffer= new int[ap_apatb_fifoSortMatrixC_o_6_V_cap_bc];
  //Create input buffer for fifoSortMatrixC_o_7
  ap_apatb_fifoSortMatrixC_o_7_V_cap_bc = __xlx_fifoSortMatrixC_o_7_V_size_Reader.read_size();
  int* __xlx_fifoSortMatrixC_o_7_input_buffer= new int[ap_apatb_fifoSortMatrixC_o_7_V_cap_bc];
  // DUT call
  sort_C(__xlx_apatb_param_lenEdgeListPtr, __xlx_fifoEdgeListPtr_i_input_buffer, __xlx_fifoMatrixCIdx_i_0_input_buffer, __xlx_fifoMatrixCIdx_i_1_input_buffer, __xlx_fifoMatrixCIdx_i_2_input_buffer, __xlx_fifoMatrixCIdx_i_3_input_buffer, __xlx_fifoMatrixCIdx_i_4_input_buffer, __xlx_fifoMatrixCIdx_i_5_input_buffer, __xlx_fifoMatrixCIdx_i_6_input_buffer, __xlx_fifoMatrixCIdx_i_7_input_buffer, __xlx_fifoCalcMatrixC_i_0_input_buffer, __xlx_fifoCalcMatrixC_i_1_input_buffer, __xlx_fifoCalcMatrixC_i_2_input_buffer, __xlx_fifoCalcMatrixC_i_3_input_buffer, __xlx_fifoCalcMatrixC_i_4_input_buffer, __xlx_fifoCalcMatrixC_i_5_input_buffer, __xlx_fifoCalcMatrixC_i_6_input_buffer, __xlx_fifoCalcMatrixC_i_7_input_buffer, __xlx_fifoSortMatrixC_o_0_input_buffer, __xlx_fifoSortMatrixC_o_1_input_buffer, __xlx_fifoSortMatrixC_o_2_input_buffer, __xlx_fifoSortMatrixC_o_3_input_buffer, __xlx_fifoSortMatrixC_o_4_input_buffer, __xlx_fifoSortMatrixC_o_5_input_buffer, __xlx_fifoSortMatrixC_o_6_input_buffer, __xlx_fifoSortMatrixC_o_7_input_buffer);
  for (unsigned i = 0; i <ap_apatb_fifoSortMatrixC_o_0_V_cap_bc; ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_0)->write(__xlx_fifoSortMatrixC_o_0_input_buffer[i]);
  for (unsigned i = 0; i <ap_apatb_fifoSortMatrixC_o_1_V_cap_bc; ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_1)->write(__xlx_fifoSortMatrixC_o_1_input_buffer[i]);
  for (unsigned i = 0; i <ap_apatb_fifoSortMatrixC_o_2_V_cap_bc; ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_2)->write(__xlx_fifoSortMatrixC_o_2_input_buffer[i]);
  for (unsigned i = 0; i <ap_apatb_fifoSortMatrixC_o_3_V_cap_bc; ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_3)->write(__xlx_fifoSortMatrixC_o_3_input_buffer[i]);
  for (unsigned i = 0; i <ap_apatb_fifoSortMatrixC_o_4_V_cap_bc; ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_4)->write(__xlx_fifoSortMatrixC_o_4_input_buffer[i]);
  for (unsigned i = 0; i <ap_apatb_fifoSortMatrixC_o_5_V_cap_bc; ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_5)->write(__xlx_fifoSortMatrixC_o_5_input_buffer[i]);
  for (unsigned i = 0; i <ap_apatb_fifoSortMatrixC_o_6_V_cap_bc; ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_6)->write(__xlx_fifoSortMatrixC_o_6_input_buffer[i]);
  for (unsigned i = 0; i <ap_apatb_fifoSortMatrixC_o_7_V_cap_bc; ++i)
    ((hls::stream<int>*)__xlx_apatb_param_fifoSortMatrixC_o_7)->write(__xlx_fifoSortMatrixC_o_7_input_buffer[i]);
}
