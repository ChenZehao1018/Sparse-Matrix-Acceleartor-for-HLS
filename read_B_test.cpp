#include <hls_stream.h>
#include <ap_int.h>
#include <hls_vector.h>
#include <iostream>

#define DATASIZE 32
#define NUM_WORDS 8
#define NUM_PE 2
#define N0 2

void read_B(int K,
        	int N,
			float* matrixB_i,
            hls::stream<float> & fifoMatrixB_o);
int main() {
    const int K = 8;
    const int N = 2;
    float matrixB_i[] = {1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 1, 8, 1};

    hls::stream<float> fifoMatrixB_o;

    read_B(K, N, matrixB_i, fifoMatrixB_o);

    while(!fifoMatrixB_o.empty()){
		std::cout << "Idx Stream element: " << fifoMatrixB_o.read() << std::endl;
    }

    return 0;
}
