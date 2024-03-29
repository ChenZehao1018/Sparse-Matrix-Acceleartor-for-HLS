-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
-- Version: 2021.1
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity calc_C_calc_C_Pipeline_loop_diff_window_loop_diff_pe is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    fifoMatrixA_i_V_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    fifoMatrixA_i_V_empty_n : IN STD_LOGIC;
    fifoMatrixA_i_V_read : OUT STD_LOGIC;
    fifoMatrixAIdx_i_V_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    fifoMatrixAIdx_i_V_empty_n : IN STD_LOGIC;
    fifoMatrixAIdx_i_V_read : OUT STD_LOGIC;
    fifoCalcMatrixC_o_0_V_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    fifoCalcMatrixC_o_0_V_full_n : IN STD_LOGIC;
    fifoCalcMatrixC_o_0_V_write : OUT STD_LOGIC;
    fifoMatrixCIdx_o_0_V_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    fifoMatrixCIdx_o_0_V_full_n : IN STD_LOGIC;
    fifoMatrixCIdx_o_0_V_write : OUT STD_LOGIC;
    fifoCalcMatrixC_o_1_V_din : OUT STD_LOGIC_VECTOR (31 downto 0);
    fifoCalcMatrixC_o_1_V_full_n : IN STD_LOGIC;
    fifoCalcMatrixC_o_1_V_write : OUT STD_LOGIC;
    fifoMatrixCIdx_o_1_V_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    fifoMatrixCIdx_o_1_V_full_n : IN STD_LOGIC;
    fifoMatrixCIdx_o_1_V_write : OUT STD_LOGIC;
    zext_ln81 : IN STD_LOGIC_VECTOR (33 downto 0);
    matrixB_buffer_address0 : OUT STD_LOGIC_VECTOR (3 downto 0);
    matrixB_buffer_ce0 : OUT STD_LOGIC;
    matrixB_buffer_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    matrixB_buffer_address1 : OUT STD_LOGIC_VECTOR (3 downto 0);
    matrixB_buffer_ce1 : OUT STD_LOGIC;
    matrixB_buffer_q1 : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of calc_C_calc_C_Pipeline_loop_diff_window_loop_diff_pe is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv34_0 : STD_LOGIC_VECTOR (33 downto 0) := "0000000000000000000000000000000000";
    constant ap_const_lv34_1 : STD_LOGIC_VECTOR (33 downto 0) := "0000000000000000000000000000000001";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_13 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010011";
    constant ap_const_lv4_8 : STD_LOGIC_VECTOR (3 downto 0) := "1000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter4 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter5 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter6 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter7 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter4 : BOOLEAN;
    signal ap_block_state6_pp0_stage0_iter5 : BOOLEAN;
    signal ap_block_state7_pp0_stage0_iter6 : BOOLEAN;
    signal tmp_reg_259 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_259_pp0_iter6_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state8_pp0_stage0_iter7 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln90_fu_155_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal fifoMatrixA_i_V_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal fifoMatrixAIdx_i_V_blk_n : STD_LOGIC;
    signal fifoCalcMatrixC_o_0_V_blk_n : STD_LOGIC;
    signal fifoMatrixCIdx_o_0_V_blk_n : STD_LOGIC;
    signal fifoCalcMatrixC_o_1_V_blk_n : STD_LOGIC;
    signal fifoMatrixCIdx_o_1_V_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal tmp_1_fu_171_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_1_reg_247 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_1_reg_247_pp0_iter3_reg : STD_LOGIC_VECTOR (31 downto 0);
    signal tempA_row_V_fu_185_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal tempA_row_V_reg_253 : STD_LOGIC_VECTOR (15 downto 0);
    signal tempA_row_V_reg_253_pp0_iter3_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal tempA_row_V_reg_253_pp0_iter4_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal tempA_row_V_reg_253_pp0_iter5_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal tempA_row_V_reg_253_pp0_iter6_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_reg_259_pp0_iter3_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_259_pp0_iter4_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_259_pp0_iter5_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal matrixB_buffer_load_reg_273 : STD_LOGIC_VECTOR (31 downto 0);
    signal matrixB_buffer_load_1_reg_278 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_139_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal temp_res_reg_283 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_143_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal temp_res_1_reg_288 : STD_LOGIC_VECTOR (31 downto 0);
    signal conv_i_i_fu_197_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln51_fu_218_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal indvar_flatten_fu_64 : STD_LOGIC_VECTOR (33 downto 0);
    signal add_ln90_fu_160_p2 : STD_LOGIC_VECTOR (33 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal tempA_col_V_fu_175_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal colIdxA_i_V_cast_fu_202_p4 : STD_LOGIC_VECTOR (3 downto 0);
    signal xor_ln51_fu_212_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_fu_139_ce : STD_LOGIC;
    signal grp_fu_143_ce : STD_LOGIC;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter3_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter4_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter5_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter6_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component calc_C_fmul_32ns_32ns_32_3_max_dsp_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component calc_C_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    fmul_32ns_32ns_32_3_max_dsp_1_U1 : component calc_C_fmul_32ns_32ns_32_3_max_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 3,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => tmp_1_reg_247_pp0_iter3_reg,
        din1 => matrixB_buffer_load_reg_273,
        ce => grp_fu_139_ce,
        dout => grp_fu_139_p2);

    fmul_32ns_32ns_32_3_max_dsp_1_U2 : component calc_C_fmul_32ns_32ns_32_3_max_dsp_1
    generic map (
        ID => 1,
        NUM_STAGE => 3,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        dout_WIDTH => 32)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => tmp_1_reg_247_pp0_iter3_reg,
        din1 => matrixB_buffer_load_1_reg_278,
        ce => grp_fu_143_ce,
        dout => grp_fu_143_p2);

    flow_control_loop_pipe_sequential_init_U : component calc_C_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter1_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
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
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_loop_exit_ready_pp0_iter6_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter4_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter4 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter5_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter5 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter6_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter6 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter7_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter7 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
                end if; 
            end if;
        end if;
    end process;


    indvar_flatten_fu_64_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    indvar_flatten_fu_64 <= ap_const_lv34_0;
                elsif (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (icmp_ln90_fu_155_p2 = ap_const_lv1_0))) then 
                    indvar_flatten_fu_64 <= add_ln90_fu_160_p2;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
                ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
                ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
                ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
                tempA_row_V_reg_253 <= tempA_row_V_fu_185_p1;
                tempA_row_V_reg_253_pp0_iter3_reg <= tempA_row_V_reg_253;
                tempA_row_V_reg_253_pp0_iter4_reg <= tempA_row_V_reg_253_pp0_iter3_reg;
                tempA_row_V_reg_253_pp0_iter5_reg <= tempA_row_V_reg_253_pp0_iter4_reg;
                tempA_row_V_reg_253_pp0_iter6_reg <= tempA_row_V_reg_253_pp0_iter5_reg;
                tmp_1_reg_247 <= tmp_1_fu_171_p1;
                tmp_1_reg_247_pp0_iter3_reg <= tmp_1_reg_247;
                tmp_reg_259 <= fifoMatrixAIdx_i_V_dout(15 downto 15);
                tmp_reg_259_pp0_iter3_reg <= tmp_reg_259;
                tmp_reg_259_pp0_iter4_reg <= tmp_reg_259_pp0_iter3_reg;
                tmp_reg_259_pp0_iter5_reg <= tmp_reg_259_pp0_iter4_reg;
                tmp_reg_259_pp0_iter6_reg <= tmp_reg_259_pp0_iter5_reg;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_reg_259 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                matrixB_buffer_load_1_reg_278 <= matrixB_buffer_q0;
                matrixB_buffer_load_reg_273 <= matrixB_buffer_q1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_reg_259_pp0_iter5_reg = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                temp_res_1_reg_288 <= grp_fu_143_p2;
                temp_res_reg_283 <= grp_fu_139_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln90_fu_160_p2 <= std_logic_vector(unsigned(indvar_flatten_fu_64) + unsigned(ap_const_lv34_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter7, fifoMatrixA_i_V_empty_n, fifoMatrixAIdx_i_V_empty_n, fifoCalcMatrixC_o_0_V_full_n, tmp_reg_259_pp0_iter6_reg, fifoMatrixCIdx_o_0_V_full_n, fifoCalcMatrixC_o_1_V_full_n, fifoMatrixCIdx_o_1_V_full_n)
    begin
                ap_block_pp0_stage0_01001 <= (((ap_enable_reg_pp0_iter7 = ap_const_logic_1) and (((fifoMatrixCIdx_o_1_V_full_n = ap_const_logic_0) and (tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0)) or ((fifoCalcMatrixC_o_1_V_full_n = ap_const_logic_0) and (tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0)) or ((fifoMatrixCIdx_o_0_V_full_n = ap_const_logic_0) and (tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0)) or ((tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0) and (fifoCalcMatrixC_o_0_V_full_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((fifoMatrixAIdx_i_V_empty_n = ap_const_logic_0) or (fifoMatrixA_i_V_empty_n = ap_const_logic_0))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter7, fifoMatrixA_i_V_empty_n, fifoMatrixAIdx_i_V_empty_n, fifoCalcMatrixC_o_0_V_full_n, tmp_reg_259_pp0_iter6_reg, fifoMatrixCIdx_o_0_V_full_n, fifoCalcMatrixC_o_1_V_full_n, fifoMatrixCIdx_o_1_V_full_n)
    begin
                ap_block_pp0_stage0_11001 <= (((ap_enable_reg_pp0_iter7 = ap_const_logic_1) and (((fifoMatrixCIdx_o_1_V_full_n = ap_const_logic_0) and (tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0)) or ((fifoCalcMatrixC_o_1_V_full_n = ap_const_logic_0) and (tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0)) or ((fifoMatrixCIdx_o_0_V_full_n = ap_const_logic_0) and (tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0)) or ((tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0) and (fifoCalcMatrixC_o_0_V_full_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((fifoMatrixAIdx_i_V_empty_n = ap_const_logic_0) or (fifoMatrixA_i_V_empty_n = ap_const_logic_0))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter7, fifoMatrixA_i_V_empty_n, fifoMatrixAIdx_i_V_empty_n, fifoCalcMatrixC_o_0_V_full_n, tmp_reg_259_pp0_iter6_reg, fifoMatrixCIdx_o_0_V_full_n, fifoCalcMatrixC_o_1_V_full_n, fifoMatrixCIdx_o_1_V_full_n)
    begin
                ap_block_pp0_stage0_subdone <= (((ap_enable_reg_pp0_iter7 = ap_const_logic_1) and (((fifoMatrixCIdx_o_1_V_full_n = ap_const_logic_0) and (tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0)) or ((fifoCalcMatrixC_o_1_V_full_n = ap_const_logic_0) and (tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0)) or ((fifoMatrixCIdx_o_0_V_full_n = ap_const_logic_0) and (tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0)) or ((tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0) and (fifoCalcMatrixC_o_0_V_full_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((fifoMatrixAIdx_i_V_empty_n = ap_const_logic_0) or (fifoMatrixA_i_V_empty_n = ap_const_logic_0))));
    end process;

        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state3_pp0_stage0_iter2_assign_proc : process(fifoMatrixA_i_V_empty_n, fifoMatrixAIdx_i_V_empty_n)
    begin
                ap_block_state3_pp0_stage0_iter2 <= ((fifoMatrixAIdx_i_V_empty_n = ap_const_logic_0) or (fifoMatrixA_i_V_empty_n = ap_const_logic_0));
    end process;

        ap_block_state4_pp0_stage0_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter4 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage0_iter5 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state7_pp0_stage0_iter6 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state8_pp0_stage0_iter7_assign_proc : process(fifoCalcMatrixC_o_0_V_full_n, tmp_reg_259_pp0_iter6_reg, fifoMatrixCIdx_o_0_V_full_n, fifoCalcMatrixC_o_1_V_full_n, fifoMatrixCIdx_o_1_V_full_n)
    begin
                ap_block_state8_pp0_stage0_iter7 <= (((fifoMatrixCIdx_o_1_V_full_n = ap_const_logic_0) and (tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0)) or ((fifoCalcMatrixC_o_1_V_full_n = ap_const_logic_0) and (tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0)) or ((fifoMatrixCIdx_o_0_V_full_n = ap_const_logic_0) and (tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0)) or ((tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0) and (fifoCalcMatrixC_o_0_V_full_n = ap_const_logic_0)));
    end process;


    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone, icmp_ln90_fu_155_p2)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln90_fu_155_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter6_reg)
    begin
        if (((ap_loop_exit_ready_pp0_iter6_reg = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_enable_reg_pp0_iter4, ap_enable_reg_pp0_iter5, ap_enable_reg_pp0_iter6, ap_enable_reg_pp0_iter7)
    begin
        if (((ap_enable_reg_pp0_iter7 = ap_const_logic_0) and (ap_enable_reg_pp0_iter6 = ap_const_logic_0) and (ap_enable_reg_pp0_iter5 = ap_const_logic_0) and (ap_enable_reg_pp0_iter4 = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter1_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;

    colIdxA_i_V_cast_fu_202_p4 <= fifoMatrixAIdx_i_V_dout(19 downto 16);
    conv_i_i_fu_197_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tempA_col_V_fu_175_p4),64));

    fifoCalcMatrixC_o_0_V_blk_n_assign_proc : process(ap_enable_reg_pp0_iter7, fifoCalcMatrixC_o_0_V_full_n, tmp_reg_259_pp0_iter6_reg, ap_block_pp0_stage0)
    begin
        if (((tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            fifoCalcMatrixC_o_0_V_blk_n <= fifoCalcMatrixC_o_0_V_full_n;
        else 
            fifoCalcMatrixC_o_0_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    fifoCalcMatrixC_o_0_V_din <= temp_res_reg_283;

    fifoCalcMatrixC_o_0_V_write_assign_proc : process(ap_enable_reg_pp0_iter7, tmp_reg_259_pp0_iter6_reg, ap_block_pp0_stage0_11001)
    begin
        if (((tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            fifoCalcMatrixC_o_0_V_write <= ap_const_logic_1;
        else 
            fifoCalcMatrixC_o_0_V_write <= ap_const_logic_0;
        end if; 
    end process;


    fifoCalcMatrixC_o_1_V_blk_n_assign_proc : process(ap_enable_reg_pp0_iter7, tmp_reg_259_pp0_iter6_reg, fifoCalcMatrixC_o_1_V_full_n, ap_block_pp0_stage0)
    begin
        if (((tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            fifoCalcMatrixC_o_1_V_blk_n <= fifoCalcMatrixC_o_1_V_full_n;
        else 
            fifoCalcMatrixC_o_1_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    fifoCalcMatrixC_o_1_V_din <= temp_res_1_reg_288;

    fifoCalcMatrixC_o_1_V_write_assign_proc : process(ap_enable_reg_pp0_iter7, tmp_reg_259_pp0_iter6_reg, ap_block_pp0_stage0_11001)
    begin
        if (((tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            fifoCalcMatrixC_o_1_V_write <= ap_const_logic_1;
        else 
            fifoCalcMatrixC_o_1_V_write <= ap_const_logic_0;
        end if; 
    end process;


    fifoMatrixAIdx_i_V_blk_n_assign_proc : process(ap_enable_reg_pp0_iter2, fifoMatrixAIdx_i_V_empty_n, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            fifoMatrixAIdx_i_V_blk_n <= fifoMatrixAIdx_i_V_empty_n;
        else 
            fifoMatrixAIdx_i_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    fifoMatrixAIdx_i_V_read_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            fifoMatrixAIdx_i_V_read <= ap_const_logic_1;
        else 
            fifoMatrixAIdx_i_V_read <= ap_const_logic_0;
        end if; 
    end process;


    fifoMatrixA_i_V_blk_n_assign_proc : process(ap_enable_reg_pp0_iter2, fifoMatrixA_i_V_empty_n, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            fifoMatrixA_i_V_blk_n <= fifoMatrixA_i_V_empty_n;
        else 
            fifoMatrixA_i_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    fifoMatrixA_i_V_read_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            fifoMatrixA_i_V_read <= ap_const_logic_1;
        else 
            fifoMatrixA_i_V_read <= ap_const_logic_0;
        end if; 
    end process;


    fifoMatrixCIdx_o_0_V_blk_n_assign_proc : process(ap_enable_reg_pp0_iter7, tmp_reg_259_pp0_iter6_reg, fifoMatrixCIdx_o_0_V_full_n, ap_block_pp0_stage0)
    begin
        if (((tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            fifoMatrixCIdx_o_0_V_blk_n <= fifoMatrixCIdx_o_0_V_full_n;
        else 
            fifoMatrixCIdx_o_0_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    fifoMatrixCIdx_o_0_V_din <= tempA_row_V_reg_253_pp0_iter6_reg;

    fifoMatrixCIdx_o_0_V_write_assign_proc : process(ap_enable_reg_pp0_iter7, tmp_reg_259_pp0_iter6_reg, ap_block_pp0_stage0_11001)
    begin
        if (((tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            fifoMatrixCIdx_o_0_V_write <= ap_const_logic_1;
        else 
            fifoMatrixCIdx_o_0_V_write <= ap_const_logic_0;
        end if; 
    end process;


    fifoMatrixCIdx_o_1_V_blk_n_assign_proc : process(ap_enable_reg_pp0_iter7, tmp_reg_259_pp0_iter6_reg, fifoMatrixCIdx_o_1_V_full_n, ap_block_pp0_stage0)
    begin
        if (((tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            fifoMatrixCIdx_o_1_V_blk_n <= fifoMatrixCIdx_o_1_V_full_n;
        else 
            fifoMatrixCIdx_o_1_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    fifoMatrixCIdx_o_1_V_din <= tempA_row_V_reg_253_pp0_iter6_reg;

    fifoMatrixCIdx_o_1_V_write_assign_proc : process(ap_enable_reg_pp0_iter7, tmp_reg_259_pp0_iter6_reg, ap_block_pp0_stage0_11001)
    begin
        if (((tmp_reg_259_pp0_iter6_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter7 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            fifoMatrixCIdx_o_1_V_write <= ap_const_logic_1;
        else 
            fifoMatrixCIdx_o_1_V_write <= ap_const_logic_0;
        end if; 
    end process;


    grp_fu_139_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_139_ce <= ap_const_logic_1;
        else 
            grp_fu_139_ce <= ap_const_logic_0;
        end if; 
    end process;


    grp_fu_143_ce_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            grp_fu_143_ce <= ap_const_logic_1;
        else 
            grp_fu_143_ce <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln90_fu_155_p2 <= "1" when (indvar_flatten_fu_64 = zext_ln81) else "0";
    matrixB_buffer_address0 <= zext_ln51_fu_218_p1(4 - 1 downto 0);
    matrixB_buffer_address1 <= conv_i_i_fu_197_p1(4 - 1 downto 0);

    matrixB_buffer_ce0_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            matrixB_buffer_ce0 <= ap_const_logic_1;
        else 
            matrixB_buffer_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    matrixB_buffer_ce1_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            matrixB_buffer_ce1 <= ap_const_logic_1;
        else 
            matrixB_buffer_ce1 <= ap_const_logic_0;
        end if; 
    end process;

    tempA_col_V_fu_175_p4 <= fifoMatrixAIdx_i_V_dout(31 downto 16);
    tempA_row_V_fu_185_p1 <= fifoMatrixAIdx_i_V_dout(16 - 1 downto 0);
    tmp_1_fu_171_p1 <= fifoMatrixA_i_V_dout;
    xor_ln51_fu_212_p2 <= (colIdxA_i_V_cast_fu_202_p4 xor ap_const_lv4_8);
    zext_ln51_fu_218_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(xor_ln51_fu_212_p2),64));
end behav;
