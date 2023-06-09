#include <hls_stream.h>
#include <ap_int.h>
#include <hls_vector.h>
#include <iostream>

#define DATASIZE 32
#define NUM_WORDS 8
#define NUM_PE 2
#define N0 2

void write_C(const int M,
			 const int N,
			 hls::stream<float> fifoSortMatrixC_i[N0],
			 float* matrixC_o);

int main() {
    const int M = 8;
    const int N = 2;

    hls::stream<float> fifoSortMatrixC_i[N0];
    float matrixC_o[M * N];

    std::vector<float> fifoSortMatrixC_data0 = {81, 126, 2, 3, 4, 5, 6, 159};
    std::vector<float> fifoSortMatrixC_data1 = {11, 26, 2, 3, 4, 5, 6, 21};

    for(int i = 0; i < fifoSortMatrixC_data0.size(); ++i) {
        fifoSortMatrixC_i[0].write(fifoSortMatrixC_data0[i]);
    }

    for(int i = 0; i < fifoSortMatrixC_data1.size(); ++i) {
		fifoSortMatrixC_i[1].write(fifoSortMatrixC_data1[i]);
	}

    // Call the function
    write_C(M, N, fifoSortMatrixC_i, matrixC_o);

    // Print and check the output data
    for(int i = 0; i < M * N; ++i) {
    	std::cout << "matrixC_o: " << matrixC_o[i] << std::endl;
    }
    return 0;
}
