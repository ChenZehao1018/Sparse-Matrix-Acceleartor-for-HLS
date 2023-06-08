#include <hls_stream.h>
#include <ap_int.h>
#include <hls_vector.h>
#include <iostream>

#define DATASIZE 32
#define NUM_WORDS 8
#define NUM_PE 2
#define N0 2

extern void write_C(const int M,
                    const int N,
                    hls::stream<float> & fifoSortMatrixC_i,
                    hls::vector<float, NUM_WORDS * 2>* matrixC_o);

int main() {
    const int M = 8;
    const int N = 2;
    unsigned int dataSize = M * N;
    // Define the input and output data
    hls::stream<float> fifoSortMatrixC_i;
    hls::vector<float, NUM_WORDS * 2> matrixC_o;

    std::vector<float> fifoSortMatrixC_data = {81, 11, 126, 26, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 159, 21};

    // Generate random data
    for(int i = 0; i < dataSize; ++i) {
        fifoSortMatrixC_i.write(fifoSortMatrixC_data[i]);
    }

    // Call the function
    write_C(M, N, fifoSortMatrixC_i, &matrixC_o);

    // Print and check the output data
    for(int i = 0; i < dataSize; ++i) {
    	std::cout << "matrixC_o: " << matrixC_o[i] << std::endl;
    }
    return 0;
}
