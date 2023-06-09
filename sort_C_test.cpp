#include <hls_stream.h>
#include <ap_int.h>
#include <hls_vector.h>
#include <iostream>
#include <ap_fixed.h>

#define N0 2
#define NUM_WORDS 2
#define DATASIZE 2
#define NUM_PE 2

void sort_C(int lenEdgeListPtr,
			//stream from calc_C()
			hls::stream<int> & fifoEdgeListPtr_i,
		    hls::stream<ap_uint<16>> fifoMatrixCIdx_i[N0],
		    hls::stream<float> fifoCalcMatrixC_i[N0],
			//stream to write_C()
		    hls::stream<float> fifoSortMatrixC_o[N0]);

int main() {
	int lenEdgeListPtr = 2;
	hls::stream<int> fifoEdgeListPtr_i;
	hls::stream<ap_uint<16>> fifoMatrixCIdx_i[N0];
	hls::stream<float> fifoMatrixC_i[N0];
	hls::stream<float> fifoMatrixC_o[N0];

	int edgeListPtrData[] = {0, 11};

	ap_uint<16> matrixCIdxData_0[] = {0, 3, 2, 5, 4, 1, 6, 7,
								      0, 65535, 65535, 65535, 65535, 1, 65535, 7,
									  65535, 65535, 65535, 65535, 65535, 1};
	ap_uint<16> matrixCIdxData_1[] = {0, 3, 2, 5, 4, 1, 6, 7,
									  0, 65535, 65535, 65535, 65535, 1, 65535, 7,
									  65535, 65535, 65535, 65535, 65535, 1};

	float matrixCData_0[] = {1, 3, 2, 5, 4, 14, 6, 63,
							 80, 0, 0, 0, 0, 24, 0, 96,
							 0, 0, 0, 0, 0, 88};

	float matrixCData_1[] = {1, 3, 2, 5, 4, 7, 6, 9,
							 10, 0, 0, 0, 0, 8, 0, 12,
							 0, 0, 0, 0, 0, 11};


	// write input data to streams
	for (int i = 0; i < sizeof(edgeListPtrData) / sizeof(int); i++) {
		fifoEdgeListPtr_i.write(edgeListPtrData[i]);
	}

	for (int i = 0; i < sizeof(matrixCIdxData_0) / sizeof(ap_uint<16>); i++) {
		fifoMatrixCIdx_i[0].write(matrixCIdxData_0[i]);
	}

	for (int i = 0; i < sizeof(matrixCIdxData_1) / sizeof(ap_uint<16>); i++) {
		fifoMatrixCIdx_i[1].write(matrixCIdxData_1[i]);
	}

	for (int i = 0; i < sizeof(matrixCData_0) / sizeof(float); i++) {
		fifoMatrixC_i[0].write(matrixCData_0[i]);
	}

	for (int i = 0; i < sizeof(matrixCData_1) / sizeof(float); i++) {
		fifoMatrixC_i[1].write(matrixCData_1[i]);
	}

	// call the function to be tested
	sort_C(lenEdgeListPtr, fifoEdgeListPtr_i, fifoMatrixCIdx_i, fifoMatrixC_i, fifoMatrixC_o);

	std::cout << "Output_data[0]: ";
	while(!fifoMatrixC_o[0].empty()){
		float result_data = fifoMatrixC_o[0].read();
		std::cout << std::fixed << std::setprecision(0) << result_data << ", ";
	}
	std::cout << std::endl;

	std::cout << "Output_data[1]: ";
	while(!fifoMatrixC_o[1].empty()){
		float result_data = fifoMatrixC_o[1].read();
		std::cout << std::fixed << std::setprecision(0) << result_data << ", ";
	}
	std::cout << std::endl;
	return 0;
}
