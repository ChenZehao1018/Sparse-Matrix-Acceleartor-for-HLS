#include <hls_stream.h>
#include <ap_int.h>
#include <hls_vector.h>
#include <iostream>

#define NUM_WORDS 8
#define NUM_PE 2
#define WINDOW_SIZE 8
#define N0 2

void krnl_sparse_matrix_acc(int* HLSPtr_i,
							uint32_t* matrixA_hls_idx,
							float* matrixA_i,
							float* matrixB_i,
							float* matrixC_o,
							int lenEdgeListPtr,
							int lenEdgePtr,
							int M,
							int K,
							int N
							);

int main(){
	const unsigned int lenEdgeListPtr = 2;
	const unsigned int lenEdgePtr = 11;
	const unsigned int M = 8;
	const unsigned int K = 8;
	const unsigned int N = 2;

	int HLSPtr_i[] = {0, 11};

	uint32_t matrixA_hls_idx[] = {0, 3, 2, 5, 4, 65537, 6, 393223,
			  	  	  	  	  	  458752, 65535, 65535, 65535, 65535, 131073, 65535, 458759,
								  65535, 65535, 65535, 65535, 65535, 458753};

	float matrixA_i[] = {1, 3, 2, 5, 4, 7, 6, 9,
						 10, 0, 0, 0, 0, 8, 0, 12,
						 0, 0, 0, 0, 0, 11};

	float matrixB_i[] = {1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1};

	float matrixC_o[M * N];

	krnl_sparse_matrix_acc(HLSPtr_i, matrixA_hls_idx, matrixA_i, matrixB_i, matrixC_o, lenEdgeListPtr, lenEdgePtr, M, K, N);

	// Print and check the output data
	for(int i = 0; i < M * N; ++i) {
		std::cout << "matrixC_o: " << matrixC_o[i] << std::endl;
	}
	return 0;
}
