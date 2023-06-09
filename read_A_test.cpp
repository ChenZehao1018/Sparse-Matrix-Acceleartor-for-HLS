#include <hls_stream.h>
#include <ap_int.h>
#include <hls_vector.h>
#include <iostream>

#define DATASIZE 32
#define NUM_WORDS 8
#define NUM_PE 2

void read_A(int lenEdgePtr,
			uint32_t* matrixA_hls_idx,
			float* matrixA_i,
			hls::stream<uint32_t> & fifoMatrixAIdx_o,
            hls::stream<float> & fifoMatrixA_o);

int main() {
    int lenEdgePtr = 11;
    uint32_t matrixA_hls_idx[] = {0, 3, 2, 5, 4, 65537, 6, 393223,
    							  458752, 65535, 65535, 65535, 65535, 131073, 65535, 458759,
								  65535, 65535, 65535, 65535, 65535, 458753};
    float matrixA_i[] = {1, 3, 2, 5, 4, 7, 6, 9,
    					 10, 0, 0, 0, 0, 8, 0, 12,
						 0, 0, 0, 0, 0, 11};

    hls::stream<uint32_t> fifoMatrixAIdx_o;
    hls::stream<float> fifoMatrixA_o;

    read_A(lenEdgePtr, matrixA_hls_idx, matrixA_i, fifoMatrixAIdx_o, fifoMatrixA_o);

    while(!fifoMatrixAIdx_o.empty()){
		std::cout << "Idx Stream element: " << fifoMatrixAIdx_o.read() << std::endl;
    }

    while(!fifoMatrixA_o.empty()){
		std::cout << "A Stream element: " << fifoMatrixA_o.read() << std::endl;
	}

    return 0;
}
