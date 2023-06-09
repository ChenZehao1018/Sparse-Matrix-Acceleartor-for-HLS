// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - enable ap_done interrupt (Read/Write)
//        bit 1  - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - ap_done (COR/TOW)
//        bit 1  - ap_ready (COR/TOW)
//        others - reserved
// 0x10 : Data signal of HLSPtr_i
//        bit 31~0 - HLSPtr_i[31:0] (Read/Write)
// 0x14 : Data signal of HLSPtr_i
//        bit 31~0 - HLSPtr_i[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of matrixA_hls_idx
//        bit 31~0 - matrixA_hls_idx[31:0] (Read/Write)
// 0x20 : Data signal of matrixA_hls_idx
//        bit 31~0 - matrixA_hls_idx[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of matrixA_i
//        bit 31~0 - matrixA_i[31:0] (Read/Write)
// 0x2c : Data signal of matrixA_i
//        bit 31~0 - matrixA_i[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of matrixB_i
//        bit 31~0 - matrixB_i[31:0] (Read/Write)
// 0x38 : Data signal of matrixB_i
//        bit 31~0 - matrixB_i[63:32] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of matrixC_o
//        bit 31~0 - matrixC_o[31:0] (Read/Write)
// 0x44 : Data signal of matrixC_o
//        bit 31~0 - matrixC_o[63:32] (Read/Write)
// 0x48 : reserved
// 0x4c : Data signal of lenEdgeListPtr
//        bit 31~0 - lenEdgeListPtr[31:0] (Read/Write)
// 0x50 : reserved
// 0x54 : Data signal of lenEdgePtr
//        bit 31~0 - lenEdgePtr[31:0] (Read/Write)
// 0x58 : reserved
// 0x5c : Data signal of M
//        bit 31~0 - M[31:0] (Read/Write)
// 0x60 : reserved
// 0x64 : Data signal of K
//        bit 31~0 - K[31:0] (Read/Write)
// 0x68 : reserved
// 0x6c : Data signal of N
//        bit 31~0 - N[31:0] (Read/Write)
// 0x70 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_AP_CTRL              0x00
#define CONTROL_ADDR_GIE                  0x04
#define CONTROL_ADDR_IER                  0x08
#define CONTROL_ADDR_ISR                  0x0c
#define CONTROL_ADDR_HLSPTR_I_DATA        0x10
#define CONTROL_BITS_HLSPTR_I_DATA        64
#define CONTROL_ADDR_MATRIXA_HLS_IDX_DATA 0x1c
#define CONTROL_BITS_MATRIXA_HLS_IDX_DATA 64
#define CONTROL_ADDR_MATRIXA_I_DATA       0x28
#define CONTROL_BITS_MATRIXA_I_DATA       64
#define CONTROL_ADDR_MATRIXB_I_DATA       0x34
#define CONTROL_BITS_MATRIXB_I_DATA       64
#define CONTROL_ADDR_MATRIXC_O_DATA       0x40
#define CONTROL_BITS_MATRIXC_O_DATA       64
#define CONTROL_ADDR_LENEDGELISTPTR_DATA  0x4c
#define CONTROL_BITS_LENEDGELISTPTR_DATA  32
#define CONTROL_ADDR_LENEDGEPTR_DATA      0x54
#define CONTROL_BITS_LENEDGEPTR_DATA      32
#define CONTROL_ADDR_M_DATA               0x5c
#define CONTROL_BITS_M_DATA               32
#define CONTROL_ADDR_K_DATA               0x64
#define CONTROL_BITS_K_DATA               32
#define CONTROL_ADDR_N_DATA               0x6c
#define CONTROL_BITS_N_DATA               32
