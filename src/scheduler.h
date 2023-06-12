#include <vector>
#include <iostream>
using namespace std;

struct edge {
    int col;    // The column index of the non-zero element in the sparse matrix.
    int row;    // The row index of the non-zero element in the sparse matrix.
    float val;  // The value of the non-zero element in the sparse matrix.

    edge(int d = -1, int s = -1, float v = 0.0): col(d), row(s), val(v) {}

    edge& operator=(const edge& a) {
        col = a.col;
        row = a.row;
        val = a.val;
        return *this;
    }
};


void scheduler(
    const vector<int> & colPtr,
    const vector<int> & rowIndex,
    const vector<float> & values,
    const int numPE,
    const int numRows,
    const int numCols,
    const int windowSize,
    vector<vector<edge>> & edgeLists,
    vector<int> & edgeListPtr
);

void process_window(vector<vector<edge>> &tmpEdgeLists,
                    const vector<int> &colPtr,
                    const vector<int> &rowIndex,
                    const vector<float> &values,
                    int start_col, 
                    int end_col,
                    int numPE);

void form_scheduled_edge_list(const vector<vector<edge>> &tmpEdgeLists,
                              vector<vector<edge>> &edgeLists,
                              int baseColIdx, 
                              int numRows, 
                              int numPE);

void schedule_edge_one_PE(
    const vector<edge> &tmpEdgeList,
    vector<edge> & edgeList,
    const int baseColIdx,
    const int startAddr,
    const int numRows,
    const int numPE
);

void insert_bubbles(vector<vector<edge>> &edgeLists,
                    vector<int> & edgeListPtr,
                    int numPE,
                    int iter);


void scheduler(
    const vector<int> & colPtr,               // Column pointers for the Compressed Sparse Column (CSC) format matrix.
    const vector<int> & rowIndex,             // Row indices for the CSC format matrix.
    const vector<float> & values,             // Non-zero values for the CSC format matrix.
    const int numPE,                          // Number of Processing Elements (PEs).
    const int numRows,                        // Number of rows in the matrix.
    const int numCols,                        // Number of columns in the matrix.
    const int windowSize,                     // Size of the window for processing.
    vector<vector<edge>> & edgeLists,         // Edge lists for all PEs.
    vector<int> & edgeListPtr            // Edge list pointers for each window.
){
    // Initialize edge lists for all PEs and edge list pointers.
    edgeLists.resize(numPE);
    edgeListPtr.resize((numCols + windowSize - 1) / windowSize + 1, 0);
    vector<vector<edge>> tmpEdgeLists(numPE);

    // Iterate over each window of columns.
    for (int i = 0; i < ((numCols + windowSize - 1) / windowSize); i++){

        for (int p = 0; p < numPE; p++){
        tmpEdgeLists[p].resize(0);
        }

        // Iterate over columns within the window.
        process_window(tmpEdgeLists, colPtr, rowIndex, values, windowSize * i, min(windowSize * (i + 1), numCols), numPE);

        // Form the scheduled edge list for each PE.
        form_scheduled_edge_list(tmpEdgeLists, edgeLists, i * windowSize, numRows, numPE);

        // Insert bubbles to align edge list
        insert_bubbles(edgeLists, edgeListPtr, numPE, i);
    }
}

void process_window(vector<vector<edge>> &tmpEdgeLists,
                    const vector<int> &colPtr,
                    const vector<int> &rowIndex,
                    const vector<float> &values,
                    int start_col, 
                    int end_col,
                    int numPE) {
    // Iterate over columns within the window.
    for (int col = start_col; col < end_col; col++) {
        // Iterate over non-zero elements in the column.
        for (int j = colPtr[col]; j < colPtr[col + 1]; j++) {
            // Assign the element to the appropriate PE.
            int peId = rowIndex[j] % numPE;
            int pos = tmpEdgeLists[peId].size();
            tmpEdgeLists[peId].resize(pos + 1);
            tmpEdgeLists[peId][pos] = edge(col, rowIndex[j], values[j]);
        }
    }
}

void form_scheduled_edge_list(const vector<vector<edge>> &tmpEdgeLists,
                              vector<vector<edge>> &edgeLists,
                              int baseColIdx, 
                              int numRows, 
                              int numPE) {
    for (int p = 0; p < numPE; p++) {
        schedule_edge_one_PE(tmpEdgeLists[p], edgeLists[p], baseColIdx, edgeLists[p].size(), numRows, numPE);
    }
}

void schedule_edge_one_PE(
    const vector<edge> &tmpEdgeList,   // Temporary edge list for processing elements
    vector<edge> & edgeList,           // Output edge list for processing elements
    const int baseColIdx,              // The base column index used for adjusting column values
    const int startAddr,               // The starting index in the output edge list for the current processing element
    const int numRows,                 // The number of rows in the matrix
    const int numPE                    // The total number of processing elements
){
    // Define an empty edge with default values
    edge emptyEdge = {-1, -1, 0.0};

    // Initialize a vector to store the scheduled edges
    vector<edge> scheduledEdges;

    // Initialize a vector to store the number of cycles for each row, with an initial value of -4
    vector<int> rowCycles(numRows, -4);

    int colIdx, rowIdx;
    float value;
    for (size_t i = 0; i < tmpEdgeList.size(); i++){
        // Calculate the column, row, and value for the current processing element
        // colIdx = tmpEdgeList[i].col - baseColIdx;
        colIdx = tmpEdgeList[i].col;
        // rowIdx = tmpEdgeList[i].row / numPE;
        rowIdx = tmpEdgeList[i].row;
        value = tmpEdgeList[i].val;
        // Calculate the current cycle with a dependency delay of 4
        size_t cycle = rowCycles[rowIdx] + 4;
        // Check if the current cycle is already taken
        bool taken = true;
        while (taken){
            // Resize the scheduledEdges vector if necessary
            if(cycle >= scheduledEdges.size()){
                scheduledEdges.resize(cycle + 1, emptyEdge);
            }
            edge pe = scheduledEdges[cycle];
            // If the current cycle is taken, try the next cycle
            if(pe.row != -1)
                cycle = cycle + 1;
            else
                taken = false;
        }
        // Update the scheduledEdges vector with the current processing element
        scheduledEdges[cycle].col = colIdx;
        scheduledEdges[cycle].row = rowIdx;
        scheduledEdges[cycle].val = value;

        // Update the rowCycles vector for the current row
        rowCycles[rowIdx] = cycle;
    }
    // If there are scheduled edges, update the output edge list
    if(scheduledEdges.size() > 0){
        // Resize the output edge list and copy the scheduled edges to the correct position
        edgeList.resize(startAddr + scheduledEdges.size(), emptyEdge);
        for(size_t i = 0; i < scheduledEdges.size(); i++){
            edgeList[i + startAddr] = scheduledEdges[i];
        }
    }
}

// Function to insert bubbles to align edge list
void insert_bubbles(vector<vector<edge>> &edgeLists,
                    vector<int> & edgeListPtr,
                    int numPE,
                    int iter) {
    int maxLength = 0;
    for (int p = 0; p < numPE; p++) {
        maxLength = max((int)edgeLists[p].size(), maxLength);
    }
    for (int p = 0; p < numPE; p++) {
        edgeLists[p].resize(maxLength, edge(-1, -1, 0.0));
    }
    edgeListPtr[iter+1] = maxLength;
}