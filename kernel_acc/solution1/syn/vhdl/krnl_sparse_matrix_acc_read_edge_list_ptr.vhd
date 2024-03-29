-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
-- Version: 2021.1
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity krnl_sparse_matrix_acc_read_edge_list_ptr is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    start_full_n : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    start_out : OUT STD_LOGIC;
    start_write : OUT STD_LOGIC;
    lenEdgeListPtr : IN STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem0_AWVALID : OUT STD_LOGIC;
    m_axi_gmem0_AWREADY : IN STD_LOGIC;
    m_axi_gmem0_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem0_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem0_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem0_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem0_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem0_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem0_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem0_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem0_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem0_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem0_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem0_WVALID : OUT STD_LOGIC;
    m_axi_gmem0_WREADY : IN STD_LOGIC;
    m_axi_gmem0_WDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem0_WSTRB : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem0_WLAST : OUT STD_LOGIC;
    m_axi_gmem0_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem0_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem0_ARVALID : OUT STD_LOGIC;
    m_axi_gmem0_ARREADY : IN STD_LOGIC;
    m_axi_gmem0_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem0_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem0_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem0_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem0_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem0_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem0_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem0_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem0_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem0_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem0_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem0_RVALID : IN STD_LOGIC;
    m_axi_gmem0_RREADY : OUT STD_LOGIC;
    m_axi_gmem0_RDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem0_RLAST : IN STD_LOGIC;
    m_axi_gmem0_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem0_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem0_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem0_BVALID : IN STD_LOGIC;
    m_axi_gmem0_BREADY : OUT STD_LOGIC;
    m_axi_gmem0_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem0_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem0_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    HLSPtr_i : IN STD_LOGIC_VECTOR (63 downto 0);
    fifoEdgeListPtr11_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    fifoEdgeListPtr11_full_n : IN STD_LOGIC;
    fifoEdgeListPtr11_write : OUT STD_LOGIC;
    lenEdgeListPtr_c27_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    lenEdgeListPtr_c27_full_n : IN STD_LOGIC;
    lenEdgeListPtr_c27_write : OUT STD_LOGIC );
end;


architecture behav of krnl_sparse_matrix_acc_read_edge_list_ptr is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (10 downto 0) := "00000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (10 downto 0) := "00000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (10 downto 0) := "00000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (10 downto 0) := "00000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (10 downto 0) := "00000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (10 downto 0) := "00001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (10 downto 0) := "00010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (10 downto 0) := "00100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (10 downto 0) := "01000000000";
    constant ap_ST_fsm_state11 : STD_LOGIC_VECTOR (10 downto 0) := "10000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv31_0 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv31_1 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000001";

attribute shreg_extract : string;
    signal real_start : STD_LOGIC;
    signal start_once_reg : STD_LOGIC := '0';
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal internal_ap_ready : STD_LOGIC;
    signal gmem0_blk_n_AR : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal icmp_ln12_reg_170 : STD_LOGIC_VECTOR (0 downto 0);
    signal gmem0_blk_n_R : STD_LOGIC;
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal fifoEdgeListPtr11_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state11 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state11 : signal is "none";
    signal lenEdgeListPtr_c27_blk_n : STD_LOGIC;
    signal icmp_ln12_fu_110_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln12_fu_116_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal trunc_ln12_reg_181 : STD_LOGIC_VECTOR (30 downto 0);
    signal gmem0_addr_read_reg_195 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln12_fu_129_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_state2_io : BOOLEAN;
    signal i_fu_68 : STD_LOGIC_VECTOR (30 downto 0);
    signal add_ln12_fu_153_p2 : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal icmp_ln12_1_fu_148_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal trunc_ln_fu_119_p4 : STD_LOGIC_VECTOR (61 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (10 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal ap_ST_fsm_state9_blk : STD_LOGIC;
    signal ap_ST_fsm_state10_blk : STD_LOGIC;
    signal ap_ST_fsm_state11_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state9) and ((icmp_ln12_1_fu_148_p2 = ap_const_lv1_1) or (icmp_ln12_reg_170 = ap_const_lv1_0)))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    start_once_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                start_once_reg <= ap_const_logic_0;
            else
                if (((internal_ap_ready = ap_const_logic_0) and (real_start = ap_const_logic_1))) then 
                    start_once_reg <= ap_const_logic_1;
                elsif ((internal_ap_ready = ap_const_logic_1)) then 
                    start_once_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i_fu_68_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((icmp_ln12_reg_170 = ap_const_lv1_1)) then
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_io))) then 
                    i_fu_68 <= ap_const_lv31_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state9) and (icmp_ln12_1_fu_148_p2 = ap_const_lv1_0))) then 
                    i_fu_68 <= add_ln12_fu_153_p2;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state10)) then
                gmem0_addr_read_reg_195 <= m_axi_gmem0_RDATA;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                icmp_ln12_reg_170 <= icmp_ln12_fu_110_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln12_reg_170 = ap_const_lv1_1))) then
                trunc_ln12_reg_181 <= trunc_ln12_fu_116_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (real_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, m_axi_gmem0_RVALID, fifoEdgeListPtr11_full_n, lenEdgeListPtr_c27_full_n, ap_CS_fsm_state2, icmp_ln12_reg_170, ap_CS_fsm_state10, ap_CS_fsm_state11, ap_block_state2_io, ap_CS_fsm_state9, icmp_ln12_1_fu_148_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_done_reg = ap_const_logic_1) or (real_start = ap_const_logic_0) or (lenEdgeListPtr_c27_full_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_io) and (icmp_ln12_reg_170 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state9;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_io) and (icmp_ln12_reg_170 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state6;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state9) and ((icmp_ln12_1_fu_148_p2 = ap_const_lv1_1) or (icmp_ln12_reg_170 = ap_const_lv1_0)))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state10;
                end if;
            when ap_ST_fsm_state10 => 
                if (((m_axi_gmem0_RVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state10))) then
                    ap_NS_fsm <= ap_ST_fsm_state11;
                else
                    ap_NS_fsm <= ap_ST_fsm_state10;
                end if;
            when ap_ST_fsm_state11 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state11) and (fifoEdgeListPtr11_full_n = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state9;
                else
                    ap_NS_fsm <= ap_ST_fsm_state11;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXX";
        end case;
    end process;
    add_ln12_fu_153_p2 <= std_logic_vector(unsigned(i_fu_68) + unsigned(ap_const_lv31_1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(9);
    ap_CS_fsm_state11 <= ap_CS_fsm(10);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);

    ap_ST_fsm_state10_blk_assign_proc : process(m_axi_gmem0_RVALID)
    begin
        if ((m_axi_gmem0_RVALID = ap_const_logic_0)) then 
            ap_ST_fsm_state10_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state10_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state11_blk_assign_proc : process(fifoEdgeListPtr11_full_n)
    begin
        if ((fifoEdgeListPtr11_full_n = ap_const_logic_0)) then 
            ap_ST_fsm_state11_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state11_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state1_blk_assign_proc : process(real_start, ap_done_reg, lenEdgeListPtr_c27_full_n)
    begin
        if (((ap_done_reg = ap_const_logic_1) or (real_start = ap_const_logic_0) or (lenEdgeListPtr_c27_full_n = ap_const_logic_0))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state2_blk_assign_proc : process(ap_block_state2_io)
    begin
        if ((ap_const_boolean_1 = ap_block_state2_io)) then 
            ap_ST_fsm_state2_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state2_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state3_blk <= ap_const_logic_0;
    ap_ST_fsm_state4_blk <= ap_const_logic_0;
    ap_ST_fsm_state5_blk <= ap_const_logic_0;
    ap_ST_fsm_state6_blk <= ap_const_logic_0;
    ap_ST_fsm_state7_blk <= ap_const_logic_0;
    ap_ST_fsm_state8_blk <= ap_const_logic_0;
    ap_ST_fsm_state9_blk <= ap_const_logic_0;

    ap_block_state1_assign_proc : process(real_start, ap_done_reg, lenEdgeListPtr_c27_full_n)
    begin
                ap_block_state1 <= ((ap_done_reg = ap_const_logic_1) or (real_start = ap_const_logic_0) or (lenEdgeListPtr_c27_full_n = ap_const_logic_0));
    end process;


    ap_block_state2_io_assign_proc : process(m_axi_gmem0_ARREADY, icmp_ln12_reg_170)
    begin
                ap_block_state2_io <= ((m_axi_gmem0_ARREADY = ap_const_logic_0) and (icmp_ln12_reg_170 = ap_const_lv1_1));
    end process;


    ap_done_assign_proc : process(ap_done_reg, icmp_ln12_reg_170, ap_CS_fsm_state9, icmp_ln12_1_fu_148_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state9) and ((icmp_ln12_1_fu_148_p2 = ap_const_lv1_1) or (icmp_ln12_reg_170 = ap_const_lv1_0)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(real_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (real_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_ready <= internal_ap_ready;

    fifoEdgeListPtr11_blk_n_assign_proc : process(fifoEdgeListPtr11_full_n, ap_CS_fsm_state11)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state11)) then 
            fifoEdgeListPtr11_blk_n <= fifoEdgeListPtr11_full_n;
        else 
            fifoEdgeListPtr11_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    fifoEdgeListPtr11_din <= gmem0_addr_read_reg_195;

    fifoEdgeListPtr11_write_assign_proc : process(fifoEdgeListPtr11_full_n, ap_CS_fsm_state11)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state11) and (fifoEdgeListPtr11_full_n = ap_const_logic_1))) then 
            fifoEdgeListPtr11_write <= ap_const_logic_1;
        else 
            fifoEdgeListPtr11_write <= ap_const_logic_0;
        end if; 
    end process;


    gmem0_blk_n_AR_assign_proc : process(m_axi_gmem0_ARREADY, ap_CS_fsm_state2, icmp_ln12_reg_170)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln12_reg_170 = ap_const_lv1_1))) then 
            gmem0_blk_n_AR <= m_axi_gmem0_ARREADY;
        else 
            gmem0_blk_n_AR <= ap_const_logic_1;
        end if; 
    end process;


    gmem0_blk_n_R_assign_proc : process(m_axi_gmem0_RVALID, ap_CS_fsm_state10)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
            gmem0_blk_n_R <= m_axi_gmem0_RVALID;
        else 
            gmem0_blk_n_R <= ap_const_logic_1;
        end if; 
    end process;

    icmp_ln12_1_fu_148_p2 <= "1" when (i_fu_68 = trunc_ln12_reg_181) else "0";
    icmp_ln12_fu_110_p2 <= "1" when (signed(lenEdgeListPtr) > signed(ap_const_lv32_0)) else "0";

    internal_ap_ready_assign_proc : process(icmp_ln12_reg_170, ap_CS_fsm_state9, icmp_ln12_1_fu_148_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state9) and ((icmp_ln12_1_fu_148_p2 = ap_const_lv1_1) or (icmp_ln12_reg_170 = ap_const_lv1_0)))) then 
            internal_ap_ready <= ap_const_logic_1;
        else 
            internal_ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    lenEdgeListPtr_c27_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, lenEdgeListPtr_c27_full_n)
    begin
        if ((not(((ap_done_reg = ap_const_logic_1) or (real_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            lenEdgeListPtr_c27_blk_n <= lenEdgeListPtr_c27_full_n;
        else 
            lenEdgeListPtr_c27_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    lenEdgeListPtr_c27_din <= lenEdgeListPtr;

    lenEdgeListPtr_c27_write_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, lenEdgeListPtr_c27_full_n)
    begin
        if ((not(((ap_done_reg = ap_const_logic_1) or (real_start = ap_const_logic_0) or (lenEdgeListPtr_c27_full_n = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            lenEdgeListPtr_c27_write <= ap_const_logic_1;
        else 
            lenEdgeListPtr_c27_write <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem0_ARADDR <= sext_ln12_fu_129_p1;
    m_axi_gmem0_ARBURST <= ap_const_lv2_0;
    m_axi_gmem0_ARCACHE <= ap_const_lv4_0;
    m_axi_gmem0_ARID <= ap_const_lv1_0;
    m_axi_gmem0_ARLEN <= lenEdgeListPtr;
    m_axi_gmem0_ARLOCK <= ap_const_lv2_0;
    m_axi_gmem0_ARPROT <= ap_const_lv3_0;
    m_axi_gmem0_ARQOS <= ap_const_lv4_0;
    m_axi_gmem0_ARREGION <= ap_const_lv4_0;
    m_axi_gmem0_ARSIZE <= ap_const_lv3_0;
    m_axi_gmem0_ARUSER <= ap_const_lv1_0;

    m_axi_gmem0_ARVALID_assign_proc : process(ap_CS_fsm_state2, icmp_ln12_reg_170, ap_block_state2_io)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_io) and (icmp_ln12_reg_170 = ap_const_lv1_1))) then 
            m_axi_gmem0_ARVALID <= ap_const_logic_1;
        else 
            m_axi_gmem0_ARVALID <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem0_AWADDR <= ap_const_lv64_0;
    m_axi_gmem0_AWBURST <= ap_const_lv2_0;
    m_axi_gmem0_AWCACHE <= ap_const_lv4_0;
    m_axi_gmem0_AWID <= ap_const_lv1_0;
    m_axi_gmem0_AWLEN <= ap_const_lv32_0;
    m_axi_gmem0_AWLOCK <= ap_const_lv2_0;
    m_axi_gmem0_AWPROT <= ap_const_lv3_0;
    m_axi_gmem0_AWQOS <= ap_const_lv4_0;
    m_axi_gmem0_AWREGION <= ap_const_lv4_0;
    m_axi_gmem0_AWSIZE <= ap_const_lv3_0;
    m_axi_gmem0_AWUSER <= ap_const_lv1_0;
    m_axi_gmem0_AWVALID <= ap_const_logic_0;
    m_axi_gmem0_BREADY <= ap_const_logic_0;

    m_axi_gmem0_RREADY_assign_proc : process(m_axi_gmem0_RVALID, ap_CS_fsm_state10)
    begin
        if (((m_axi_gmem0_RVALID = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state10))) then 
            m_axi_gmem0_RREADY <= ap_const_logic_1;
        else 
            m_axi_gmem0_RREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem0_WDATA <= ap_const_lv32_0;
    m_axi_gmem0_WID <= ap_const_lv1_0;
    m_axi_gmem0_WLAST <= ap_const_logic_0;
    m_axi_gmem0_WSTRB <= ap_const_lv4_0;
    m_axi_gmem0_WUSER <= ap_const_lv1_0;
    m_axi_gmem0_WVALID <= ap_const_logic_0;

    real_start_assign_proc : process(ap_start, start_full_n, start_once_reg)
    begin
        if (((start_once_reg = ap_const_logic_0) and (start_full_n = ap_const_logic_0))) then 
            real_start <= ap_const_logic_0;
        else 
            real_start <= ap_start;
        end if; 
    end process;

        sext_ln12_fu_129_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln_fu_119_p4),64));

    start_out <= real_start;

    start_write_assign_proc : process(real_start, start_once_reg)
    begin
        if (((start_once_reg = ap_const_logic_0) and (real_start = ap_const_logic_1))) then 
            start_write <= ap_const_logic_1;
        else 
            start_write <= ap_const_logic_0;
        end if; 
    end process;

    trunc_ln12_fu_116_p1 <= lenEdgeListPtr(31 - 1 downto 0);
    trunc_ln_fu_119_p4 <= HLSPtr_i(63 downto 2);
end behav;
