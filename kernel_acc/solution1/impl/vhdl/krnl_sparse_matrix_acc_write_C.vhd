-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
-- Version: 2021.1
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity krnl_sparse_matrix_acc_write_C is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    p_read : IN STD_LOGIC_VECTOR (31 downto 0);
    N_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    N_empty_n : IN STD_LOGIC;
    N_read : OUT STD_LOGIC;
    fifoSortMatrixC_i_0_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    fifoSortMatrixC_i_0_empty_n : IN STD_LOGIC;
    fifoSortMatrixC_i_0_read : OUT STD_LOGIC;
    fifoSortMatrixC_i_01_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    fifoSortMatrixC_i_01_empty_n : IN STD_LOGIC;
    fifoSortMatrixC_i_01_read : OUT STD_LOGIC;
    m_axi_gmem4_AWVALID : OUT STD_LOGIC;
    m_axi_gmem4_AWREADY : IN STD_LOGIC;
    m_axi_gmem4_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem4_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem4_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem4_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem4_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_WVALID : OUT STD_LOGIC;
    m_axi_gmem4_WREADY : IN STD_LOGIC;
    m_axi_gmem4_WDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem4_WSTRB : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_WLAST : OUT STD_LOGIC;
    m_axi_gmem4_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_ARVALID : OUT STD_LOGIC;
    m_axi_gmem4_ARREADY : IN STD_LOGIC;
    m_axi_gmem4_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem4_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem4_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem4_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem4_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem4_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_RVALID : IN STD_LOGIC;
    m_axi_gmem4_RREADY : OUT STD_LOGIC;
    m_axi_gmem4_RDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem4_RLAST : IN STD_LOGIC;
    m_axi_gmem4_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_BVALID : IN STD_LOGIC;
    m_axi_gmem4_BREADY : OUT STD_LOGIC;
    m_axi_gmem4_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem4_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem4_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    p_read1 : IN STD_LOGIC_VECTOR (63 downto 0) );
end;


architecture behav of krnl_sparse_matrix_acc_write_C is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (9 downto 0) := "0000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (9 downto 0) := "0000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (9 downto 0) := "0000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (9 downto 0) := "0000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (9 downto 0) := "0000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (9 downto 0) := "0000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (9 downto 0) := "0001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (9 downto 0) := "0010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (9 downto 0) := "0100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (9 downto 0) := "1000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv31_0 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000000";
    constant ap_const_lv4_F : STD_LOGIC_VECTOR (3 downto 0) := "1111";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv31_1 : STD_LOGIC_VECTOR (30 downto 0) := "0000000000000000000000000000001";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (9 downto 0) := "0000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal N_blk_n : STD_LOGIC;
    signal fifoSortMatrixC_i_0_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal icmp_ln184_fu_222_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln145_fu_233_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal fifoSortMatrixC_i_01_blk_n : STD_LOGIC;
    signal gmem4_blk_n_AW : STD_LOGIC;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal gmem4_blk_n_W : STD_LOGIC;
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal gmem4_blk_n_B : STD_LOGIC;
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal cmp12_reg_269 : STD_LOGIC_VECTOR (0 downto 0);
    signal N_1_reg_263 : STD_LOGIC_VECTOR (31 downto 0);
    signal cmp12_fu_147_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal N_cast_fu_153_p1 : STD_LOGIC_VECTOR (61 downto 0);
    signal N_cast_reg_273 : STD_LOGIC_VECTOR (61 downto 0);
    signal add_ln183_fu_170_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal add_ln183_reg_281 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal gmem4_addr_reg_286 : STD_LOGIC_VECTOR (63 downto 0);
    signal icmp_ln183_fu_165_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln184_fu_227_p2 : STD_LOGIC_VECTOR (30 downto 0);
    signal add_ln184_reg_295 : STD_LOGIC_VECTOR (30 downto 0);
    signal ap_predicate_op48_read_state4 : BOOLEAN;
    signal ap_predicate_op50_read_state4 : BOOLEAN;
    signal ap_block_state4 : BOOLEAN;
    signal j_reg_127 : STD_LOGIC_VECTOR (30 downto 0);
    signal tmp_reg_138 : STD_LOGIC_VECTOR (31 downto 0);
    signal sext_ln184_fu_208_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_state10 : BOOLEAN;
    signal i_fu_78 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal empty_fu_180_p0 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_fu_180_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal empty_fu_180_p2 : STD_LOGIC_VECTOR (61 downto 0);
    signal tmp_1_fu_185_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal empty_54_fu_193_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln_fu_198_p4 : STD_LOGIC_VECTOR (61 downto 0);
    signal zext_ln184_fu_218_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (9 downto 0);
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
    signal empty_fu_180_p10 : STD_LOGIC_VECTOR (61 downto 0);
    signal ap_condition_288 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component krnl_sparse_matrix_acc_mul_32ns_32ns_62_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        dout : OUT STD_LOGIC_VECTOR (61 downto 0) );
    end component;



begin
    mul_32ns_32ns_62_1_1_U47 : component krnl_sparse_matrix_acc_mul_32ns_32ns_62_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 62)
    port map (
        din0 => empty_fu_180_p0,
        din1 => empty_fu_180_p1,
        dout => empty_fu_180_p2);





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
                elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln183_fu_165_p2 = ap_const_lv1_1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    i_fu_78_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_const_logic_0 = N_empty_n) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                i_fu_78 <= ap_const_lv32_0;
            elsif ((not(((m_axi_gmem4_BVALID = ap_const_logic_0) and (cmp12_reg_269 = ap_const_lv1_1))) and (ap_const_logic_1 = ap_CS_fsm_state10))) then 
                i_fu_78 <= add_ln183_reg_281;
            end if; 
        end if;
    end process;

    j_reg_127_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((m_axi_gmem4_AWREADY = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                j_reg_127 <= ap_const_lv31_0;
            elsif (((m_axi_gmem4_WREADY = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
                j_reg_127 <= add_ln184_reg_295;
            end if; 
        end if;
    end process;

    tmp_reg_138_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_288)) then
                if ((trunc_ln145_fu_233_p1 = ap_const_lv1_0)) then 
                    tmp_reg_138 <= fifoSortMatrixC_i_0_dout;
                elsif ((trunc_ln145_fu_233_p1 = ap_const_lv1_1)) then 
                    tmp_reg_138 <= fifoSortMatrixC_i_01_dout;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                N_1_reg_263 <= N_dout;
                    N_cast_reg_273(31 downto 0) <= N_cast_fu_153_p1(31 downto 0);
                cmp12_reg_269 <= cmp12_fu_147_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                add_ln183_reg_281 <= add_ln183_fu_170_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((((fifoSortMatrixC_i_01_empty_n = ap_const_logic_0) and (ap_predicate_op50_read_state4 = ap_const_boolean_1)) or ((fifoSortMatrixC_i_0_empty_n = ap_const_logic_0) and (ap_predicate_op48_read_state4 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state4))) then
                add_ln184_reg_295 <= add_ln184_fu_227_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln183_fu_165_p2 = ap_const_lv1_0) and (cmp12_reg_269 = ap_const_lv1_1))) then
                gmem4_addr_reg_286 <= sext_ln184_fu_208_p1;
            end if;
        end if;
    end process;
    N_cast_reg_273(61 downto 32) <= "000000000000000000000000000000";

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, N_empty_n, fifoSortMatrixC_i_0_empty_n, fifoSortMatrixC_i_01_empty_n, m_axi_gmem4_AWREADY, m_axi_gmem4_WREADY, m_axi_gmem4_BVALID, ap_CS_fsm_state4, icmp_ln184_fu_222_p2, ap_CS_fsm_state3, ap_CS_fsm_state5, ap_CS_fsm_state10, cmp12_reg_269, ap_CS_fsm_state2, icmp_ln183_fu_165_p2, ap_predicate_op48_read_state4, ap_predicate_op50_read_state4)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_const_logic_0 = N_empty_n) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln183_fu_165_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln183_fu_165_p2 = ap_const_lv1_0) and (cmp12_reg_269 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state10;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                if (((m_axi_gmem4_AWREADY = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                if ((not((((fifoSortMatrixC_i_01_empty_n = ap_const_logic_0) and (ap_predicate_op50_read_state4 = ap_const_boolean_1)) or ((fifoSortMatrixC_i_0_empty_n = ap_const_logic_0) and (ap_predicate_op48_read_state4 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state4) and (icmp_ln184_fu_222_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                elsif ((not((((fifoSortMatrixC_i_01_empty_n = ap_const_logic_0) and (ap_predicate_op50_read_state4 = ap_const_boolean_1)) or ((fifoSortMatrixC_i_0_empty_n = ap_const_logic_0) and (ap_predicate_op48_read_state4 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state4) and (icmp_ln184_fu_222_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                if (((m_axi_gmem4_WREADY = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state7;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                ap_NS_fsm <= ap_ST_fsm_state10;
            when ap_ST_fsm_state10 => 
                if ((not(((m_axi_gmem4_BVALID = ap_const_logic_0) and (cmp12_reg_269 = ap_const_lv1_1))) and (ap_const_logic_1 = ap_CS_fsm_state10))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state10;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXX";
        end case;
    end process;

    N_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, N_empty_n)
    begin
        if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            N_blk_n <= N_empty_n;
        else 
            N_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    N_cast_fu_153_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(N_dout),62));

    N_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, N_empty_n)
    begin
        if ((not(((ap_const_logic_0 = N_empty_n) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            N_read <= ap_const_logic_1;
        else 
            N_read <= ap_const_logic_0;
        end if; 
    end process;

    add_ln183_fu_170_p2 <= std_logic_vector(unsigned(i_fu_78) + unsigned(ap_const_lv32_1));
    add_ln184_fu_227_p2 <= std_logic_vector(unsigned(j_reg_127) + unsigned(ap_const_lv31_1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(9);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);

    ap_ST_fsm_state10_blk_assign_proc : process(m_axi_gmem4_BVALID, cmp12_reg_269)
    begin
        if (((m_axi_gmem4_BVALID = ap_const_logic_0) and (cmp12_reg_269 = ap_const_lv1_1))) then 
            ap_ST_fsm_state10_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state10_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg, N_empty_n)
    begin
        if (((ap_const_logic_0 = N_empty_n) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;

    ap_ST_fsm_state3_blk_assign_proc : process(m_axi_gmem4_AWREADY)
    begin
        if ((m_axi_gmem4_AWREADY = ap_const_logic_0)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state4_blk_assign_proc : process(fifoSortMatrixC_i_0_empty_n, fifoSortMatrixC_i_01_empty_n, ap_predicate_op48_read_state4, ap_predicate_op50_read_state4)
    begin
        if ((((fifoSortMatrixC_i_01_empty_n = ap_const_logic_0) and (ap_predicate_op50_read_state4 = ap_const_boolean_1)) or ((fifoSortMatrixC_i_0_empty_n = ap_const_logic_0) and (ap_predicate_op48_read_state4 = ap_const_boolean_1)))) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_ST_fsm_state5_blk_assign_proc : process(m_axi_gmem4_WREADY)
    begin
        if ((m_axi_gmem4_WREADY = ap_const_logic_0)) then 
            ap_ST_fsm_state5_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state5_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state6_blk <= ap_const_logic_0;
    ap_ST_fsm_state7_blk <= ap_const_logic_0;
    ap_ST_fsm_state8_blk <= ap_const_logic_0;
    ap_ST_fsm_state9_blk <= ap_const_logic_0;

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, N_empty_n)
    begin
                ap_block_state1 <= ((ap_const_logic_0 = N_empty_n) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0));
    end process;


    ap_block_state10_assign_proc : process(m_axi_gmem4_BVALID, cmp12_reg_269)
    begin
                ap_block_state10 <= ((m_axi_gmem4_BVALID = ap_const_logic_0) and (cmp12_reg_269 = ap_const_lv1_1));
    end process;


    ap_block_state4_assign_proc : process(fifoSortMatrixC_i_0_empty_n, fifoSortMatrixC_i_01_empty_n, ap_predicate_op48_read_state4, ap_predicate_op50_read_state4)
    begin
                ap_block_state4 <= (((fifoSortMatrixC_i_01_empty_n = ap_const_logic_0) and (ap_predicate_op50_read_state4 = ap_const_boolean_1)) or ((fifoSortMatrixC_i_0_empty_n = ap_const_logic_0) and (ap_predicate_op48_read_state4 = ap_const_boolean_1)));
    end process;


    ap_condition_288_assign_proc : process(fifoSortMatrixC_i_0_empty_n, fifoSortMatrixC_i_01_empty_n, ap_CS_fsm_state4, icmp_ln184_fu_222_p2, ap_predicate_op48_read_state4, ap_predicate_op50_read_state4)
    begin
                ap_condition_288 <= (not((((fifoSortMatrixC_i_01_empty_n = ap_const_logic_0) and (ap_predicate_op50_read_state4 = ap_const_boolean_1)) or ((fifoSortMatrixC_i_0_empty_n = ap_const_logic_0) and (ap_predicate_op48_read_state4 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state4) and (icmp_ln184_fu_222_p2 = ap_const_lv1_0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state2, icmp_ln183_fu_165_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln183_fu_165_p2 = ap_const_lv1_1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_predicate_op48_read_state4_assign_proc : process(icmp_ln184_fu_222_p2, trunc_ln145_fu_233_p1)
    begin
                ap_predicate_op48_read_state4 <= ((trunc_ln145_fu_233_p1 = ap_const_lv1_0) and (icmp_ln184_fu_222_p2 = ap_const_lv1_0));
    end process;


    ap_predicate_op50_read_state4_assign_proc : process(icmp_ln184_fu_222_p2, trunc_ln145_fu_233_p1)
    begin
                ap_predicate_op50_read_state4 <= ((trunc_ln145_fu_233_p1 = ap_const_lv1_1) and (icmp_ln184_fu_222_p2 = ap_const_lv1_0));
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln183_fu_165_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (icmp_ln183_fu_165_p2 = ap_const_lv1_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    cmp12_fu_147_p2 <= "1" when (signed(N_dout) > signed(ap_const_lv32_0)) else "0";
    empty_54_fu_193_p2 <= std_logic_vector(unsigned(tmp_1_fu_185_p3) + unsigned(p_read1));
    empty_fu_180_p0 <= N_cast_reg_273(32 - 1 downto 0);
    empty_fu_180_p1 <= empty_fu_180_p10(32 - 1 downto 0);
    empty_fu_180_p10 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_fu_78),62));

    fifoSortMatrixC_i_01_blk_n_assign_proc : process(fifoSortMatrixC_i_01_empty_n, ap_CS_fsm_state4, icmp_ln184_fu_222_p2, trunc_ln145_fu_233_p1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) and (trunc_ln145_fu_233_p1 = ap_const_lv1_1) and (icmp_ln184_fu_222_p2 = ap_const_lv1_0))) then 
            fifoSortMatrixC_i_01_blk_n <= fifoSortMatrixC_i_01_empty_n;
        else 
            fifoSortMatrixC_i_01_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    fifoSortMatrixC_i_01_read_assign_proc : process(fifoSortMatrixC_i_0_empty_n, fifoSortMatrixC_i_01_empty_n, ap_CS_fsm_state4, ap_predicate_op48_read_state4, ap_predicate_op50_read_state4)
    begin
        if ((not((((fifoSortMatrixC_i_01_empty_n = ap_const_logic_0) and (ap_predicate_op50_read_state4 = ap_const_boolean_1)) or ((fifoSortMatrixC_i_0_empty_n = ap_const_logic_0) and (ap_predicate_op48_read_state4 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state4) and (ap_predicate_op50_read_state4 = ap_const_boolean_1))) then 
            fifoSortMatrixC_i_01_read <= ap_const_logic_1;
        else 
            fifoSortMatrixC_i_01_read <= ap_const_logic_0;
        end if; 
    end process;


    fifoSortMatrixC_i_0_blk_n_assign_proc : process(fifoSortMatrixC_i_0_empty_n, ap_CS_fsm_state4, icmp_ln184_fu_222_p2, trunc_ln145_fu_233_p1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) and (trunc_ln145_fu_233_p1 = ap_const_lv1_0) and (icmp_ln184_fu_222_p2 = ap_const_lv1_0))) then 
            fifoSortMatrixC_i_0_blk_n <= fifoSortMatrixC_i_0_empty_n;
        else 
            fifoSortMatrixC_i_0_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    fifoSortMatrixC_i_0_read_assign_proc : process(fifoSortMatrixC_i_0_empty_n, fifoSortMatrixC_i_01_empty_n, ap_CS_fsm_state4, ap_predicate_op48_read_state4, ap_predicate_op50_read_state4)
    begin
        if ((not((((fifoSortMatrixC_i_01_empty_n = ap_const_logic_0) and (ap_predicate_op50_read_state4 = ap_const_boolean_1)) or ((fifoSortMatrixC_i_0_empty_n = ap_const_logic_0) and (ap_predicate_op48_read_state4 = ap_const_boolean_1)))) and (ap_const_logic_1 = ap_CS_fsm_state4) and (ap_predicate_op48_read_state4 = ap_const_boolean_1))) then 
            fifoSortMatrixC_i_0_read <= ap_const_logic_1;
        else 
            fifoSortMatrixC_i_0_read <= ap_const_logic_0;
        end if; 
    end process;


    gmem4_blk_n_AW_assign_proc : process(m_axi_gmem4_AWREADY, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            gmem4_blk_n_AW <= m_axi_gmem4_AWREADY;
        else 
            gmem4_blk_n_AW <= ap_const_logic_1;
        end if; 
    end process;


    gmem4_blk_n_B_assign_proc : process(m_axi_gmem4_BVALID, ap_CS_fsm_state10, cmp12_reg_269)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state10) and (cmp12_reg_269 = ap_const_lv1_1))) then 
            gmem4_blk_n_B <= m_axi_gmem4_BVALID;
        else 
            gmem4_blk_n_B <= ap_const_logic_1;
        end if; 
    end process;


    gmem4_blk_n_W_assign_proc : process(m_axi_gmem4_WREADY, ap_CS_fsm_state5)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
            gmem4_blk_n_W <= m_axi_gmem4_WREADY;
        else 
            gmem4_blk_n_W <= ap_const_logic_1;
        end if; 
    end process;

    icmp_ln183_fu_165_p2 <= "1" when (i_fu_78 = p_read) else "0";
    icmp_ln184_fu_222_p2 <= "1" when (zext_ln184_fu_218_p1 = N_1_reg_263) else "0";
    m_axi_gmem4_ARADDR <= ap_const_lv64_0;
    m_axi_gmem4_ARBURST <= ap_const_lv2_0;
    m_axi_gmem4_ARCACHE <= ap_const_lv4_0;
    m_axi_gmem4_ARID <= ap_const_lv1_0;
    m_axi_gmem4_ARLEN <= ap_const_lv32_0;
    m_axi_gmem4_ARLOCK <= ap_const_lv2_0;
    m_axi_gmem4_ARPROT <= ap_const_lv3_0;
    m_axi_gmem4_ARQOS <= ap_const_lv4_0;
    m_axi_gmem4_ARREGION <= ap_const_lv4_0;
    m_axi_gmem4_ARSIZE <= ap_const_lv3_0;
    m_axi_gmem4_ARUSER <= ap_const_lv1_0;
    m_axi_gmem4_ARVALID <= ap_const_logic_0;
    m_axi_gmem4_AWADDR <= gmem4_addr_reg_286;
    m_axi_gmem4_AWBURST <= ap_const_lv2_0;
    m_axi_gmem4_AWCACHE <= ap_const_lv4_0;
    m_axi_gmem4_AWID <= ap_const_lv1_0;
    m_axi_gmem4_AWLEN <= N_1_reg_263;
    m_axi_gmem4_AWLOCK <= ap_const_lv2_0;
    m_axi_gmem4_AWPROT <= ap_const_lv3_0;
    m_axi_gmem4_AWQOS <= ap_const_lv4_0;
    m_axi_gmem4_AWREGION <= ap_const_lv4_0;
    m_axi_gmem4_AWSIZE <= ap_const_lv3_0;
    m_axi_gmem4_AWUSER <= ap_const_lv1_0;

    m_axi_gmem4_AWVALID_assign_proc : process(m_axi_gmem4_AWREADY, ap_CS_fsm_state3)
    begin
        if (((m_axi_gmem4_AWREADY = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            m_axi_gmem4_AWVALID <= ap_const_logic_1;
        else 
            m_axi_gmem4_AWVALID <= ap_const_logic_0;
        end if; 
    end process;


    m_axi_gmem4_BREADY_assign_proc : process(m_axi_gmem4_BVALID, ap_CS_fsm_state10, cmp12_reg_269)
    begin
        if ((not(((m_axi_gmem4_BVALID = ap_const_logic_0) and (cmp12_reg_269 = ap_const_lv1_1))) and (ap_const_logic_1 = ap_CS_fsm_state10) and (cmp12_reg_269 = ap_const_lv1_1))) then 
            m_axi_gmem4_BREADY <= ap_const_logic_1;
        else 
            m_axi_gmem4_BREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem4_RREADY <= ap_const_logic_0;
    m_axi_gmem4_WDATA <= tmp_reg_138;
    m_axi_gmem4_WID <= ap_const_lv1_0;
    m_axi_gmem4_WLAST <= ap_const_logic_0;
    m_axi_gmem4_WSTRB <= ap_const_lv4_F;
    m_axi_gmem4_WUSER <= ap_const_lv1_0;

    m_axi_gmem4_WVALID_assign_proc : process(m_axi_gmem4_WREADY, ap_CS_fsm_state5)
    begin
        if (((m_axi_gmem4_WREADY = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            m_axi_gmem4_WVALID <= ap_const_logic_1;
        else 
            m_axi_gmem4_WVALID <= ap_const_logic_0;
        end if; 
    end process;

        sext_ln184_fu_208_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln_fu_198_p4),64));

    tmp_1_fu_185_p3 <= (empty_fu_180_p2 & ap_const_lv2_0);
    trunc_ln145_fu_233_p1 <= j_reg_127(1 - 1 downto 0);
    trunc_ln_fu_198_p4 <= empty_54_fu_193_p2(63 downto 2);
    zext_ln184_fu_218_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(j_reg_127),32));
end behav;