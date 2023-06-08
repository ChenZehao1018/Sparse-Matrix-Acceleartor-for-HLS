#include <vector>
#include <iostream>
#include "define.h"
using namespace std;

void edge_list_64bit(
    const vector<vector<edge> > & edge_list_pes,
    const vector<int> & edge_list_ptr,
    vector<unsigned long> & martixA_hls_vec){
    
    int sparseA_hls_col_size = NUM_PE * edge_list_ptr.back();
    int sparseA_hls_chunk_size = ((sparseA_hls_col_size + 3) / 4) * 4;
    martixA_hls_vec.resize(sparseA_hls_chunk_size, 1125895611875328); //x = 0x3FFFF  x = x << 32;


    // col(14 bits) + row (18 bits) + value (32 bits)
    for (int i = 0; i < edge_list_ptr.back(); i++){
        for (int k = 0; k < NUM_PE; k++){
            edge element = edge_list_pes[k][i];
            unsigned long x = 0;
            if (element.row == -1){
                x = 0x3FFFF;
                x = x << 32;
            } else {
                unsigned long xCol = element.col;
                xCol = (xCol & 0x3FFF) << (32 + 18);
                unsigned long xRow = element.row;
                xRow = (xRow & 0x3FFFF) << 32;

                float xFloat = element.val;
                unsigned int xFloatInt = *((unsigned int*)(&xFloat));
                unsigned long xFloatVal64 = (unsigned long)xFloatInt;
                xFloatVal64 = xFloatVal64 & 0xFFFFFFFF;

                x = xCol | xRow | xFloatVal64;
            }
            martixA_hls_vec[k + NUM_PE * i] = x;
        }
    } 
}

void cpu_matrix_cal(const int M,
                    const int N,
                    const int K,
                    const int numElements,
                    vector<float> &matrixB,
                    vector<float> &matrixC,
                    vector<int> &cscColPtr, 
                    vector<int> &cscRowIdx, 
                    vector<float> &cscVal){
    matrixC.resize(M * K, 0.0);
    for (int i = 0; i < K; i++){
        for (int j = cscColPtr[i]; j < cscColPtr[i + 1]; j++){
            int rowIdx = cscRowIdx[j];
            float value = cscVal[j];

            for (int n = 0; n < N; n++){
                matrixC[rowIdx + M * n] += value * matrixB[i + K * n];
            }
        }
    }
}