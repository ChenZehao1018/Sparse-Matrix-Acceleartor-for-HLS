// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module krnl_sparse_matrix_acc_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 7,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire [63:0]                   HLSPtr_i,
    output wire [63:0]                   matrixA_hls_idx,
    output wire [63:0]                   matrixA_i,
    output wire [63:0]                   matrixB_i,
    output wire [63:0]                   matrixC_o,
    output wire [31:0]                   lenEdgeListPtr,
    output wire [31:0]                   lenEdgePtr,
    output wire [31:0]                   M,
    output wire [31:0]                   K,
    output wire [31:0]                   N,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle
);
//------------------------Address Info-------------------
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

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL                = 7'h00,
    ADDR_GIE                    = 7'h04,
    ADDR_IER                    = 7'h08,
    ADDR_ISR                    = 7'h0c,
    ADDR_HLSPTR_I_DATA_0        = 7'h10,
    ADDR_HLSPTR_I_DATA_1        = 7'h14,
    ADDR_HLSPTR_I_CTRL          = 7'h18,
    ADDR_MATRIXA_HLS_IDX_DATA_0 = 7'h1c,
    ADDR_MATRIXA_HLS_IDX_DATA_1 = 7'h20,
    ADDR_MATRIXA_HLS_IDX_CTRL   = 7'h24,
    ADDR_MATRIXA_I_DATA_0       = 7'h28,
    ADDR_MATRIXA_I_DATA_1       = 7'h2c,
    ADDR_MATRIXA_I_CTRL         = 7'h30,
    ADDR_MATRIXB_I_DATA_0       = 7'h34,
    ADDR_MATRIXB_I_DATA_1       = 7'h38,
    ADDR_MATRIXB_I_CTRL         = 7'h3c,
    ADDR_MATRIXC_O_DATA_0       = 7'h40,
    ADDR_MATRIXC_O_DATA_1       = 7'h44,
    ADDR_MATRIXC_O_CTRL         = 7'h48,
    ADDR_LENEDGELISTPTR_DATA_0  = 7'h4c,
    ADDR_LENEDGELISTPTR_CTRL    = 7'h50,
    ADDR_LENEDGEPTR_DATA_0      = 7'h54,
    ADDR_LENEDGEPTR_CTRL        = 7'h58,
    ADDR_M_DATA_0               = 7'h5c,
    ADDR_M_CTRL                 = 7'h60,
    ADDR_K_DATA_0               = 7'h64,
    ADDR_K_CTRL                 = 7'h68,
    ADDR_N_DATA_0               = 7'h6c,
    ADDR_N_CTRL                 = 7'h70,
    WRIDLE                      = 2'd0,
    WRDATA                      = 2'd1,
    WRRESP                      = 2'd2,
    WRRESET                     = 2'd3,
    RDIDLE                      = 2'd0,
    RDDATA                      = 2'd1,
    RDRESET                     = 2'd2,
    ADDR_BITS                = 7;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle;
    reg                           int_ap_ready = 1'b0;
    wire                          task_ap_ready;
    reg                           int_ap_done = 1'b0;
    wire                          task_ap_done;
    reg                           int_task_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           auto_restart_status = 1'b0;
    wire                          auto_restart_done;
    reg                           int_gie = 1'b0;
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
    reg  [63:0]                   int_HLSPtr_i = 'b0;
    reg  [63:0]                   int_matrixA_hls_idx = 'b0;
    reg  [63:0]                   int_matrixA_i = 'b0;
    reg  [63:0]                   int_matrixB_i = 'b0;
    reg  [63:0]                   int_matrixC_o = 'b0;
    reg  [31:0]                   int_lenEdgeListPtr = 'b0;
    reg  [31:0]                   int_lenEdgePtr = 'b0;
    reg  [31:0]                   int_M = 'b0;
    reg  [31:0]                   int_K = 'b0;
    reg  [31:0]                   int_N = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_task_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_HLSPTR_I_DATA_0: begin
                    rdata <= int_HLSPtr_i[31:0];
                end
                ADDR_HLSPTR_I_DATA_1: begin
                    rdata <= int_HLSPtr_i[63:32];
                end
                ADDR_MATRIXA_HLS_IDX_DATA_0: begin
                    rdata <= int_matrixA_hls_idx[31:0];
                end
                ADDR_MATRIXA_HLS_IDX_DATA_1: begin
                    rdata <= int_matrixA_hls_idx[63:32];
                end
                ADDR_MATRIXA_I_DATA_0: begin
                    rdata <= int_matrixA_i[31:0];
                end
                ADDR_MATRIXA_I_DATA_1: begin
                    rdata <= int_matrixA_i[63:32];
                end
                ADDR_MATRIXB_I_DATA_0: begin
                    rdata <= int_matrixB_i[31:0];
                end
                ADDR_MATRIXB_I_DATA_1: begin
                    rdata <= int_matrixB_i[63:32];
                end
                ADDR_MATRIXC_O_DATA_0: begin
                    rdata <= int_matrixC_o[31:0];
                end
                ADDR_MATRIXC_O_DATA_1: begin
                    rdata <= int_matrixC_o[63:32];
                end
                ADDR_LENEDGELISTPTR_DATA_0: begin
                    rdata <= int_lenEdgeListPtr[31:0];
                end
                ADDR_LENEDGEPTR_DATA_0: begin
                    rdata <= int_lenEdgePtr[31:0];
                end
                ADDR_M_DATA_0: begin
                    rdata <= int_M[31:0];
                end
                ADDR_K_DATA_0: begin
                    rdata <= int_K[31:0];
                end
                ADDR_N_DATA_0: begin
                    rdata <= int_N[31:0];
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign interrupt         = int_gie & (|int_isr);
assign ap_start          = int_ap_start;
assign task_ap_done      = (ap_done && !auto_restart_status) || auto_restart_done;
assign task_ap_ready     = ap_ready && !int_auto_restart;
assign auto_restart_done = auto_restart_status && (ap_idle && !int_ap_idle);
assign HLSPtr_i          = int_HLSPtr_i;
assign matrixA_hls_idx   = int_matrixA_hls_idx;
assign matrixA_i         = int_matrixA_i;
assign matrixB_i         = int_matrixB_i;
assign matrixC_o         = int_matrixC_o;
assign lenEdgeListPtr    = int_lenEdgeListPtr;
assign lenEdgePtr        = int_lenEdgePtr;
assign M                 = int_M;
assign K                 = int_K;
assign N                 = int_N;
// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_done <= ap_done;
    end
end

// int_task_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_task_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_done)
            int_task_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_task_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_ready)
            int_ap_ready <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_ready <= 1'b0;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <=  WDATA[7];
    end
end

// auto_restart_status
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_status <= 1'b0;
    else if (ACLK_EN) begin
        if (int_auto_restart)
            auto_restart_status <= 1'b1;
        else if (ap_idle)
            auto_restart_status <= 1'b0;
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_HLSPtr_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_HLSPtr_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_HLSPTR_I_DATA_0)
            int_HLSPtr_i[31:0] <= (WDATA[31:0] & wmask) | (int_HLSPtr_i[31:0] & ~wmask);
    end
end

// int_HLSPtr_i[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_HLSPtr_i[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_HLSPTR_I_DATA_1)
            int_HLSPtr_i[63:32] <= (WDATA[31:0] & wmask) | (int_HLSPtr_i[63:32] & ~wmask);
    end
end

// int_matrixA_hls_idx[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_matrixA_hls_idx[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MATRIXA_HLS_IDX_DATA_0)
            int_matrixA_hls_idx[31:0] <= (WDATA[31:0] & wmask) | (int_matrixA_hls_idx[31:0] & ~wmask);
    end
end

// int_matrixA_hls_idx[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_matrixA_hls_idx[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MATRIXA_HLS_IDX_DATA_1)
            int_matrixA_hls_idx[63:32] <= (WDATA[31:0] & wmask) | (int_matrixA_hls_idx[63:32] & ~wmask);
    end
end

// int_matrixA_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_matrixA_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MATRIXA_I_DATA_0)
            int_matrixA_i[31:0] <= (WDATA[31:0] & wmask) | (int_matrixA_i[31:0] & ~wmask);
    end
end

// int_matrixA_i[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_matrixA_i[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MATRIXA_I_DATA_1)
            int_matrixA_i[63:32] <= (WDATA[31:0] & wmask) | (int_matrixA_i[63:32] & ~wmask);
    end
end

// int_matrixB_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_matrixB_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MATRIXB_I_DATA_0)
            int_matrixB_i[31:0] <= (WDATA[31:0] & wmask) | (int_matrixB_i[31:0] & ~wmask);
    end
end

// int_matrixB_i[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_matrixB_i[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MATRIXB_I_DATA_1)
            int_matrixB_i[63:32] <= (WDATA[31:0] & wmask) | (int_matrixB_i[63:32] & ~wmask);
    end
end

// int_matrixC_o[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_matrixC_o[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MATRIXC_O_DATA_0)
            int_matrixC_o[31:0] <= (WDATA[31:0] & wmask) | (int_matrixC_o[31:0] & ~wmask);
    end
end

// int_matrixC_o[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_matrixC_o[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MATRIXC_O_DATA_1)
            int_matrixC_o[63:32] <= (WDATA[31:0] & wmask) | (int_matrixC_o[63:32] & ~wmask);
    end
end

// int_lenEdgeListPtr[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_lenEdgeListPtr[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_LENEDGELISTPTR_DATA_0)
            int_lenEdgeListPtr[31:0] <= (WDATA[31:0] & wmask) | (int_lenEdgeListPtr[31:0] & ~wmask);
    end
end

// int_lenEdgePtr[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_lenEdgePtr[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_LENEDGEPTR_DATA_0)
            int_lenEdgePtr[31:0] <= (WDATA[31:0] & wmask) | (int_lenEdgePtr[31:0] & ~wmask);
    end
end

// int_M[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_M[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_M_DATA_0)
            int_M[31:0] <= (WDATA[31:0] & wmask) | (int_M[31:0] & ~wmask);
    end
end

// int_K[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_K[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_K_DATA_0)
            int_K[31:0] <= (WDATA[31:0] & wmask) | (int_K[31:0] & ~wmask);
    end
end

// int_N[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_N[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_N_DATA_0)
            int_N[31:0] <= (WDATA[31:0] & wmask) | (int_N[31:0] & ~wmask);
    end
end


//------------------------Memory logic-------------------

endmodule
