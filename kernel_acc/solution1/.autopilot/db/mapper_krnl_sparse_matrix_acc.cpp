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
extern "C" void krnl_sparse_matrix_acc(int*, int*, int*, int*, int*, int, int, int, int, int, int, int, int, int, int);
extern "C" void apatb_krnl_sparse_matrix_acc_hw(volatile void * __xlx_apatb_param_HLSPtr_i, volatile void * __xlx_apatb_param_matrixA_hls_idx, volatile void * __xlx_apatb_param_matrixA_i, volatile void * __xlx_apatb_param_matrixB_i, volatile void * __xlx_apatb_param_matrixC_o, int __xlx_apatb_param_lenEdgeListPtr, int __xlx_apatb_param_lenEdgePtr, int __xlx_apatb_param_M, int __xlx_apatb_param_K, int __xlx_apatb_param_N) {
  // Collect __xlx_HLSPtr_i__tmp_vec
  vector<sc_bv<32> >__xlx_HLSPtr_i__tmp_vec;
  for (int j = 0, e = 1; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_HLSPtr_i)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_HLSPtr_i)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_HLSPtr_i)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_HLSPtr_i)[j*4+3];
    __xlx_HLSPtr_i__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_HLSPtr_i = 1;
  int __xlx_offset_param_HLSPtr_i = 0;
  int __xlx_offset_byte_param_HLSPtr_i = 0*4;
  int* __xlx_HLSPtr_i__input_buffer= new int[__xlx_HLSPtr_i__tmp_vec.size()];
  for (int i = 0; i < __xlx_HLSPtr_i__tmp_vec.size(); ++i) {
    __xlx_HLSPtr_i__input_buffer[i] = __xlx_HLSPtr_i__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_matrixA_hls_idx__tmp_vec
  vector<sc_bv<32> >__xlx_matrixA_hls_idx__tmp_vec;
  for (int j = 0, e = 1; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_matrixA_hls_idx)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_matrixA_hls_idx)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_matrixA_hls_idx)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_matrixA_hls_idx)[j*4+3];
    __xlx_matrixA_hls_idx__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_matrixA_hls_idx = 1;
  int __xlx_offset_param_matrixA_hls_idx = 0;
  int __xlx_offset_byte_param_matrixA_hls_idx = 0*4;
  int* __xlx_matrixA_hls_idx__input_buffer= new int[__xlx_matrixA_hls_idx__tmp_vec.size()];
  for (int i = 0; i < __xlx_matrixA_hls_idx__tmp_vec.size(); ++i) {
    __xlx_matrixA_hls_idx__input_buffer[i] = __xlx_matrixA_hls_idx__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_matrixA_i__tmp_vec
  vector<sc_bv<32> >__xlx_matrixA_i__tmp_vec;
  for (int j = 0, e = 1; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_matrixA_i)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_matrixA_i)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_matrixA_i)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_matrixA_i)[j*4+3];
    __xlx_matrixA_i__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_matrixA_i = 1;
  int __xlx_offset_param_matrixA_i = 0;
  int __xlx_offset_byte_param_matrixA_i = 0*4;
  int* __xlx_matrixA_i__input_buffer= new int[__xlx_matrixA_i__tmp_vec.size()];
  for (int i = 0; i < __xlx_matrixA_i__tmp_vec.size(); ++i) {
    __xlx_matrixA_i__input_buffer[i] = __xlx_matrixA_i__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_matrixB_i__tmp_vec
  vector<sc_bv<32> >__xlx_matrixB_i__tmp_vec;
  for (int j = 0, e = 1; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_matrixB_i)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_matrixB_i)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_matrixB_i)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_matrixB_i)[j*4+3];
    __xlx_matrixB_i__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_matrixB_i = 1;
  int __xlx_offset_param_matrixB_i = 0;
  int __xlx_offset_byte_param_matrixB_i = 0*4;
  int* __xlx_matrixB_i__input_buffer= new int[__xlx_matrixB_i__tmp_vec.size()];
  for (int i = 0; i < __xlx_matrixB_i__tmp_vec.size(); ++i) {
    __xlx_matrixB_i__input_buffer[i] = __xlx_matrixB_i__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_matrixC_o__tmp_vec
  vector<sc_bv<32> >__xlx_matrixC_o__tmp_vec;
  for (int j = 0, e = 1; j != e; ++j) {
    sc_bv<32> _xlx_tmp_sc;
    _xlx_tmp_sc.range(7, 0) = ((char*)__xlx_apatb_param_matrixC_o)[j*4+0];
    _xlx_tmp_sc.range(15, 8) = ((char*)__xlx_apatb_param_matrixC_o)[j*4+1];
    _xlx_tmp_sc.range(23, 16) = ((char*)__xlx_apatb_param_matrixC_o)[j*4+2];
    _xlx_tmp_sc.range(31, 24) = ((char*)__xlx_apatb_param_matrixC_o)[j*4+3];
    __xlx_matrixC_o__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_matrixC_o = 1;
  int __xlx_offset_param_matrixC_o = 0;
  int __xlx_offset_byte_param_matrixC_o = 0*4;
  int* __xlx_matrixC_o__input_buffer= new int[__xlx_matrixC_o__tmp_vec.size()];
  for (int i = 0; i < __xlx_matrixC_o__tmp_vec.size(); ++i) {
    __xlx_matrixC_o__input_buffer[i] = __xlx_matrixC_o__tmp_vec[i].range(31, 0).to_uint64();
  }
  // DUT call
  krnl_sparse_matrix_acc(__xlx_HLSPtr_i__input_buffer, __xlx_matrixA_hls_idx__input_buffer, __xlx_matrixA_i__input_buffer, __xlx_matrixB_i__input_buffer, __xlx_matrixC_o__input_buffer, __xlx_offset_byte_param_HLSPtr_i, __xlx_offset_byte_param_matrixA_hls_idx, __xlx_offset_byte_param_matrixA_i, __xlx_offset_byte_param_matrixB_i, __xlx_offset_byte_param_matrixC_o, __xlx_apatb_param_lenEdgeListPtr, __xlx_apatb_param_lenEdgePtr, __xlx_apatb_param_M, __xlx_apatb_param_K, __xlx_apatb_param_N);
// print __xlx_apatb_param_HLSPtr_i
  sc_bv<32>*__xlx_HLSPtr_i_output_buffer = new sc_bv<32>[__xlx_size_param_HLSPtr_i];
  for (int i = 0; i < __xlx_size_param_HLSPtr_i; ++i) {
    __xlx_HLSPtr_i_output_buffer[i] = __xlx_HLSPtr_i__input_buffer[i+__xlx_offset_param_HLSPtr_i];
  }
  for (int i = 0; i < __xlx_size_param_HLSPtr_i; ++i) {
    ((char*)__xlx_apatb_param_HLSPtr_i)[i*4+0] = __xlx_HLSPtr_i_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_HLSPtr_i)[i*4+1] = __xlx_HLSPtr_i_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_HLSPtr_i)[i*4+2] = __xlx_HLSPtr_i_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_HLSPtr_i)[i*4+3] = __xlx_HLSPtr_i_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_matrixA_hls_idx
  sc_bv<32>*__xlx_matrixA_hls_idx_output_buffer = new sc_bv<32>[__xlx_size_param_matrixA_hls_idx];
  for (int i = 0; i < __xlx_size_param_matrixA_hls_idx; ++i) {
    __xlx_matrixA_hls_idx_output_buffer[i] = __xlx_matrixA_hls_idx__input_buffer[i+__xlx_offset_param_matrixA_hls_idx];
  }
  for (int i = 0; i < __xlx_size_param_matrixA_hls_idx; ++i) {
    ((char*)__xlx_apatb_param_matrixA_hls_idx)[i*4+0] = __xlx_matrixA_hls_idx_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_matrixA_hls_idx)[i*4+1] = __xlx_matrixA_hls_idx_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_matrixA_hls_idx)[i*4+2] = __xlx_matrixA_hls_idx_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_matrixA_hls_idx)[i*4+3] = __xlx_matrixA_hls_idx_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_matrixA_i
  sc_bv<32>*__xlx_matrixA_i_output_buffer = new sc_bv<32>[__xlx_size_param_matrixA_i];
  for (int i = 0; i < __xlx_size_param_matrixA_i; ++i) {
    __xlx_matrixA_i_output_buffer[i] = __xlx_matrixA_i__input_buffer[i+__xlx_offset_param_matrixA_i];
  }
  for (int i = 0; i < __xlx_size_param_matrixA_i; ++i) {
    ((char*)__xlx_apatb_param_matrixA_i)[i*4+0] = __xlx_matrixA_i_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_matrixA_i)[i*4+1] = __xlx_matrixA_i_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_matrixA_i)[i*4+2] = __xlx_matrixA_i_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_matrixA_i)[i*4+3] = __xlx_matrixA_i_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_matrixB_i
  sc_bv<32>*__xlx_matrixB_i_output_buffer = new sc_bv<32>[__xlx_size_param_matrixB_i];
  for (int i = 0; i < __xlx_size_param_matrixB_i; ++i) {
    __xlx_matrixB_i_output_buffer[i] = __xlx_matrixB_i__input_buffer[i+__xlx_offset_param_matrixB_i];
  }
  for (int i = 0; i < __xlx_size_param_matrixB_i; ++i) {
    ((char*)__xlx_apatb_param_matrixB_i)[i*4+0] = __xlx_matrixB_i_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_matrixB_i)[i*4+1] = __xlx_matrixB_i_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_matrixB_i)[i*4+2] = __xlx_matrixB_i_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_matrixB_i)[i*4+3] = __xlx_matrixB_i_output_buffer[i].range(31, 24).to_uint();
  }
// print __xlx_apatb_param_matrixC_o
  sc_bv<32>*__xlx_matrixC_o_output_buffer = new sc_bv<32>[__xlx_size_param_matrixC_o];
  for (int i = 0; i < __xlx_size_param_matrixC_o; ++i) {
    __xlx_matrixC_o_output_buffer[i] = __xlx_matrixC_o__input_buffer[i+__xlx_offset_param_matrixC_o];
  }
  for (int i = 0; i < __xlx_size_param_matrixC_o; ++i) {
    ((char*)__xlx_apatb_param_matrixC_o)[i*4+0] = __xlx_matrixC_o_output_buffer[i].range(7, 0).to_uint();
    ((char*)__xlx_apatb_param_matrixC_o)[i*4+1] = __xlx_matrixC_o_output_buffer[i].range(15, 8).to_uint();
    ((char*)__xlx_apatb_param_matrixC_o)[i*4+2] = __xlx_matrixC_o_output_buffer[i].range(23, 16).to_uint();
    ((char*)__xlx_apatb_param_matrixC_o)[i*4+3] = __xlx_matrixC_o_output_buffer[i].range(31, 24).to_uint();
  }
}
