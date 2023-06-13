#include <vector>
#include <iostream>
#include "define.h"
using namespace std;

void edge_list_64bit(
    const vector<vector<edge> > & edge_list_pes,
    const vector<int> & edge_list_ptr,
    vector<float> & martixA_vec,
    vector<uint32_t> &matrixA_idx){
    
    int sparseA_hls_size = NUM_PE * edge_list_ptr.back();
    martixA_vec.resize(sparseA_hls_size, 0.0);
    matrixA_idx.resize(sparseA_hls_size, 0xFFFF);

    // col(14 bits) + row (18 bits) + value (32 bits)
    for (int i = 0; i < edge_list_ptr.back(); i++){
        for (int k = 0; k < NUM_PE; k++){
            edge element = edge_list_pes[k][i];
            float x = 0.0;
            uint32_t xIdx = 0xFFFF;
            if (element.row != -1){
                uint32_t xCol = element.col;
                xCol = (xCol & 0xFFFF) << 16;
                uint32_t xRow = element.row;
                xRow = (xRow & 0xFFFF);

                x = element.val;
                xIdx = xCol | xRow;
            }
            martixA_vec[k + NUM_PE * i] = x;
            matrixA_idx[k + NUM_PE * i] = xIdx;
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
    matrixC.resize(M * N, 0.0);
    for (int iter = 0; iter < K; iter++){
        for (int i = 0; i < M; i++){
            for (int j = cscColPtr[i]; j < cscColPtr[i + 1]; j++){
                int rowIdx = cscRowIdx[j];
                float value = cscVal[j];
                for (int n = 0; n < N; n++){
                    matrixC[rowIdx + M * n] += value * matrixB[i + K * n];
                }
            }
        }
    }
}