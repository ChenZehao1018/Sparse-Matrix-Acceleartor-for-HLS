#include <hls_stream.h>
#include <ap_int.h>
#include <hls_vector.h>
#include <iostream>

#define N0 2
#define NUM_WORDS 8
#define WINDOW_SIZE 8

void calc_C_core(ap_uint<16> rowIdxA_i,
				 ap_uint<16> colIdxA_i,
				 float valA_i,
				 float tempB[NUM_WORDS],
				 hls::stream<float>& fifoCalcMatrixC_o,
				 hls::stream<ap_uint<16>>& fifoMatrixCIdx_o);

int main() {
	ap_uint<16> rowIdxA_i = 0x0;
    ap_uint<14> rowIdxB_i = 0x1;
    ap_uint<32> valA_i = 0x2;
    float tempB[NUM_WORDS];
    hls::stream<float> fifoCalcMatrixC_o("fifoCalcMatrixC_o");
    hls::stream<ap_uint<16>> fifoMatrixCIdx_o("fifoMatrixCIdx_o");

    // Initialize tempB with some values
    for (int i = 0; i < NUM_WORDS; i++) {
    	tempB[i] = 1.0;
    }

    // Call the function to be tested
    calc_C_core(rowIdxA_i, rowIdxB_i, valA_i, tempB, fifoCalcMatrixC_o, fifoMatrixCIdx_o);

    // Check the results
    while(!fifoCalcMatrixC_o.empty()){
    		ap_uint<16> result_ptr = fifoCalcMatrixC_o.read();
    		std::cout << "fifoCalcMatrixC_o_Output_ptr: " << result_ptr << std::endl;
    }
    while(!fifoMatrixCIdx_o.empty()){
    		ap_uint<16> result_ptr = fifoMatrixCIdx_o.read();
    		std::cout << "fifoMatrixCIdx_o_Output_ptr: " << result_ptr << std::endl;
    }
    return 0;
}
