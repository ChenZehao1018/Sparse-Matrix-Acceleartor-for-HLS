#include <vector>
#include <iostream>
#include "mmio.h"
using namespace std;

struct element
{
    int row;
    int col;
    float val;
};

void read_matrix(char * filename,
                        vector<int> & elePtr,
                        vector<int> & eleIndex,
                        vector<float> & eleVal,
                        int & M,
                        int & K,
                        int & numElements,
                        bool & matrixType
);

void read_init(FILE * file,
               char * filename,
               MM_typecode & matcode,
               int & M,
               int & N,
               int & numElements_mmio);

void read_matrix_data(FILE * file,
                 char * filename,
                 int numElements_mmio,
                 int & numElements,
                 vector<int> & rowIndex,
                 vector<int> & colIndex,
                 vector<float> & eleVal,
                 MM_typecode & matcode);

void sort_by(int numElements,
                vector<int> & rowIndex,
                vector<int> & colIndex,
                vector<float> & eleVal,
                int (* cmp_func)(const void *, const void *));

int cmp_by_row_col(const void *aa,
                   const void *bb);

void matrix_data_count(vector<int> & elePtr, 
                       vector<int> & eleIndex, 
                       vector<int> & rowIndex, 
                       vector<int> & colIndex, 
                       vector<float> & eleVal,
                       int M,
                       int K,
                       int numElements_mmio, 
                       bool & matrixType,
                       MM_typecode matcode);


void read_matrix(char * filename,
                        vector<int> & elePtr,
                        vector<int> & eleIndex,
                        vector<float> & eleVal,
                        int & M,
                        int & K,
                        int & numElements,
                        bool & matrixType
){
    int numElements_mmio;
    FILE * file;
    MM_typecode matcode;
    vector<int> rowIndex;
    vector<int> colIndex;

    // Open the file
    file = fopen(filename, "r");

    // Read the matrix metadata
    read_init(file, filename, matcode, M, K, numElements_mmio);

    // Read the matrix data
    read_matrix_data(file, filename, numElements_mmio, numElements, rowIndex, colIndex, eleVal, matcode);

    // Close the file
    fclose(file);

    // Count the number of non-zero elements per row (CSR) or column (CSC)
    matrix_data_count(elePtr, eleIndex, rowIndex, colIndex, eleVal, M, K, numElements, matrixType, matcode);
}


void read_init(FILE * file,
               char * filename,
               MM_typecode & matcode,
               int & M,
               int & K,
               int & numElements_mmio){
    int return_code;

    // Use Matrix Market I/O (mmio) to read the matrix type (dense or sparse)
    if(mm_read_banner(file, &matcode) != 0){
        cout << "Could not find the Matrix type!" << endl;
        exit(1);
    }

    // Read the matrix dimensions (rows, columns) and the number of non-zero elements (for sparse matrices)
    if((return_code = mm_read_mtx_crd_size(file, &M, &K, &numElements_mmio)) != 0){
        cout << "Can not read the Matrix format for" << filename << endl;
        exit(1);
    }
    cout << "martix A --number_row_num: "<< M <<" number_col_num: "<< K << endl;
}


void read_matrix_data(FILE * file,
                 char * filename,
                 int numElements_mmio,
                 int & numElements,
                 vector<int> & rowIndex,
                 vector<int> & colIndex,
                 vector<float> & eleVal,
                 MM_typecode & matcode){
    int row_index, col_index;
    float value;
    int index = 0;

    // Calculate the number of non-zero elements
    int numElements_mmio_real = (mm_is_symmetric(matcode))? (numElements_mmio * 2) : numElements_mmio;
    rowIndex.resize(numElements_mmio_real);
    colIndex.resize(numElements_mmio_real);
    eleVal.resize(numElements_mmio_real);
    cout << "loading input matrix from " << filename << "\n";

    // Read each element from the file
    for (int i = 0; i < numElements_mmio; i++){
        // If the matrix is in pattern format, read only row and column indices
        if(mm_is_pattern(matcode)){
            fscanf(file, "%d %d \n", &row_index, &col_index);
            value = 1.0;
        }
        // Otherwise, read row and column indices, and the value
        else{
            fscanf(file, "%d %d %f\n", &row_index, &col_index, &value);
        }
        
        unsigned int * tmpPointer_v = reinterpret_cast<unsigned int*>(&value);
        unsigned int uint_v = *tmpPointer_v;

        // If the value is not zero, process the element
        if(uint_v != 0){
            // Check if there are any issues with the indices
            if(row_index < 1 || col_index < 1){
                cout << "index = " << index << " [" << row_index - 1 << ", "\
                << col_index - 1 << "] = " << value << endl;
                exit(1);
            }

            // Store the element in the rowIndex, colIndex, and eleVal vectors
            rowIndex[index] = row_index - 1;
            colIndex[index] = col_index - 1;
            eleVal[index] = value;
            index++;

            // If the matrix is symmetric, store the symmetric element
            if(mm_is_symmetric(matcode)){
                if(row_index != col_index){
                    rowIndex[index] = col_index - 1;
                    colIndex[index] = row_index - 1;
                    eleVal[index] = value;
                    index++;
                }
            }
        }
    }
    // Update the number of elements read from the file
    numElements = index;
}


void sort_by(int numElements,
                vector<int> & rowIndex,
                vector<int> & colIndex,
                vector<float> & eleVal,
                int (* cmp_func)(const void *, const void *)){
    // Create an array of element structs to store row, column, and value information
    element * element_arr = new element[numElements];

    // Copy the contents of rowIndex, colIndex, and eleVal to the element_arr
    for (int i = 0; i < numElements; i++){
        element_arr[i].row = rowIndex[i];
        element_arr[i].col = colIndex[i];
        element_arr[i].val = eleVal[i];
    }

    // Sort the element_arr using the provided comparison function
    qsort(element_arr, numElements, sizeof(element), cmp_func);

    // Copy the sorted contents of element_arr back to rowIndex, colIndex, and eleVal
    for(int i = 0; i < numElements; i++){
        rowIndex[i] = element_arr[i].row;
        colIndex[i] = element_arr[i].col;
        eleVal[i] = element_arr[i].val;
    }

    // Deallocate the memory used by element_arr
    delete [] element_arr;
}


int cmp_by_row_col(const void *aa,
                   const void *bb
){
    // Cast input pointers to element struct pointers
    element * a = (element *) aa;
    element * b = (element *) bb;

    // Compare columns of the two element structs
    if (a->col > b->col) return +1;
    if (a->col < b->col) return -1;

    // If columns are equal, compare rows of the two element structs
    if (a->row > b->row) return +1;
    if (a->row < b->row) return -1;
    
    // If both columns and rows are equal, return 0
    return 0;
}

void matrix_data_count(vector<int> & elePtr, 
                       vector<int> & eleIndex, 
                       vector<int> & rowIndex, 
                       vector<int> & colIndex, 
                       vector<float> & eleVal,
                       int M,
                       int K,
                       int numElements_mmio, 
                       bool & matrixType,
                       MM_typecode matcode){
    elePtr.resize(K + 1);
    vector<int> counter(K, 0);
    for(int i = 0; i < numElements_mmio; i++){
        counter[colIndex[i]]++;
    }

    // Calculate the cumulative sum of non-zero elements
    int t = 0;
    for (int i = 0; i < K; i++) {
        t = t + counter[i];
    }
    elePtr[0] = 0;
    for (int i = 0; i < K + 1; i++){
        elePtr[i] = elePtr[i - 1] + counter[i - 1];
    }

    // Fill the eleIndex vector with column indices (CSR) or row indices (CSC)
    eleIndex.resize(numElements_mmio);
    for(int i = 0; i < numElements_mmio; i++){
        eleIndex[i] = rowIndex[i];
    }

    // Determine the matrix type (sparse, dense, symmetric)
    if (mm_is_symmetric(matcode)){
        eleVal.resize(numElements_mmio);
        matrixType = true;
    }
    if (mm_is_sparse(matcode)){
        matrixType = true;
    }
    if (mm_is_dense(matcode)){
        matrixType = false;
    }
}
