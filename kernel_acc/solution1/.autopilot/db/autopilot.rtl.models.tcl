set SynModuleInfo {
  {SRCNAME entry_proc MODELNAME entry_proc RTLNAME krnl_sparse_matrix_acc_entry_proc}
  {SRCNAME read_edge_list_ptr MODELNAME read_edge_list_ptr RTLNAME krnl_sparse_matrix_acc_read_edge_list_ptr}
  {SRCNAME read_A MODELNAME read_A RTLNAME krnl_sparse_matrix_acc_read_A}
  {SRCNAME read_B MODELNAME read_B RTLNAME krnl_sparse_matrix_acc_read_B
    SUBMODULES {
      {MODELNAME krnl_sparse_matrix_acc_mul_32s_32s_32_1_1 RTLNAME krnl_sparse_matrix_acc_mul_32s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME calc_C MODELNAME calc_C RTLNAME krnl_sparse_matrix_acc_calc_C
    SUBMODULES {
      {MODELNAME krnl_sparse_matrix_acc_fmul_32ns_32ns_32_3_max_dsp_1 RTLNAME krnl_sparse_matrix_acc_fmul_32ns_32ns_32_3_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME krnl_sparse_matrix_acc_calc_C_matrixB_buffer RTLNAME krnl_sparse_matrix_acc_calc_C_matrixB_buffer BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME sort_C MODELNAME sort_C RTLNAME krnl_sparse_matrix_acc_sort_C
    SUBMODULES {
      {MODELNAME krnl_sparse_matrix_acc_fpext_32ns_64_2_no_dsp_1 RTLNAME krnl_sparse_matrix_acc_fpext_32ns_64_2_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME write_C MODELNAME write_C RTLNAME krnl_sparse_matrix_acc_write_C
    SUBMODULES {
      {MODELNAME krnl_sparse_matrix_acc_mul_32ns_32ns_62_1_1 RTLNAME krnl_sparse_matrix_acc_mul_32ns_32ns_62_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME krnl_sparse_matrix_acc MODELNAME krnl_sparse_matrix_acc RTLNAME krnl_sparse_matrix_acc IS_TOP 1
    SUBMODULES {
      {MODELNAME krnl_sparse_matrix_acc_fifo_w64_d4_S RTLNAME krnl_sparse_matrix_acc_fifo_w64_d4_S BINDTYPE storage TYPE fifo IMPL srl LATENCY -1 ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME krnl_sparse_matrix_acc_fifo_w32_d4_S RTLNAME krnl_sparse_matrix_acc_fifo_w32_d4_S BINDTYPE storage TYPE fifo IMPL srl LATENCY -1 ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME krnl_sparse_matrix_acc_fifo_w32_d32_S RTLNAME krnl_sparse_matrix_acc_fifo_w32_d32_S BINDTYPE storage TYPE fifo IMPL srl LATENCY -1 ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME krnl_sparse_matrix_acc_fifo_w32_d2_S RTLNAME krnl_sparse_matrix_acc_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl LATENCY -1 ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME krnl_sparse_matrix_acc_fifo_w16_d32_S RTLNAME krnl_sparse_matrix_acc_fifo_w16_d32_S BINDTYPE storage TYPE fifo IMPL srl LATENCY -1 ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME krnl_sparse_matrix_acc_start_for_calc_C_U0 RTLNAME krnl_sparse_matrix_acc_start_for_calc_C_U0 BINDTYPE storage TYPE fifo IMPL srl LATENCY -1 ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME krnl_sparse_matrix_acc_start_for_sort_C_U0 RTLNAME krnl_sparse_matrix_acc_start_for_sort_C_U0 BINDTYPE storage TYPE fifo IMPL srl LATENCY -1 ALLOW_PRAGMA 1 INSTNAME {$InstName}}
      {MODELNAME krnl_sparse_matrix_acc_control_s_axi RTLNAME krnl_sparse_matrix_acc_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME krnl_sparse_matrix_acc_gmem0_m_axi RTLNAME krnl_sparse_matrix_acc_gmem0_m_axi BINDTYPE interface TYPE interface_m_axi}
      {MODELNAME krnl_sparse_matrix_acc_gmem1_m_axi RTLNAME krnl_sparse_matrix_acc_gmem1_m_axi BINDTYPE interface TYPE interface_m_axi}
      {MODELNAME krnl_sparse_matrix_acc_gmem2_m_axi RTLNAME krnl_sparse_matrix_acc_gmem2_m_axi BINDTYPE interface TYPE interface_m_axi}
      {MODELNAME krnl_sparse_matrix_acc_gmem3_m_axi RTLNAME krnl_sparse_matrix_acc_gmem3_m_axi BINDTYPE interface TYPE interface_m_axi}
      {MODELNAME krnl_sparse_matrix_acc_gmem4_m_axi RTLNAME krnl_sparse_matrix_acc_gmem4_m_axi BINDTYPE interface TYPE interface_m_axi}
    }
  }
}
