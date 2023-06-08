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
                          vector<unsigned long> &matrixA_hls_vec,
                          vector<int> &edge_list_ptr_hls);

void prepare_matrixB_FPGA(int K,
                          int N,
                          vector<float> matrixB,
                          vector<float> &matrixB_hls_vec);

void prepare_matrixC_FPGA(int M,
                          int N,
                          vector<float> &matrixC_hls_vec);

void invoke_kernel(int lenEdgeListPtr,
                   int lenEdgePtr,
                   int M,
                   int K,
                   int N,
                   vector<int, aligned_allocator<int> > edge_list_ptr_hls,
                   vector<unsigned long, aligned_allocator<unsigned long> > matrixA_hls_vec,
                   vector<float, aligned_allocator<float> > matrixB_hls_vec,
                   vector<float, aligned_allocator<float> > matrixC_hls_vec
                   );

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
    vector<int, aligned_allocator<int> > edge_list_ptr_hls;
    // vector<int> edge_list_ptr_hls;
    vector<unsigned long, aligned_allocator<unsigned long> > matrixA_hls_vec;
    // vector<unsigned long> matrixA_hls_vec;
    prepare_matrixA_FPGA(M, K, cscColPtr, cscRowIdx, cscVal, edge_list_pes, edge_list_ptr, matrixA_hls_vec, edge_list_ptr_hls);
    cout << "preparing sparse A done\n";

    vector<float, aligned_allocator<float> > matrixB_hls_vec;
    // vector<float> matrixB_hls_vec;
    cout << "preparing sparse B for FPGA ...\n";
    prepare_matrixB_FPGA(K, N, matrixB, matrixB_hls_vec);
    cout << "preparing sparse B done\n";

    vector<float, aligned_allocator<float> > matrixC_hls_vec;
    // vector<float> matrixC_hls_vec;
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
    invoke_kernel(lenEdgeListPtr, lenEdgePtr, M, K, N, edge_list_ptr_hls, matrixA_hls_vec, matrixB_hls_vec, matrixC_hls_vec);
    
    
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

void invoke_kernel(int lenEdgeListPtr,
                   int lenEdgePtr,
                   int M,
                   int K,
                   int N,
                   vector<int, aligned_allocator<int> > edge_list_ptr_hls,
                   vector<unsigned long, aligned_allocator<unsigned long> > matrixA_hls_vec,
                   vector<float, aligned_allocator<float> > matrixB_hls_vec,
                   vector<float, aligned_allocator<float> > matrixC_hls_vec
                   ){
                
    std::string binaryFile = argv[1];
    cl_int err;
    cl::CommandQueue q;
    std::string krnl_name = "sparse_matrix_mul_acc";
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

        std::cout << "Trying to program device[" << i << "]: " << device.getInfo<CL_DEVICE_NAME>() << std::endl;
        cl::Program program(context, {device}, bins, nullptr, &err);
        if (err != CL_SUCCESS) {
            std::cout << "Failed to program device[" << i << "] with xclbin file!\n";
        } else {
            std::cout << "Device[" << i << "]: program successful!\n";
            // Creating Kernel object using Compute unit names

            for (int i = 0; i < NUM_KERNEL; i++) {
                std::string cu_id = std::to_string(i + 1);
                std::string krnl_name_full = krnl_name + ":{" + "sparse_matrix_mul_acc_" + cu_id + "}";

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
        std::cout << "Failed to program any device found, exit!\n";
        exit(EXIT_FAILURE);
    }
    std::vector<cl_mem_ext_ptr_t> inBufExtHLSPtr(NUM_KERNEL);
    std::vector<cl_mem_ext_ptr_t> inBufExtMatrixA(NUM_KERNEL);
    std::vector<cl_mem_ext_ptr_t> inBufExtMAtrixB(NUM_KERNEL);
    std::vector<cl_mem_ext_ptr_t> outBufExtMatrixC(NUM_KERNEL);

    std::vector<cl::Buffer> buffer_HLSPtr(NUM_KERNEL);
    std::vector<cl::Buffer> buffer_matrixA(NUM_KERNEL);
    std::vector<cl::Buffer> buffer_matrixB(NUM_KERNEL);
    std::vector<cl::Buffer> buffer_matrixC(NUM_KERNEL);

    for (int i = 0; i < NUM_KERNEL; i++) {
        inBufExtHLSPtr[i].obj = edge_list_ptr_hls.data();
        inBufExtHLSPtr[i].param = 0;
        inBufExtHLSPtr[i].flags = pc[i * 4];

        inBufExtMatrixA[i].obj = matrixA_hls_vec.data();
        inBufExtMatrixA[i].param = 0;
        inBufExtMatrixA[i].flags = pc[(i * 4) + 1];

        inBufExtMAtrixB[i].obj = matrixB_hls_vec.data();
        inBufExtMAtrixB[i].param = 0;
        inBufExtMAtrixB[i].flags = pc[(i * 4) + 2];

        outBufExtMatrixC[i].obj = matrixC_hls_vec[i].data();
        outBufExtMatrixC[i].param = 0;
        outBufExtMatrixC[i].flags = pc[(i * 4) + 3];
    }

    for (int i = 0; i < NUM_KERNEL; i++) {
        OCL_CHECK(err,
                  buffer_HLSPtr[i] = cl::Buffer(context, CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR,
                                                sizeof(int) * edge_list_ptr_hls.size(), &inBufExtHLSPtr[i], &err));
        OCL_CHECK(err,
                  buffer_matrixA[i] = cl::Buffer(context, CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR,
                                                sizeof(unsigned long) * matrixA_hls_vec.size(), &inBufExtMatrixA[i], &err));
        OCL_CHECK(err,
                  buffer_matrixB[i] = cl::Buffer(context, CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR,
                                                sizeof(float) * matrixB_hls_vec.size(), &inBufExtMAtrixB[i], &err));
        OCL_CHECK(err,
                  buffer_matrixC[i] = cl::Buffer(context, CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR,
                                                sizeof(float) * matrixC_hls_vec.size(), &inBufExtMAtrixC[i], &err));
    }

    // Copy input data to Device Global Memory
    for (int i = 0; i < NUM_KERNEL; i++) {
        OCL_CHECK(err,
                  err = q.enqueueMigrateMemObjects({buffer_HLSPtr[i], buffer_matrixA[i], buffer_matrixB[i]}, 0 /* 0 means from host*/));
    }
    q.finish();

    double kernel_time_in_sec = 0, result = 0;

    std::chrono::duration<double> kernel_time(0);

    auto kernel_start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < NUM_KERNEL; i++) {
        // Setting the k_vadd Arguments
        OCL_CHECK(err, err = krnls[i].setArg(0, buffer_HLSPtr[i]));
        OCL_CHECK(err, err = krnls[i].setArg(1, buffer_matrixA[i]));
        OCL_CHECK(err, err = krnls[i].setArg(2, buffer_matrixB[i]));
        OCL_CHECK(err, err = krnls[i].setArg(3, buffer_matrixC[i]));
        OCL_CHECK(err, err = krnls[i].setArg(4, lenEdgeListPtr));
        OCL_CHECK(err, err = krnls[i].setArg(5, M));
        OCL_CHECK(err, err = krnls[i].setArg(6, K));
        OCL_CHECK(err, err = krnls[i].setArg(7, N));
        // Invoking the kernel
        OCL_CHECK(err, err = q.enqueueTask(krnls[i]));
    }
    q.finish();
    auto kernel_end = std::chrono::high_resolution_clock::now();

    kernel_time = std::chrono::duration<double>(kernel_end - kernel_start);

    kernel_time_in_sec = kernel_time.count();
    kernel_time_in_sec /= NUM_KERNEL;

    // Copy Result from Device Global Memory to Host Local Memory
    for (int i = 0; i < NUM_KERNEL; i++) {
        OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_matrixC[i]},
                                                        CL_MIGRATE_MEM_OBJECT_HOST));
    }
    q.finish();

}