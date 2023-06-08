#include <hls_stream.h>
#include <ap_int.h>
#include <hls_vector.h>
#include <iostream>
#include <ap_fixed.h>

#define N0 2
#define NUM_WORDS 2
#define DATASIZE 2
#define NUM_PE 2

void sort_C(hls::stream<int> & fifoEdgeListPtr_i,
		    hls::stream<int> & PEListStream_i,
		    hls::stream<ap_uint<16>> & fifoMatrixCIdx_i,
		    hls::stream<float> & fifoMatrixC_i,
		    hls::stream<float> & fifoMatrixC_o);

int main() {
	hls::stream<int> fifoEdgeListPtr_i;
	hls::stream<int> PEListStream_i;
	hls::stream<ap_uint<16>> fifoMatrixCIdx_i;
	hls::stream<float> fifoMatrixC_i;
	hls::stream<float> fifoMatrixC_o;

	int edgeListPtrData[] = {0, 11};
	int PEListStreamData[] = {2, 8, 1, 8};

//	ap_uint<16> matrixCIdxData[] = {0, 3, 2, 5, 4, 1, 6, 7, 0, 15, 15, 15, 15, 1, 15, 7, 15, 15, 15, 15, 15, 1};
//	float matrixCData[] = {1, 3, 2, 5, 4, 14, 6, 63, 80, 0, 0, 0, 0, 24, 0, 96, 0, 0, 0, 0, 0, 88};

//	ap_uint<16> matrixCIdxData[] = {0, 0, 3, 3, 2, 2, 5, 5, 4, 4, 1, 1, 6, 6, 7, 7, 0, 0, 1, 1, 7, 7, 1, 1};

	ap_uint<16> matrixCIdxData[] = {0, 0, 3, 3, 2, 2, 5, 5, 4, 4, 1,
									1, 6, 6, 7, 7, 0, 0, 65535, 65535, 65535, 65535,
									65535, 65535, 65535, 65535, 1, 1, 65535, 65535, 7, 7, 65535,
									65535, 65535, 65535, 65535, 65535, 65535, 65535, 65535, 65535, 1, 1};
//	float matrixCData[] = {1, 1, 3, 3, 2, 2, 5, 5, 4, 4, 14, 7, 6, 6, 63, 9, 80, 10, 24, 8, 96, 12, 88, 11};
	float matrixCData[] = {1, 1, 3, 3, 2, 2, 5, 5, 4, 4, 14,
						   7, 6, 6, 63, 9, 80, 10, 0, 0, 0, 0,
						   0, 0, 0, 0, 24, 8, 0, 0, 96, 12, 0,
						   0, 0, 0, 0, 0, 0, 0, 0, 0, 88, 11};



//	int edgeListPtrData[] = {0, 7, 12};
//	int PEListStreamData[] = {3, 8, 1, 8};
//
//	ap_uint<16> matrixCIdxData[] = {0, 3, 2, 5, 4, 1, 6, 15, 15, 15, 15, 15, 15, 1, 0, 7, 15, 1, 15, 15, 15, 15, 15, 7};
//	float matrixCData[] = {1, 3, 2, 5 ,4, 14, 6, 0, 0, 0, 0, 0, 0, 24, 80, 63, 0, 88, 0, 0, 0, 0, 0, 96};

	// write input data to streams
	for (int i = 0; i < sizeof(edgeListPtrData) / sizeof(int); i++) {
		fifoEdgeListPtr_i.write(edgeListPtrData[i]);
	}
	for (int i = 0; i < sizeof(PEListStreamData) / sizeof(int); i++) {
		PEListStream_i.write(PEListStreamData[i]);
	}
	for (int i = 0; i < sizeof(matrixCIdxData) / sizeof(ap_uint<16>); i++) {
		fifoMatrixCIdx_i.write(matrixCIdxData[i]);
	}
	for (int i = 0; i < sizeof(matrixCData) / sizeof(float); i++) {
		fifoMatrixC_i.write(matrixCData[i]);
	}

	// call the function to be tested
	sort_C(fifoEdgeListPtr_i, PEListStream_i, fifoMatrixCIdx_i, fifoMatrixC_i, fifoMatrixC_o);

	// read and print output data from stream
	while (!fifoMatrixC_o.empty()) {
		std::cout << fifoMatrixC_o.read() << std::endl;
	}
	return 0;
}
