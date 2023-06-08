#include <iostream>
#include <ap_fixed.h>

#define NUM_WORDS 2

void sorc_C_core(ap_uint<16> row_i,
				 ap_fixed<32, 16> matrixC_val_i,
				 ap_fixed<32, 16> *valC_o);

int main() {
    ap_uint<16> row_i = 1;
    ap_fixed<32, 16> matrixC_val_i = 3;

    ap_fixed<32, 16> valC_o[NUM_WORDS] = {1, 2};

    std::cout << "Before calling sorc_C_core:" << std::endl;
    for (int i = 0; i < NUM_WORDS; i++) {
        std::cout << "valC_o[" << i << "] = " << valC_o[i] << std::endl;
    }

    sorc_C_core(row_i, matrixC_val_i, valC_o);

    std::cout << "After calling sorc_C_core:" << std::endl;
    for (int i = 0; i < NUM_WORDS; i++) {
        std::cout << "valC_o[" << i << "] = " << valC_o[i] << std::endl;
    }

    return 0;
}
