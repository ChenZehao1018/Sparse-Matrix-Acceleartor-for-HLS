set SynModuleInfo {
  {SRCNAME sort_C_Pipeline_loop_diff_window_loop_diff_pe MODELNAME sort_C_Pipeline_loop_diff_window_loop_diff_pe RTLNAME sort_C_sort_C_Pipeline_loop_diff_window_loop_diff_pe
    SUBMODULES {
      {MODELNAME sort_C_fpext_32ns_64_2_no_dsp_1 RTLNAME sort_C_fpext_32ns_64_2_no_dsp_1 BINDTYPE op TYPE fpext IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME sort_C_flow_control_loop_pipe_sequential_init RTLNAME sort_C_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME sort_C_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME sort_C MODELNAME sort_C RTLNAME sort_C IS_TOP 1
    SUBMODULES {
      {MODELNAME sort_C_mux_83_32_1_1 RTLNAME sort_C_mux_83_32_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME sort_C_matrixC_buffer_V_0 RTLNAME sort_C_matrixC_buffer_V_0 BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
