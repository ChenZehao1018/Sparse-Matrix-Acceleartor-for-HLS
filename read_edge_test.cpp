#include <hls_stream.h>
#include <ap_int.h>
#include <hls_vector.h>
#include <iostream>

void read_edge_list_ptr(int lenEdgeListPtr,
						int* HLSPtr_i,
                        hls::stream<int> & fifoEdgeListPtr_o
                        );
int main() {
    int lenEdgeListPtr = 3;
    int HLSPtr_i[] = {0, 7, 12};

    hls::stream<int> fifoEdgeListPtr_o;

    read_edge_list_ptr(lenEdgeListPtr, HLSPtr_i, fifoEdgeListPtr_o);


    while(!fifoEdgeListPtr_o.empty()){
    	std::cout << "fifoEdgeListPtr_o element: " << fifoEdgeListPtr_o.read() << std::endl;
    }
    return 0;
}
