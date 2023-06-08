#include <algorithm>
#include <vector>
#include <iostream>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <chrono>
#include "read_matrix.h"
#include "scheduler.h"
#include "help.h"
#include "define.h"

using std::vector;
using std::cout;
using std::endl;
using std::max;
using std::min;
using std::string;


void read_matrixA(char *filename, 
                 int &M, int &K, 
                 int &numElements, 
                 bool &matrixType, 
                 vector<int> &cscColPtr, 
                 vector<int> &cscRowIdx, 
                 vector<float> &cscVal);
    
void generate_matrixB(int K, 
                      int N, 
                      vector<float> &matrixB);

void prepare_matrixA_FPGA(int M, 
                          int K,
                          vector<int> &cscColPtr, 
                          vector<int> &cscRowIdx, 
                          vector<float> &cscVal, 
                          vector<vector<edge> > &edge_list_pes, 
                          vector<int> &edge_list_ptr,
                          vector<unsigned long> &matrixA_hls_vec,
                          vector<int> &edge_list_ptr_hls);

void prepare_matrixB_FPGA(int K,
                          int N,
                          vector<float> matrixB,
                          vector<float> &matrixB_hls_vec);

void prepare_matrixC_FPGA(int M,
                          int N,
                          vector<float> &matrixC_hls_vec);


// Main function to demonstrate reading a sparse matrix, generating dense matrices B and C, and preparing sparse matrix A for FPGA.
int main(int argc, char* argv[]) {
    printf("start main function\n");
    char *filename = "example_matrix/example_matrix.mtx";
    int M, K, N, numElements;
    N = 1;
    bool matrixType = false;
    vector<int> cscColPtr;
    vector<int> cscRowIdx;
    vector<float> cscVal;
    vector<float> matrixB;

    cout << "reading matrix from file..\n";
    read_matrixA(filename, M, K, numElements, matrixType, cscColPtr, cscRowIdx, cscVal);

    cout << "matrix size: \n";

    generate_matrixB(K, N, matrixB);

    cout << "preparing sparse A for FPGA ...\n";
    vector<int> edge_list_ptr;
    vector<vector<edge> > edge_list_pes;
    vector<int> edge_list_ptr_hls;
    vector<unsigned long> matrixA_hls_vec;
    prepare_matrixA_FPGA(M, K, cscColPtr, cscRowIdx, cscVal, edge_list_pes, edge_list_ptr, matrixA_hls_vec, edge_list_ptr_hls);
    cout << "preparing sparse A done\n";

    vector<float> matrixB_hls_vec;
    cout << "preparing sparse B for FPGA ...\n";
    prepare_matrixB_FPGA(K, N, matrixB, matrixB_hls_vec);
    cout << "preparing sparse B done\n";

    vector<float> matrixC_hls_vec;
    cout << "preparing sparse C for FPGA ...\n";
    prepare_matrixC_FPGA(M, N, matrixC_hls_vec);
    cout << "preparing sparse C done\n";

    vector<float> matrixC;
    cout << "estimating time running calculation on cpu ...\n";
    auto startCpuTime = chrono::steady_clock::now();
    cpu_matrix_cal(M, N, K, numElements, matrixB, matrixC, cscColPtr, cscRowIdx, cscVal);
    auto endCpuTime = chrono::steady_clock::now();
    double timeCpu = chrono::duration_cast<chrono::nanoseconds>(endCpuTime - startCpuTime).count();
    cout << "cpu calculation time: (" << timeCpu * 1000 << " msec)\n";

    cout << "invoking kernel ...\n";
    int lenEdgeListPtr = edge_list_ptr.size();
    int lenEdgePtr = edge_list_ptr.back();
    
    cout << "lenEdgeListPtr: " << lenEdgeListPtr << endl;
    cout << "lenEdgePtr: " << lenEdgePtr << endl;

    
    cout << "edge_list_ptr_hls: ";
    for (int i = 0; i < edge_list_ptr_hls.size(); i++) {
        cout << edge_list_ptr_hls[i] << " ";
    }
    cout << endl;

    int count = 0;
    cout << "matrixA_hls_vec: ";
    for (int i = 0; i < matrixA_hls_vec.size(); i++) {
        count += 1;
        cout << matrixA_hls_vec[i] << " ";
    }
    cout << endl;
    cout << "count: " << count << endl;

    cout << "matrixB_hls_vec: ";
    for (int i = 0; i < matrixB_hls_vec.size(); i++) {
        cout << matrixB_hls_vec[i] << " ";
    }
    cout << endl;

    return 0;
}

void read_matrixA(char *filename, 
                 int &M, int &K, 
                 int &numElements, 
                 bool &matrixType, 
                 vector<int> &cscColPtr, 
                 vector<int> &cscRowIdx, 
                 vector<float> &cscVal) {
    read_matrix(filename, cscColPtr, cscRowIdx, cscVal, M, K, numElements, matrixType);
}

void generate_matrixB(int K, 
                      int N, 
                      vector<float> &matrixB) {
    matrixB.resize(K * N, 0.0);

    fill(matrixB.begin(), matrixB.end(), 1.0);
}

void prepare_matrixA_FPGA(int M, 
                          int K,
                          vector<int> &cscColPtr, 
                          vector<int> &cscRowIdx, 
                          vector<float> &cscVal, 
                          vector<vector<edge> > &edge_list_pes, 
                          vector<int> &edge_list_ptr,
                          vector<unsigned long> &matrixA_hls_vec,
                          vector<int> &edge_list_ptr_hls) {

    scheduler(cscColPtr, cscRowIdx, cscVal, NUM_PE, M, K, WINDOW_SIZE, edge_list_pes, edge_list_ptr);

    int edge_list_ptr_hls_size = ((edge_list_ptr.size() + 1) / 2) * 2;
    int edge_list_ptr_hls_chunk_size = ((edge_list_ptr_hls_size + 3) / 4) * 4;
    edge_list_ptr_hls.resize(edge_list_ptr_hls_chunk_size, 0);
    // transfer list data to hls data
    for (int i = 0; i < edge_list_ptr.size(); i++){
        edge_list_ptr_hls[i] = edge_list_ptr[i];
    }

    edge_list_64bit(edge_list_pes, edge_list_ptr, matrixA_hls_vec);
}

void prepare_matrixB_FPGA(int K,
                          int N,
                          vector<float> matrixB,
                          vector<float> &matrixB_hls_vec){

    int matrixB_hls_row_size = ((K + 1) / 2) * 2;
    int matrixB_hls_chunk_size = ((matrixB_hls_row_size * N + 3) / 4) * 4;
    
    matrixB_hls_vec.resize(matrixB_hls_chunk_size, 0.0);

    for (int n = 0; n < N; n++){
        for (int k = 0; k < K; k++){
            matrixB_hls_vec[n + N * k] = matrixB[k + K * n];
        }
    }
}

void prepare_matrixC_FPGA(int M,
                          int N,
                          vector<float> &matrixC_hls_vec){

    int matrixC_hls_row_size = ((M + 1) / 2) * 2;
    int matrixC_hls_chunk_size = ((matrixC_hls_row_size * N + 3) / 4) * 4;

    matrixC_hls_vec.resize(matrixC_hls_chunk_size, 0.0);
}
