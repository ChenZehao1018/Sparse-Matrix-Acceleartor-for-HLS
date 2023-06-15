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
#include "xcl2.hpp"

using std::vector;
using std::cout;
using std::endl;
using std::max;
using std::min;
using std::string;

// HBM Pseudo-channel(PC) requirements
#define MAX_HBM_PC_COUNT 32
#define PC_NAME(n) n | XCL_MEM_TOPOLOGY
const int pc[MAX_HBM_PC_COUNT] = {
    PC_NAME(0),  PC_NAME(1),  PC_NAME(2),  PC_NAME(3),  PC_NAME(4),  PC_NAME(5),  PC_NAME(6),  PC_NAME(7),
    PC_NAME(8),  PC_NAME(9),  PC_NAME(10), PC_NAME(11), PC_NAME(12), PC_NAME(13), PC_NAME(14), PC_NAME(15),
    PC_NAME(16), PC_NAME(17), PC_NAME(18), PC_NAME(19), PC_NAME(20), PC_NAME(21), PC_NAME(22), PC_NAME(23),
    PC_NAME(24), PC_NAME(25), PC_NAME(26), PC_NAME(27), PC_NAME(28), PC_NAME(29), PC_NAME(30), PC_NAME(31)};

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
                          vector<float> &matrixA_vec,
                          vector<uint32_t> &matrixA_idx);

void prepare_matrixB_FPGA(int K,
                          int N,
                          vector<float> matrixB,
                          vector<float> &matrixB_vec);

void prepare_matrixC_FPGA(int M,
                          int N,
                          vector<float> &matrixC_vec);


// Main function to demonstrate reading a sparse matrix, generating dense matrices B and C, and preparing sparse matrix A for FPGA.
int main(int argc, char* argv[]) {
    printf("This is the host file\n");
    printf("start main function\n");
    char *filename = "beacxc/beacxc.mtx";
    FILE *file = fopen(filename, "r");
    if(!file){
        cout << "file does not exist!" << endl;
        return 1;
    }else{
        fclose(file);
    }

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
    vector<vector<edge> > edge_list_pes;
    vector<int> edge_list_ptr;
    vector<uint32_t> matrixA_idx;
    vector<float> matrixA_vec;
    prepare_matrixA_FPGA(M, K, cscColPtr, cscRowIdx, cscVal, edge_list_pes, edge_list_ptr, matrixA_vec, matrixA_idx);
    vector<int, aligned_allocator<int> > edge_list_ptr_hls;
    vector<uint32_t, aligned_allocator<uint32_t> > matrixA_idx_hls;
    vector<float, aligned_allocator<float> > matrixA_vec_hls;

    edge_list_ptr_hls.resize(edge_list_ptr.size(), 0);
    // transfer list data to hls data
    for (size_t i = 0; i < edge_list_ptr.size(); i++){
        edge_list_ptr_hls[i] = edge_list_ptr[i];
    }

    matrixA_idx_hls.resize(matrixA_idx.size(), 0);
    // transfer list data to hls data
    for (size_t i = 0; i < matrixA_idx.size(); i++){
        matrixA_idx_hls[i] = matrixA_idx[i];
    }

    matrixA_vec_hls.resize(matrixA_vec.size(), 0);
    // transfer list data to hls data
    for (size_t i = 0; i < matrixA_vec.size(); i++){
        matrixA_vec_hls[i] = matrixA_vec[i];
    }
    cout << "preparing sparse A done\n";

    cout << "preparing sparse B for FPGA ...\n";
    vector<float> matrixB_vec;
    prepare_matrixB_FPGA(K, N, matrixB, matrixB_vec);
    vector<float, aligned_allocator<float> > matrixB_vec_hls;
    
    matrixB_vec_hls.resize(matrixB_vec.size(), 0);
    // transfer list data to hls data
    for (size_t i = 0; i < matrixB_vec.size(); i++){
        matrixB_vec_hls[i] = matrixB_vec[i];
    }
    cout << "preparing sparse B done\n";

    
    cout << "preparing sparse C for FPGA ...\n";
    vector<float> matrixC_vec;
    prepare_matrixC_FPGA(M, N, matrixC_vec);
    vector<float, aligned_allocator<float> > matrixC_vec_hls;

    matrixC_vec_hls.resize(matrixC_vec.size(), 0);
    // transfer list data to hls data
    for (size_t i = 0; i < matrixC_vec.size(); i++){
        matrixC_vec_hls[i] = matrixC_vec[i];
    }
    cout << "preparing sparse C done\n";

    vector<float> matrixC;
    cout << "estimating time running calculation on cpu ...\n";
    auto startCpuTime = chrono::steady_clock::now();
    cpu_matrix_cal(M, N, K, numElements, matrixB, matrixC, cscColPtr, cscRowIdx, cscVal);
    auto endCpuTime = chrono::steady_clock::now();
    double timeCpu = chrono::duration_cast<chrono::nanoseconds>(endCpuTime - startCpuTime).count();

    cout << "invoking kernel ...\n";
    int lenEdgeListPtr = edge_list_ptr.size();
    int lenEdgePtr = edge_list_ptr.back();

    cout << "M: " << M << endl;
    cout << "K: " << K << endl;
    

    // invoke_kernel
    if (argc != 2) {
        printf("Usage: %s <XCLBIN> \n", argv[0]);
        return -1;
    }

    std::string binaryFile = argv[1];
    cl_int err;
    cl::CommandQueue q;
    std::string krnl_name = "krnl_sparse_matrix_acc";
    std::vector<cl::Kernel> krnls(NUM_KERNEL);
    cl::Context context;

    // OPENCL HOST CODE AREA START
    // The get_xil_devices will return vector of Xilinx Devices
    auto devices = xcl::get_xil_devices();
    // read_binary_file() command will find the OpenCL binary file created using
    // the
    // V++ compiler load into OpenCL Binary and return pointer to file buffer.
    auto fileBuf = xcl::read_binary_file(binaryFile);
    
    cl::Program::Binaries bins{{fileBuf.data(), fileBuf.size()}};
    bool valid_device = false;
    for (unsigned int i = 0; i < devices.size(); i++) {
        auto device = devices[i];
        // Creating Context and Command Queue for selected Device
        OCL_CHECK(err, context = cl::Context(device, nullptr, nullptr, nullptr, &err));
        OCL_CHECK(err, q = cl::CommandQueue(context, device,
                                            CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE | CL_QUEUE_PROFILING_ENABLE, &err));

        cout << "Trying to program device[" << i << "]: " << device.getInfo<CL_DEVICE_NAME>() << endl;
        cl::Program program(context, {device}, bins, nullptr, &err);
        if (err != CL_SUCCESS) {
            cout << "Failed to program device[" << i << "] with xclbin file!\n";
        } else {
            cout << "Device[" << i << "]: program successful!\n";
            // Creating Kernel object using Compute unit names

            for (int i = 0; i < NUM_KERNEL; i++) {
                std::string cu_id = std::to_string(i + 1);
                std::string krnl_name_full = krnl_name + ":{" + "krnl_sparse_matrix_acc_" + cu_id + "}";

                printf("Creating a kernel [%s] for CU(%d)\n", krnl_name_full.c_str(), i + 1);

                // Here Kernel object is created by specifying kernel name along with
                // compute unit.
                // For such case, this kernel object can only access the specific
                // Compute unit

                OCL_CHECK(err, krnls[i] = cl::Kernel(program, krnl_name_full.c_str(), &err));
            }
            valid_device = true;
            break; // we break because we found a valid device
        }
    }
    if (!valid_device) {
        cout << "Failed to program any device found, exit!\n";
        exit(EXIT_FAILURE);
    }
    std::vector<cl_mem_ext_ptr_t> inBufExtHLSPtr(NUM_KERNEL);
    std::vector<cl_mem_ext_ptr_t> inBufExtMatrixAIdx(NUM_KERNEL);
    std::vector<cl_mem_ext_ptr_t> inBufExtMatrixA(NUM_KERNEL);
    std::vector<cl_mem_ext_ptr_t> inBufExtMAtrixB(NUM_KERNEL);
    std::vector<cl_mem_ext_ptr_t> outBufExtMatrixC(NUM_KERNEL);

    std::vector<cl::Buffer> buffer_HLSPtr(NUM_KERNEL);
    std::vector<cl::Buffer> buffer_matrixAIdx(NUM_KERNEL);
    std::vector<cl::Buffer> buffer_matrixA(NUM_KERNEL);
    std::vector<cl::Buffer> buffer_matrixB(NUM_KERNEL);
    std::vector<cl::Buffer> buffer_matrixC(NUM_KERNEL);

    for (int i = 0; i < NUM_KERNEL; i++) {
        inBufExtHLSPtr[i].obj = edge_list_ptr_hls.data();
        inBufExtHLSPtr[i].param = 0;
        inBufExtHLSPtr[i].flags = pc[i * 4];

        inBufExtMatrixAIdx[i].obj = matrixA_idx_hls.data();
        inBufExtMatrixAIdx[i].param = 0;
        inBufExtMatrixAIdx[i].flags = pc[(i * 4) + 1];

        inBufExtMatrixA[i].obj = matrixA_vec_hls.data();
        inBufExtMatrixA[i].param = 0;
        inBufExtMatrixA[i].flags = pc[(i * 4) + 2];

        inBufExtMAtrixB[i].obj = matrixB_vec_hls.data();
        inBufExtMAtrixB[i].param = 0;
        inBufExtMAtrixB[i].flags = pc[(i * 4) + 3];

        outBufExtMatrixC[i].obj = matrixC_vec_hls.data();
        outBufExtMatrixC[i].param = 0;
        outBufExtMatrixC[i].flags = pc[(i * 4) + 4];
    }
    
    for (int i = 0; i < NUM_KERNEL; i++) {
        OCL_CHECK(err,
                  buffer_HLSPtr[i] = cl::Buffer(context, CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR,
                                                sizeof(uint32_t) * edge_list_ptr_hls.size(), &inBufExtHLSPtr[i], &err));
        OCL_CHECK(err,
                  buffer_matrixAIdx[i] = cl::Buffer(context, CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR,
                                                sizeof(uint32_t) * matrixA_idx_hls.size(), &inBufExtMatrixAIdx[i], &err));
        OCL_CHECK(err,
                  buffer_matrixA[i] = cl::Buffer(context, CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR,
                                                sizeof(float) * matrixA_vec_hls.size(), &inBufExtMatrixA[i], &err));
        OCL_CHECK(err,
                  buffer_matrixB[i] = cl::Buffer(context, CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR,
                                                sizeof(float) * matrixB_vec_hls.size(), &inBufExtMAtrixB[i], &err));
        OCL_CHECK(err,
                  buffer_matrixC[i] = cl::Buffer(context, CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR,
                                                sizeof(float) * matrixC_vec_hls.size(), &outBufExtMatrixC[i], &err));
    }
    auto read_start = std::chrono::steady_clock::now();
    // Copy input data to Device Global Memory
    for (int i = 0; i < NUM_KERNEL; i++) {
        OCL_CHECK(err,
                  err = q.enqueueMigrateMemObjects({buffer_HLSPtr[i], buffer_matrixAIdx[i], buffer_matrixA[i], buffer_matrixB[i]}, 0 /* 0 means from host*/));
    }
    q.finish();
    auto read_end = std::chrono::steady_clock::now();

    auto kernel_start = std::chrono::steady_clock::now();
    for (int i = 0; i < NUM_KERNEL; i++) {
        // Setting the k_vadd Arguments
        OCL_CHECK(err, err = krnls[i].setArg(0, buffer_HLSPtr[i]));
        OCL_CHECK(err, err = krnls[i].setArg(1, buffer_matrixAIdx[i]));
        OCL_CHECK(err, err = krnls[i].setArg(2, buffer_matrixA[i]));
        OCL_CHECK(err, err = krnls[i].setArg(3, buffer_matrixB[i]));
        OCL_CHECK(err, err = krnls[i].setArg(4, buffer_matrixC[i]));
        OCL_CHECK(err, err = krnls[i].setArg(5, lenEdgeListPtr));
        OCL_CHECK(err, err = krnls[i].setArg(6, lenEdgePtr));
        OCL_CHECK(err, err = krnls[i].setArg(7, M));
        OCL_CHECK(err, err = krnls[i].setArg(8, K));
        OCL_CHECK(err, err = krnls[i].setArg(9, N));
        // Invoking the kernel
        OCL_CHECK(err, err = q.enqueueTask(krnls[i]));
    }
    q.finish();
    auto kernel_end = std::chrono::steady_clock::now();

    auto write_start = std::chrono::steady_clock::now();
    // Copy Result from Device Global Memory to Host Local Memory
    for (int i = 0; i < NUM_KERNEL; i++) {
        OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_matrixC[i]},
                                                        CL_MIGRATE_MEM_OBJECT_HOST));
    }
    q.finish();
    auto write_end = std::chrono::steady_clock::now();

    size_t mismatch_cnt = 0;

    for (size_t i = 0; i < K * N; i++){
        float diff = matrixC[i] - matrixC_vec_hls[i];
        if (diff > 0.1){
            mismatch_cnt ++;
        }
    }

    double read_time = chrono::duration_cast<chrono::nanoseconds>(read_end - read_start).count() / NUM_KERNEL;
    double kernel_time = chrono::duration_cast<chrono::nanoseconds>(kernel_end - kernel_start).count() / NUM_KERNEL;
    double write_time = chrono::duration_cast<chrono::nanoseconds>(write_end - write_start).count() / NUM_KERNEL;

    cout << "cpu calculation time: (" << timeCpu / 1000 << " msec)\n";
    cout << "mismatch cnt: (" << mismatch_cnt << ")\n";
    cout << "read memory time: (" << read_time / 1000 << " msec)\n";
    cout << "kernel calculation time: (" << kernel_time / 1000 << " msec)\n";
    cout << "write memory time: (" << write_time / 1000 << " msec)\n";

    cout << "TEST FINISHED";
    return EXIT_SUCCESS;
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
                          vector<float> &matrixA_vec,
                          vector<uint32_t> &matrixA_idx) {

    scheduler(cscColPtr, cscRowIdx, cscVal, NUM_PE, M, K, WINDOW_SIZE, edge_list_pes, edge_list_ptr);

    edge_list_64bit(edge_list_pes, edge_list_ptr, matrixA_vec, matrixA_idx);
}

void prepare_matrixB_FPGA(int K,
                          int N,
                          vector<float> matrixB,
                          vector<float> &matrixB_vec){

    
    matrixB_vec.resize(matrixB.size(), 0.0);

    for (int n = 0; n < N; n++){
        for (int k = 0; k < K; k++){
            matrixB_vec[n + N * k] = matrixB[k + K * n];
        }
    }
}

void prepare_matrixC_FPGA(int M,
                          int N,
                          vector<float> &matrixC_vec){

    matrixC_vec.resize(M * N, 0.0);
}

