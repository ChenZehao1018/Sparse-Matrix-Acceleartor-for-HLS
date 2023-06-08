#include <hls_stream.h>
#include <ap_int.h>
#include <hls_vector.h>
#include <iostream>

#define DATASIZE 32
#define NUM_WORDS 8
#define NUM_PE 2

void krnl_sparse_matrix_acc(hls::vector<int, NUM_WORDS>* HLSPtr_i,
							hls::vector<uint32_t, DATASIZE>* matrixA_hls_idx,
							hls::vector<float, DATASIZE>* matrixA_i,
							hls::vector<float, NUM_WORDS * 2>* matrixB_i,
							hls::vector<float, NUM_WORDS * 2>* matrixC_o,
							const unsigned int lenEdgeListPtr,
							const unsigned int lenEdgePtr,
							const unsigned int M,
							const unsigned int K,
							const unsigned int N
							);

int main(){
	const unsigned int lenEdgeListPtr = 2;
	const unsigned int lenEdgePtr = 11;
	const unsigned int M = 8;
	const unsigned int K = 8;
	const unsigned int N = 2;

	hls::vector<int, NUM_WORDS> HLSPtr_i = {0, 11, 0, 0, 0, 0, 0, 0};

	hls::vector<uint32_t, DATASIZE> matrixA_hls_idx = {0, 1, 1, 2, 2, 65536, 3, 393219,
	    												   458752, 65535, 65535, 65535, 65535, 131072, 65535, 458755,
														   65535, 65535, 65535, 65535, 65535, 458752, 65535, 65535,
														   65535, 65535, 65535, 65535, 65535, 65535, 65535, 65535};

	hls::vector<float, DATASIZE> matrixA_i = {1, 3, 2, 5, 4, 7, 6, 9,
	    										  10, 0, 0, 0, 0, 8, 0, 12,
												  0, 0, 0, 0, 0, 11, 0, 0,
												  0, 0, 0, 0, 0, 0, 0, 0};

	hls::vector<float, NUM_WORDS * 2> matrixB_i = {1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1};

	hls::vector<float, NUM_WORDS * 2> matrixC_o;

	krnl_sparse_matrix_acc(&HLSPtr_i, &matrixA_hls_idx, &matrixA_i, &matrixB_i, &matrixC_o, lenEdgeListPtr, lenEdgePtr, M, K, N);

	// Print and check the output data
	for(int i = 0; i < NUM_WORDS * 2; ++i) {
		std::cout << "matrixC_o: " << matrixC_o[i] << std::endl;
	}
	return 0;
}
