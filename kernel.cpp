#include <ap_int.h>
#include <ap_fixed.h>
#include <hls_stream.h>
#include <hls_vector.h>
#include "kernel.h"

void read_edge_list_ptr(int lenEdgeListPtr,
						int* HLSPtr_i,
                        hls::stream<int> & fifoEdgeListPtr_o
                        ) {
	ptr_rd:
	for (int i = 0; i < lenEdgeListPtr; i++){
		fifoEdgeListPtr_o.write(HLSPtr_i[i]);
	}
}

void read_A(int lenEdgePtr,
			uint32_t* matrixA_hls_idx,
			float* matrixA_i,
			hls::stream<uint32_t> & fifoMatrixAIdx_o,
            hls::stream<float> & fifoMatrixA_o
            ) {
	int dataSize = NUM_PE * lenEdgePtr;
	matrixA_rd:
	for (int i = 0; i < dataSize; i++) {
			fifoMatrixAIdx_o.write(matrixA_hls_idx[i]);
			fifoMatrixA_o.write(matrixA_i[i]);
	}
}

void read_B(int K,
        	int N,
			float* matrixB_i,
            hls::stream<float> & fifoMatrixB_o
            ) {
	int dataSize = K * N;
	matrixB_rd:
	for (int i = 0; i < dataSize; i++) {
		fifoMatrixB_o.write(matrixB_i[i]);
	}
}

void calc_C_core(ap_uint<16> colIdxA_i,
				 float valA_i,
				 float matrixB_buffer[NUM_WORDS],
				 float& temp_res){
#pragma HLS inline
	temp_res = valA_i * matrixB_buffer[colIdxA_i];
}

void calc_C(int lenEdgeListPtr,
			//stream from read_edge_list_ptr()
			hls::stream<int> & fifoEdgeListPtr_i,
			//stream from read_A()
			hls::stream<uint32_t> & fifoMatrixAIdx_i,
			hls::stream<float> & fifoMatrixA_i,
			//stream from read_B()
			hls::stream<float> & fifoMatrixB_i,
			//stream to sort_C()
			hls::stream<int> & fifoEdgeListPtrC_o,
			hls::stream<ap_uint<16>> fifoMatrixCIdx_o[N0],
			hls::stream<float> fifoCalcMatrixC_o[N0]){

	float matrixB_buffer[N0][NUM_WORDS];
	//read matrixB element
	for (int i = 0; i < NUM_WORDS; i++){
		for (int j = 0; j < N0; j++){
			if (!fifoMatrixB_i.empty()){
				matrixB_buffer[j][i] = fifoMatrixB_i.read();
			}else{
				matrixB_buffer[j][i] = 0;
			}
		}
	}

	int start_addr = fifoEdgeListPtr_i.read();
	fifoEdgeListPtrC_o.write(start_addr);
	loop_repeat_iter:
	for (int iter = 0; iter < lenEdgeListPtr - 1; iter++){
#pragma HLS loop_flatten off
			int end_addr = fifoEdgeListPtr_i.read();
			fifoEdgeListPtrC_o.write(end_addr);

			loop_diff_window:
			for (int i = start_addr; i < end_addr; i++){

				loop_diff_pe:
				for (int n = 0; n < NUM_PE; n++){
#pragma HLS PIPELINE II=1
					float tempA_val = fifoMatrixA_i.read();
					ap_uint<32> tempA_idx = fifoMatrixAIdx_i.read();
					ap_uint<16> tempA_col = tempA_idx(31, 16);
					ap_uint<16> tempA_row = tempA_idx(15, 0);
					float temp_res[N0];

					loop_for_col:
					for (int j = 0; j < N0; j++){
						if(tempA_row[15] == 0){
							calc_C_core(tempA_col, tempA_val, matrixB_buffer[j], temp_res[j]);
						}else{
							temp_res[j] = 0;
						}
						fifoCalcMatrixC_o[j].write(temp_res[j]);
						fifoMatrixCIdx_o[j].write(tempA_row);
					}
				}

			}

			start_addr = end_addr;
	}

}


void sort_C_core(ap_uint<16> row_i,
				 ap_fixed<32, 16> matrixC_val_i,
				 ap_fixed<32, 16> *valC_o){
#pragma HLS inline
	ap_fixed<32, 16> matrixC_val_old = valC_o[row_i];
	ap_fixed<32, 16> valC = matrixC_val_old + matrixC_val_i;
	valC_o[row_i] = valC;
}

void sort_C(int lenEdgeListPtr,
			//stream from calc_C()
			hls::stream<int> & fifoEdgeListPtr_i,
		    hls::stream<ap_uint<16>> fifoMatrixCIdx_i[N0],
		    hls::stream<float> fifoCalcMatrixC_i[N0],
			//stream to write_C()
		    hls::stream<float> fifoSortMatrixC_o[N0]){

	//initial matrixC
	ap_fixed<32, 16> matrixC_buffer[N0][NUM_WORDS];
	for (int i = 0; i < NUM_WORDS; i++){
		for (int j = 0; j < N0; j++){
			matrixC_buffer[j][i] = 0.0;
		}
	}

	int start_addr = fifoEdgeListPtr_i.read();
	loop_repeat_iter:
	for (int iter = 0; iter < lenEdgeListPtr - 1; iter++){
#pragma HLS loop_flatten off
		int end_addr = fifoEdgeListPtr_i.read();

		loop_diff_window:
		for (int i = start_addr; i < end_addr; i++){

			loop_diff_pe:
			for (int n = 0; n < NUM_PE; n++){
#pragma HLS PIPELINE II=1
				loop_for_col:
				for (int j = 0; j < N0; j++){
//#pragma HLS UNROLL factor=1
					ap_uint<16> row = fifoMatrixCIdx_i[j].read();
					ap_fixed<32, 16> matrixC_val_i = fifoCalcMatrixC_i[j].read();
					if (row[15] == 0){
						sort_C_core(row, matrixC_val_i, matrixC_buffer[j]);
					}
				}
			}
		}
		start_addr = end_addr;

	}

	for (int i = 0; i < NUM_WORDS; i++){
		for (int j = 0; j < N0; j++){
			fifoSortMatrixC_o[j].write(matrixC_buffer[j][i]);
		}
	}

}

void write_C(const int M,
			 const int N,
			 hls::stream<float> & fifoSortMatrixC_i,
			 hls::vector<float, NUM_WORDS * 2>* matrixC_o
			 ){
	unsigned int dataSize = M * N;
	unsigned int numStep = ((dataSize - 1) / NUM_WORDS) + 1;
	float matrix_buffer [DATASIZE];

	for (int i = 0; i < numStep * NUM_WORDS; i++){
		if (!fifoSortMatrixC_i.empty()){
			matrix_buffer[i] = fifoSortMatrixC_i.read();
		}else{
			matrix_buffer[i] = 0;
		}
	}

	for (int i = 0; i < numStep; i++) {
		for (int j = 0; j < NUM_WORDS; j++){
#pragma HLS pipeline II=1
			(*matrixC_o)[i * NUM_WORDS + j] = matrix_buffer[i * NUM_WORDS + j];
		}
	}
}

//void krnl_sparse_matrix_acc(hls::vector<int, NUM_WORDS>* HLSPtr_i,
//							hls::vector<uint32_t, DATASIZE>* matrixA_hls_idx,
//							hls::vector<float, DATASIZE>* matrixA_i,
//							hls::vector<float, NUM_WORDS * 2>* matrixB_i,
//							hls::vector<float, NUM_WORDS * 2>* matrixC_o,
//							const unsigned int lenEdgeListPtr,
//							const unsigned int lenEdgePtr,
//							const unsigned int M,
//							const unsigned int K,
//							const unsigned int N
//							) {
//#pragma HLS INTERFACE m_axi port = HLSPtr_i offset = slave bundle = gmem0
//#pragma HLS INTERFACE m_axi port = matrixA_hls_idx offset = slave bundle = gmem1
//#pragma HLS INTERFACE m_axi port = matrixA_i offset = slave bundle = gmem2
//#pragma HLS INTERFACE m_axi port = matrixB_i offset = slave bundle = gmem3
//#pragma HLS INTERFACE m_axi port = matrixC_o offset = slave bundle = gmem4
//
//#pragma HLS INTERFACE s_axilite port = HLSPtr_i
//#pragma HLS INTERFACE s_axilite port = matrixA_hls_idx
//#pragma HLS INTERFACE s_axilite port = matrixA_i
//#pragma HLS INTERFACE s_axilite port = matrixB_i
//#pragma HLS INTERFACE s_axilite port = matrixC_o
//
//#pragma HLS INTERFACE s_axilite port = lenEdgeListPtr
//#pragma HLS INTERFACE s_axilite port = lenEdgePtr
//#pragma HLS INTERFACE s_axilite port = M
//#pragma HLS INTERFACE s_axilite port = K
//#pragma HLS INTERFACE s_axilite port = N
//#pragma HLS INTERFACE s_axilite port = return
//
//#pragma HLS dataflow
//	hls::stream<int> fifoEdgeListPtr_o("fifoEdgeListPtr_o");
//	hls::stream<int> PEListStream_o("PEListStream_o");
//#pragma HLS STREAM variable = fifoEdgeListPtr_o depth = 64
//#pragma HLS STREAM variable = PEListStream_o depth = 64
//	read_edge_list_ptr(lenEdgeListPtr, M, K, N, HLSPtr_i, fifoEdgeListPtr_o, PEListStream_o);
//
//	hls::stream<uint32_t> fifoMatrixAIdx_o("fifoMatrixAIdx_o");
//	hls::stream<float> fifoMatrixA_o("fifoMatrixA_o");
//#pragma HLS STREAM variable = fifoMatrixAIdx_o depth = 64
//#pragma HLS STREAM variable = fifoMatrixA_o depth = 64
//	read_A(lenEdgePtr, matrixA_hls_idx, matrixA_i, fifoMatrixAIdx_o, fifoMatrixA_o);
//
//	hls::stream<float> fifoMatrixB_o("fifoMatrixB_o");
//#pragma HLS STREAM variable = fifoMatrixB_o depth = 64
//	read_B(K, N, matrixB_i, fifoMatrixB_o);
//
//	hls::stream<int> fifoEdgeListPtr_calC_o("fifoEdgeListPtr_calC_o");
//	hls::stream<int> PEListStream_calC_o("PEListStream_calC_o");
//	hls::stream<ap_uint<16>> fifoMatrixCIdx_o("fifoMatrixCIdx_o");
//	hls::stream<float> fifoCalcMatrixC_o("fifoCalcMatrixC_o");
//#pragma HLS STREAM variable = fifoEdgeListPtr_calC_o depth = 64
//#pragma HLS STREAM variable = PEListStream_calC_o depth = 64
//#pragma HLS STREAM variable = fifoMatrixCIdx_o depth = 64
//#pragma HLS STREAM variable = fifoCalcMatrixC_o depth = 64
//	calc_C(fifoEdgeListPtr_o, PEListStream_o, fifoMatrixAIdx_o, fifoMatrixA_o, fifoMatrixB_o,
//			fifoEdgeListPtr_calC_o, PEListStream_calC_o, fifoMatrixCIdx_o, fifoCalcMatrixC_o);
//
//	hls::stream<float> fifoSortMatrixC_o("fifoSortMatrixC_o");
//#pragma HLS STREAM variable = fifoSortMatrixC_o depth = 64
//	sort_C(fifoEdgeListPtr_calC_o, PEListStream_calC_o, fifoMatrixCIdx_o, fifoCalcMatrixC_o, fifoSortMatrixC_o);
//
//	write_C(M, N, fifoSortMatrixC_o, matrixC_o);
//}
