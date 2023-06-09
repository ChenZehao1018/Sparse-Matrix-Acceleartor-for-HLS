#include <hls_stream.h>
#include <ap_int.h>
#include <hls_vector.h>
#include <iostream>
#include <ap_fixed.h>

#define NUM_WORDS 8
#define NUM_PE 4
#define WINDOW_SIZE 8
#define N0 2

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
			hls::stream<float> fifoCalcMatrixC_o[N0]);

int main() {
	int lenEdgeListPtr = 2;
	hls::stream<int> fifoEdgeListPtr_i;
	hls::stream<uint32_t> fifoMatrixAIdx_i;
	hls::stream<float> fifoMatrixA_i;
	hls::stream<float> fifoMatrixB_i;
	hls::stream<int> fifoEdgeListPtr_o;
	hls::stream<ap_uint<16>> fifoMatrixCIdx_o[N0];
	hls::stream<float> fifoMatrixC_o[N0];


	int edgeListPtrData[] = {0, 11};

	uint32_t matrixAIdx[] = {0, 3, 2, 5, 4, 65537, 6, 393223,
							 458752, 65535, 65535, 65535, 65535, 131073, 65535, 458759,
							 65535, 65535, 65535, 65535, 65535, 458753};
	float matrixAData[] = {1, 3, 2, 5, 4, 7, 6, 9,
						   10, 0, 0, 0, 0, 8, 0, 12,
						   0, 0, 0, 0, 0, 11};

	float matrixBData[] = {1, 1, 2, 1, 3, 1, 4, 1,
						   5, 1, 6, 1, 7, 1, 8, 1};


//	int edgeListPtrData[] = {0, 10};
//
//	uint32_t matrixAIdx[] = {0, 5, 2, 3, 4, 65537, 6, 393223, 65535, 65535,
//							 65535, 65535, 65535, 65535, 65535, 65535, 458752, 65535, 65535, 65535,
//							 65535, 131073, 65535, 458759, 65535, 65535, 65535, 65535, 65535, 65535,
//							 65535, 65535, 65535, 65535, 65535, 65535, 65535, 458753, 65535, 65535};
//	float matrixAData[] = {1, 5, 2, 3, 4, 7, 6, 9, 0, 0,
//						   0, 0, 0, 0, 0, 0, 10, 0, 0, 0,
//						   0, 8, 0, 12, 0, 0, 0, 0, 0, 0,
//						   0, 0, 0, 0, 0, 0, 0, 11, 0, 0};
//
//	float matrixBData[] = {1, 1, 2, 1, 3, 1, 4, 1,
//						   5, 1, 6, 1, 7, 1, 8, 1};



	for (int i = 0; i < sizeof(edgeListPtrData)/sizeof(int); i++)
		fifoEdgeListPtr_i.write(edgeListPtrData[i]);

	for (int i = 0; i < sizeof(matrixAIdx)/sizeof(uint32_t); i++)
		fifoMatrixAIdx_i.write(matrixAIdx[i]);

	for (int i = 0; i < sizeof(matrixAData)/sizeof(float); i++)
		fifoMatrixA_i.write(matrixAData[i]);

	for (int i = 0; i < sizeof(matrixBData)/sizeof(float); i++)
		fifoMatrixB_i.write(matrixBData[i]);


	calc_C(lenEdgeListPtr, fifoEdgeListPtr_i , fifoMatrixAIdx_i, fifoMatrixA_i, fifoMatrixB_i, fifoEdgeListPtr_o, fifoMatrixCIdx_o, fifoMatrixC_o);


	while(!fifoEdgeListPtr_o.empty()){
		ap_uint<16> result_ptr = fifoEdgeListPtr_o.read();
		std::cout << "Output_ptr: " << result_ptr << std::endl;
	}


	std::cout << "Output_Idx[0]: ";
	while(!fifoMatrixCIdx_o[0].empty()){
		ap_uint<16> result_idx = fifoMatrixCIdx_o[0].read();
		std::cout << result_idx << ", ";
	}
	std::cout << std::endl;


	std::cout << "Output_Idx[1]: ";
	while(!fifoMatrixCIdx_o[1].empty()){
			ap_uint<16> result_idx = fifoMatrixCIdx_o[1].read();
			std::cout << result_idx << ", ";
	}
	std::cout << std::endl;

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
}
