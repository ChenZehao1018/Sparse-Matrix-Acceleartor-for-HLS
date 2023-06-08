; ModuleID = 'D:/ProjectWork/SPARSE_MATRIX_ACC/kernel_acc/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream" = type { i32 }
%"class.hls::stream.2" = type { %struct.ap_uint }
%struct.ap_uint = type { %struct.ap_int_base }
%struct.ap_int_base = type { %struct.ssdm_int }
%struct.ssdm_int = type { i16 }
%"class.hls::stream.1" = type { float }

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_sort_C_ir(i32 %lenEdgeListPtr, %"class.hls::stream"* %fifoEdgeListPtr_i, %"class.hls::stream.2"* %fifoMatrixCIdx_i, %"class.hls::stream.1"* %fifoCalcMatrixC_i, %"class.hls::stream.1"* %fifoSortMatrixC_o) local_unnamed_addr #1 {
entry:
  %fifoEdgeListPtr_i_copy1 = alloca i32, align 512
  call void @llvm.sideeffect() #0 [ "stream_interface"(i32* %fifoEdgeListPtr_i_copy1) ]
  %fifoMatrixCIdx_i_copy_0 = alloca i16, align 512
  %fifoMatrixCIdx_i_copy_1 = alloca i16, align 512
  %fifoMatrixCIdx_i_copy_2 = alloca i16, align 512
  %fifoMatrixCIdx_i_copy_3 = alloca i16, align 512
  %fifoMatrixCIdx_i_copy_4 = alloca i16, align 512
  %fifoMatrixCIdx_i_copy_5 = alloca i16, align 512
  %fifoMatrixCIdx_i_copy_6 = alloca i16, align 512
  %fifoMatrixCIdx_i_copy_7 = alloca i16, align 512
  call void @llvm.sideeffect() #0 [ "stream_interface"(i16* %fifoMatrixCIdx_i_copy_7) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i16* %fifoMatrixCIdx_i_copy_6) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i16* %fifoMatrixCIdx_i_copy_5) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i16* %fifoMatrixCIdx_i_copy_4) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i16* %fifoMatrixCIdx_i_copy_3) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i16* %fifoMatrixCIdx_i_copy_2) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i16* %fifoMatrixCIdx_i_copy_1) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i16* %fifoMatrixCIdx_i_copy_0) ]
  %fifoCalcMatrixC_i_copy_0 = alloca i32, align 512
  %fifoCalcMatrixC_i_copy_1 = alloca i32, align 512
  %fifoCalcMatrixC_i_copy_2 = alloca i32, align 512
  %fifoCalcMatrixC_i_copy_3 = alloca i32, align 512
  %fifoCalcMatrixC_i_copy_4 = alloca i32, align 512
  %fifoCalcMatrixC_i_copy_5 = alloca i32, align 512
  %fifoCalcMatrixC_i_copy_6 = alloca i32, align 512
  %fifoCalcMatrixC_i_copy_7 = alloca i32, align 512
  call void @llvm.sideeffect() #0 [ "stream_interface"(i32* %fifoCalcMatrixC_i_copy_7) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i32* %fifoCalcMatrixC_i_copy_6) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i32* %fifoCalcMatrixC_i_copy_5) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i32* %fifoCalcMatrixC_i_copy_4) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i32* %fifoCalcMatrixC_i_copy_3) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i32* %fifoCalcMatrixC_i_copy_2) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i32* %fifoCalcMatrixC_i_copy_1) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i32* %fifoCalcMatrixC_i_copy_0) ]
  %fifoSortMatrixC_o_copy_0 = alloca i32, align 512
  %fifoSortMatrixC_o_copy_1 = alloca i32, align 512
  %fifoSortMatrixC_o_copy_2 = alloca i32, align 512
  %fifoSortMatrixC_o_copy_3 = alloca i32, align 512
  %fifoSortMatrixC_o_copy_4 = alloca i32, align 512
  %fifoSortMatrixC_o_copy_5 = alloca i32, align 512
  %fifoSortMatrixC_o_copy_6 = alloca i32, align 512
  %fifoSortMatrixC_o_copy_7 = alloca i32, align 512
  call void @llvm.sideeffect() #0 [ "stream_interface"(i32* %fifoSortMatrixC_o_copy_7) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i32* %fifoSortMatrixC_o_copy_6) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i32* %fifoSortMatrixC_o_copy_5) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i32* %fifoSortMatrixC_o_copy_4) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i32* %fifoSortMatrixC_o_copy_3) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i32* %fifoSortMatrixC_o_copy_2) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i32* %fifoSortMatrixC_o_copy_1) ]
  call void @llvm.sideeffect() #0 [ "stream_interface"(i32* %fifoSortMatrixC_o_copy_0) ]
  %0 = bitcast %"class.hls::stream.2"* %fifoMatrixCIdx_i to [8 x %"class.hls::stream.2"]*
  %1 = bitcast %"class.hls::stream.1"* %fifoCalcMatrixC_i to [8 x %"class.hls::stream.1"]*
  %2 = bitcast %"class.hls::stream.1"* %fifoSortMatrixC_o to [8 x %"class.hls::stream.1"]*
  %3 = bitcast i32* %fifoEdgeListPtr_i_copy1 to %"class.hls::stream"*
  call void @copy_in(%"class.hls::stream"* %fifoEdgeListPtr_i, %"class.hls::stream"* nonnull align 512 %3, [8 x %"class.hls::stream.2"]* %0, i16* nonnull align 512 %fifoMatrixCIdx_i_copy_0, i16* nonnull align 512 %fifoMatrixCIdx_i_copy_1, i16* nonnull align 512 %fifoMatrixCIdx_i_copy_2, i16* nonnull align 512 %fifoMatrixCIdx_i_copy_3, i16* nonnull align 512 %fifoMatrixCIdx_i_copy_4, i16* nonnull align 512 %fifoMatrixCIdx_i_copy_5, i16* nonnull align 512 %fifoMatrixCIdx_i_copy_6, i16* nonnull align 512 %fifoMatrixCIdx_i_copy_7, [8 x %"class.hls::stream.1"]* %1, i32* nonnull align 512 %fifoCalcMatrixC_i_copy_0, i32* nonnull align 512 %fifoCalcMatrixC_i_copy_1, i32* nonnull align 512 %fifoCalcMatrixC_i_copy_2, i32* nonnull align 512 %fifoCalcMatrixC_i_copy_3, i32* nonnull align 512 %fifoCalcMatrixC_i_copy_4, i32* nonnull align 512 %fifoCalcMatrixC_i_copy_5, i32* nonnull align 512 %fifoCalcMatrixC_i_copy_6, i32* nonnull align 512 %fifoCalcMatrixC_i_copy_7, [8 x %"class.hls::stream.1"]* %2, i32* nonnull align 512 %fifoSortMatrixC_o_copy_0, i32* nonnull align 512 %fifoSortMatrixC_o_copy_1, i32* nonnull align 512 %fifoSortMatrixC_o_copy_2, i32* nonnull align 512 %fifoSortMatrixC_o_copy_3, i32* nonnull align 512 %fifoSortMatrixC_o_copy_4, i32* nonnull align 512 %fifoSortMatrixC_o_copy_5, i32* nonnull align 512 %fifoSortMatrixC_o_copy_6, i32* nonnull align 512 %fifoSortMatrixC_o_copy_7)
  call void @apatb_sort_C_hw(i32 %lenEdgeListPtr, %"class.hls::stream"* %3, i16* %fifoMatrixCIdx_i_copy_0, i16* %fifoMatrixCIdx_i_copy_1, i16* %fifoMatrixCIdx_i_copy_2, i16* %fifoMatrixCIdx_i_copy_3, i16* %fifoMatrixCIdx_i_copy_4, i16* %fifoMatrixCIdx_i_copy_5, i16* %fifoMatrixCIdx_i_copy_6, i16* %fifoMatrixCIdx_i_copy_7, i32* %fifoCalcMatrixC_i_copy_0, i32* %fifoCalcMatrixC_i_copy_1, i32* %fifoCalcMatrixC_i_copy_2, i32* %fifoCalcMatrixC_i_copy_3, i32* %fifoCalcMatrixC_i_copy_4, i32* %fifoCalcMatrixC_i_copy_5, i32* %fifoCalcMatrixC_i_copy_6, i32* %fifoCalcMatrixC_i_copy_7, i32* %fifoSortMatrixC_o_copy_0, i32* %fifoSortMatrixC_o_copy_1, i32* %fifoSortMatrixC_o_copy_2, i32* %fifoSortMatrixC_o_copy_3, i32* %fifoSortMatrixC_o_copy_4, i32* %fifoSortMatrixC_o_copy_5, i32* %fifoSortMatrixC_o_copy_6, i32* %fifoSortMatrixC_o_copy_7)
  call void @copy_out(%"class.hls::stream"* %fifoEdgeListPtr_i, %"class.hls::stream"* nonnull align 512 %3, [8 x %"class.hls::stream.2"]* %0, i16* nonnull align 512 %fifoMatrixCIdx_i_copy_0, i16* nonnull align 512 %fifoMatrixCIdx_i_copy_1, i16* nonnull align 512 %fifoMatrixCIdx_i_copy_2, i16* nonnull align 512 %fifoMatrixCIdx_i_copy_3, i16* nonnull align 512 %fifoMatrixCIdx_i_copy_4, i16* nonnull align 512 %fifoMatrixCIdx_i_copy_5, i16* nonnull align 512 %fifoMatrixCIdx_i_copy_6, i16* nonnull align 512 %fifoMatrixCIdx_i_copy_7, [8 x %"class.hls::stream.1"]* %1, i32* nonnull align 512 %fifoCalcMatrixC_i_copy_0, i32* nonnull align 512 %fifoCalcMatrixC_i_copy_1, i32* nonnull align 512 %fifoCalcMatrixC_i_copy_2, i32* nonnull align 512 %fifoCalcMatrixC_i_copy_3, i32* nonnull align 512 %fifoCalcMatrixC_i_copy_4, i32* nonnull align 512 %fifoCalcMatrixC_i_copy_5, i32* nonnull align 512 %fifoCalcMatrixC_i_copy_6, i32* nonnull align 512 %fifoCalcMatrixC_i_copy_7, [8 x %"class.hls::stream.1"]* %2, i32* nonnull align 512 %fifoSortMatrixC_o_copy_0, i32* nonnull align 512 %fifoSortMatrixC_o_copy_1, i32* nonnull align 512 %fifoSortMatrixC_o_copy_2, i32* nonnull align 512 %fifoSortMatrixC_o_copy_3, i32* nonnull align 512 %fifoSortMatrixC_o_copy_4, i32* nonnull align 512 %fifoSortMatrixC_o_copy_5, i32* nonnull align 512 %fifoSortMatrixC_o_copy_6, i32* nonnull align 512 %fifoSortMatrixC_o_copy_7)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream"(%"class.hls::stream"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #2 {
entry:
  %2 = icmp eq %"class.hls::stream"* %0, null
  %3 = icmp eq %"class.hls::stream"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream"(%"class.hls::stream"* nonnull align 512 %0, %"class.hls::stream"* nonnull %1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream"(%"class.hls::stream"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", %"class.hls::stream"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #3 {
entry:
  %2 = alloca %"class.hls::stream"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_4(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream"* %2 to i8*
  %6 = bitcast %"class.hls::stream"* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream", %"class.hls::stream"* %2
  %8 = bitcast %"class.hls::stream"* %2 to i8*
  %9 = bitcast %"class.hls::stream"* %0 to i8*
  call void @fpga_fifo_push_4(i8* %8, i8* %9)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: nounwind
declare void @llvm.assume(i1) #4

; Function Attrs: argmemonly noinline
define internal void @"onebyonecpy_hls.p0a8class.hls::stream.2.11.14"(i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_2, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_3, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_4, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_5, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_6, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_7, [8 x %"class.hls::stream.2"]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #2 {
entry:
  %1 = icmp eq i16* %_0, null
  %2 = icmp eq [8 x %"class.hls::stream.2"]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %src.addr = getelementptr [8 x %"class.hls::stream.2"], [8 x %"class.hls::stream.2"]* %0, i64 0, i64 %for.loop.idx1
  switch i64 %for.loop.idx1, label %dst.addr.case.7 [
    i64 0, label %dst.addr.case.0
    i64 1, label %dst.addr.case.1
    i64 2, label %dst.addr.case.2
    i64 3, label %dst.addr.case.3
    i64 4, label %dst.addr.case.4
    i64 5, label %dst.addr.case.5
    i64 6, label %dst.addr.case.6
  ]

dst.addr.case.0:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.2.12.13"(i16* align 512 %_0, %"class.hls::stream.2"* %src.addr)
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.2.12.13"(i16* align 512 %_1, %"class.hls::stream.2"* %src.addr)
  br label %dst.addr.exit

dst.addr.case.2:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.2.12.13"(i16* align 512 %_2, %"class.hls::stream.2"* %src.addr)
  br label %dst.addr.exit

dst.addr.case.3:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.2.12.13"(i16* align 512 %_3, %"class.hls::stream.2"* %src.addr)
  br label %dst.addr.exit

dst.addr.case.4:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.2.12.13"(i16* align 512 %_4, %"class.hls::stream.2"* %src.addr)
  br label %dst.addr.exit

dst.addr.case.5:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.2.12.13"(i16* align 512 %_5, %"class.hls::stream.2"* %src.addr)
  br label %dst.addr.exit

dst.addr.case.6:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.2.12.13"(i16* align 512 %_6, %"class.hls::stream.2"* %src.addr)
  br label %dst.addr.exit

dst.addr.case.7:                                  ; preds = %for.loop
  %4 = icmp eq i64 %for.loop.idx1, 7
  call void @llvm.assume(i1 %4)
  call void @"streamcpy_hls.p0class.hls::stream.2.12.13"(i16* align 512 %_7, %"class.hls::stream.2"* %src.addr)
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.7, %dst.addr.case.6, %dst.addr.case.5, %dst.addr.case.4, %dst.addr.case.3, %dst.addr.case.2, %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 8
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal void @copy_in(%"class.hls::stream"* "orig.arg.no"="0", %"class.hls::stream"* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1", [8 x %"class.hls::stream.2"]* "orig.arg.no"="2", i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_0, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_1, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_2, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_3, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_4, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_5, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_6, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_7, [8 x %"class.hls::stream.1"]* "orig.arg.no"="4", i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_01, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_12, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_23, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_34, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_45, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_56, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_67, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_78, [8 x %"class.hls::stream.1"]* "orig.arg.no"="6", i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_09, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_110, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_211, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_312, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_413, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_514, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_615, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_716) #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream"(%"class.hls::stream"* align 512 %1, %"class.hls::stream"* %0)
  call void @"onebyonecpy_hls.p0a8class.hls::stream.2.11.14"(i16* align 512 %_0, i16* align 512 %_1, i16* align 512 %_2, i16* align 512 %_3, i16* align 512 %_4, i16* align 512 %_5, i16* align 512 %_6, i16* align 512 %_7, [8 x %"class.hls::stream.2"]* %2)
  call void @"onebyonecpy_hls.p0a8class.hls::stream.1.15.18"(i32* align 512 %_01, i32* align 512 %_12, i32* align 512 %_23, i32* align 512 %_34, i32* align 512 %_45, i32* align 512 %_56, i32* align 512 %_67, i32* align 512 %_78, [8 x %"class.hls::stream.1"]* %3)
  call void @"onebyonecpy_hls.p0a8class.hls::stream.1.15.18"(i32* align 512 %_09, i32* align 512 %_110, i32* align 512 %_211, i32* align 512 %_312, i32* align 512 %_413, i32* align 512 %_514, i32* align 512 %_615, i32* align 512 %_716, [8 x %"class.hls::stream.1"]* %4)
  ret void
}

; Function Attrs: argmemonly noinline
define internal void @"onebyonecpy_hls.p0a8class.hls::stream.2.23.26"([8 x %"class.hls::stream.2"]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_2, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_3, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_4, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_5, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_6, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_7) #2 {
entry:
  %1 = icmp eq [8 x %"class.hls::stream.2"]* %0, null
  %2 = icmp eq i16* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [8 x %"class.hls::stream.2"], [8 x %"class.hls::stream.2"]* %0, i64 0, i64 %for.loop.idx1
  switch i64 %for.loop.idx1, label %src.addr.case.7 [
    i64 0, label %src.addr.case.0
    i64 1, label %src.addr.case.1
    i64 2, label %src.addr.case.2
    i64 3, label %src.addr.case.3
    i64 4, label %src.addr.case.4
    i64 5, label %src.addr.case.5
    i64 6, label %src.addr.case.6
  ]

src.addr.case.0:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.2.24.25"(%"class.hls::stream.2"* %dst.addr, i16* align 512 %_0)
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.2.24.25"(%"class.hls::stream.2"* %dst.addr, i16* align 512 %_1)
  br label %src.addr.exit

src.addr.case.2:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.2.24.25"(%"class.hls::stream.2"* %dst.addr, i16* align 512 %_2)
  br label %src.addr.exit

src.addr.case.3:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.2.24.25"(%"class.hls::stream.2"* %dst.addr, i16* align 512 %_3)
  br label %src.addr.exit

src.addr.case.4:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.2.24.25"(%"class.hls::stream.2"* %dst.addr, i16* align 512 %_4)
  br label %src.addr.exit

src.addr.case.5:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.2.24.25"(%"class.hls::stream.2"* %dst.addr, i16* align 512 %_5)
  br label %src.addr.exit

src.addr.case.6:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.2.24.25"(%"class.hls::stream.2"* %dst.addr, i16* align 512 %_6)
  br label %src.addr.exit

src.addr.case.7:                                  ; preds = %for.loop
  %4 = icmp eq i64 %for.loop.idx1, 7
  call void @llvm.assume(i1 %4)
  call void @"streamcpy_hls.p0class.hls::stream.2.24.25"(%"class.hls::stream.2"* %dst.addr, i16* align 512 %_7)
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.7, %src.addr.case.6, %src.addr.case.5, %src.addr.case.4, %src.addr.case.3, %src.addr.case.2, %src.addr.case.1, %src.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 8
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal void @copy_out(%"class.hls::stream"* "orig.arg.no"="0", %"class.hls::stream"* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1", [8 x %"class.hls::stream.2"]* "orig.arg.no"="2", i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_0, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_1, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_2, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_3, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_4, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_5, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_6, i16* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3" %_7, [8 x %"class.hls::stream.1"]* "orig.arg.no"="4", i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_01, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_12, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_23, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_34, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_45, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_56, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_67, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5" %_78, [8 x %"class.hls::stream.1"]* "orig.arg.no"="6", i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_09, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_110, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_211, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_312, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_413, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_514, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_615, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="7" %_716) #6 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream"(%"class.hls::stream"* %0, %"class.hls::stream"* align 512 %1)
  call void @"onebyonecpy_hls.p0a8class.hls::stream.2.23.26"([8 x %"class.hls::stream.2"]* %2, i16* align 512 %_0, i16* align 512 %_1, i16* align 512 %_2, i16* align 512 %_3, i16* align 512 %_4, i16* align 512 %_5, i16* align 512 %_6, i16* align 512 %_7)
  call void @"onebyonecpy_hls.p0a8class.hls::stream.1.27.30"([8 x %"class.hls::stream.1"]* %3, i32* align 512 %_01, i32* align 512 %_12, i32* align 512 %_23, i32* align 512 %_34, i32* align 512 %_45, i32* align 512 %_56, i32* align 512 %_67, i32* align 512 %_78)
  call void @"onebyonecpy_hls.p0a8class.hls::stream.1.27.30"([8 x %"class.hls::stream.1"]* %4, i32* align 512 %_09, i32* align 512 %_110, i32* align 512 %_211, i32* align 512 %_312, i32* align 512 %_413, i32* align 512 %_514, i32* align 512 %_615, i32* align 512 %_716)
  ret void
}

; Function Attrs: argmemonly noinline
define internal void @"streamcpy_hls.p0class.hls::stream.1.28.29.38"(%"class.hls::stream.1"* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", i32* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #3 {
entry:
  %2 = alloca i32
  %3 = alloca %"class.hls::stream.1"
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = bitcast i32* %1 to i8*
  %5 = call i1 @fpga_fifo_not_empty_4(i8* %4)
  br i1 %5, label %push, label %ret

push:                                             ; preds = %empty
  %6 = bitcast i32* %2 to i8*
  %7 = bitcast i32* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %6, i8* %7)
  %8 = load volatile i32, i32* %2
  %9 = call float @"_llvm.fpga.unpack.bits.s_class.hls::stream.1s.i32"(i32 %8)
  %oldret = insertvalue %"class.hls::stream.1" undef, float %9, 0
  store %"class.hls::stream.1" %oldret, %"class.hls::stream.1"* %3
  %10 = bitcast %"class.hls::stream.1"* %3 to i8*
  %11 = bitcast %"class.hls::stream.1"* %0 to i8*
  call void @fpga_fifo_push_4(i8* %10, i8* %11)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: alwaysinline nounwind readnone
define internal float @"_llvm.fpga.unpack.bits.s_class.hls::stream.1s.i32"(i32 %A) #7 {
  %A.0.cast = bitcast i32 %A to float
  ret float %A.0.cast
}

; Function Attrs: argmemonly noinline
define internal void @"streamcpy_hls.p0class.hls::stream.1.16.17.46"(i32* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", %"class.hls::stream.1"* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #3 {
entry:
  %2 = alloca %"class.hls::stream.1"
  %3 = alloca i32
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = bitcast %"class.hls::stream.1"* %1 to i8*
  %5 = call i1 @fpga_fifo_not_empty_4(i8* %4)
  br i1 %5, label %push, label %ret

push:                                             ; preds = %empty
  %6 = bitcast %"class.hls::stream.1"* %2 to i8*
  %7 = bitcast %"class.hls::stream.1"* %1 to i8*
  call void @fpga_fifo_pop_4(i8* %6, i8* %7)
  %8 = load volatile %"class.hls::stream.1", %"class.hls::stream.1"* %2
  %9 = call i32 @"_llvm.fpga.pack.bits.i32.s_class.hls::stream.1s"(%"class.hls::stream.1" %8)
  store i32 %9, i32* %3
  %10 = bitcast i32* %3 to i8*
  %11 = bitcast i32* %0 to i8*
  call void @fpga_fifo_push_4(i8* %10, i8* %11)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: alwaysinline nounwind readnone
define internal i32 @"_llvm.fpga.pack.bits.i32.s_class.hls::stream.1s"(%"class.hls::stream.1" %A) #7 {
  %A.0 = extractvalue %"class.hls::stream.1" %A, 0
  %A.0.cast = bitcast float %A.0 to i32
  ret i32 %A.0.cast
}

; Function Attrs: argmemonly noinline
define internal void @"onebyonecpy_hls.p0a8class.hls::stream.1.15.18"(i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_0, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_1, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_2, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_3, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_4, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_5, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_6, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0" %_7, [8 x %"class.hls::stream.1"]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #2 {
entry:
  %1 = icmp eq i32* %_0, null
  %2 = icmp eq [8 x %"class.hls::stream.1"]* %0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %dst.addr.exit ]
  %src.addr = getelementptr [8 x %"class.hls::stream.1"], [8 x %"class.hls::stream.1"]* %0, i64 0, i64 %for.loop.idx1
  switch i64 %for.loop.idx1, label %dst.addr.case.7 [
    i64 0, label %dst.addr.case.0
    i64 1, label %dst.addr.case.1
    i64 2, label %dst.addr.case.2
    i64 3, label %dst.addr.case.3
    i64 4, label %dst.addr.case.4
    i64 5, label %dst.addr.case.5
    i64 6, label %dst.addr.case.6
  ]

dst.addr.case.0:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.1.16.17.46"(i32* align 512 %_0, %"class.hls::stream.1"* %src.addr)
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.1.16.17.46"(i32* align 512 %_1, %"class.hls::stream.1"* %src.addr)
  br label %dst.addr.exit

dst.addr.case.2:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.1.16.17.46"(i32* align 512 %_2, %"class.hls::stream.1"* %src.addr)
  br label %dst.addr.exit

dst.addr.case.3:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.1.16.17.46"(i32* align 512 %_3, %"class.hls::stream.1"* %src.addr)
  br label %dst.addr.exit

dst.addr.case.4:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.1.16.17.46"(i32* align 512 %_4, %"class.hls::stream.1"* %src.addr)
  br label %dst.addr.exit

dst.addr.case.5:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.1.16.17.46"(i32* align 512 %_5, %"class.hls::stream.1"* %src.addr)
  br label %dst.addr.exit

dst.addr.case.6:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.1.16.17.46"(i32* align 512 %_6, %"class.hls::stream.1"* %src.addr)
  br label %dst.addr.exit

dst.addr.case.7:                                  ; preds = %for.loop
  %4 = icmp eq i64 %for.loop.idx1, 7
  call void @llvm.assume(i1 %4)
  call void @"streamcpy_hls.p0class.hls::stream.1.16.17.46"(i32* align 512 %_7, %"class.hls::stream.1"* %src.addr)
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.7, %dst.addr.case.6, %dst.addr.case.5, %dst.addr.case.4, %dst.addr.case.3, %dst.addr.case.2, %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 8
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %dst.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal void @"onebyonecpy_hls.p0a8class.hls::stream.1.27.30"([8 x %"class.hls::stream.1"]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_0, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_1, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_2, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_3, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_4, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_5, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_6, i32* noalias align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1" %_7) #2 {
entry:
  %1 = icmp eq [8 x %"class.hls::stream.1"]* %0, null
  %2 = icmp eq i32* %_0, null
  %3 = or i1 %1, %2
  br i1 %3, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %copy
  %for.loop.idx1 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [8 x %"class.hls::stream.1"], [8 x %"class.hls::stream.1"]* %0, i64 0, i64 %for.loop.idx1
  switch i64 %for.loop.idx1, label %src.addr.case.7 [
    i64 0, label %src.addr.case.0
    i64 1, label %src.addr.case.1
    i64 2, label %src.addr.case.2
    i64 3, label %src.addr.case.3
    i64 4, label %src.addr.case.4
    i64 5, label %src.addr.case.5
    i64 6, label %src.addr.case.6
  ]

src.addr.case.0:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.1.28.29.38"(%"class.hls::stream.1"* %dst.addr, i32* align 512 %_0)
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.1.28.29.38"(%"class.hls::stream.1"* %dst.addr, i32* align 512 %_1)
  br label %src.addr.exit

src.addr.case.2:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.1.28.29.38"(%"class.hls::stream.1"* %dst.addr, i32* align 512 %_2)
  br label %src.addr.exit

src.addr.case.3:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.1.28.29.38"(%"class.hls::stream.1"* %dst.addr, i32* align 512 %_3)
  br label %src.addr.exit

src.addr.case.4:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.1.28.29.38"(%"class.hls::stream.1"* %dst.addr, i32* align 512 %_4)
  br label %src.addr.exit

src.addr.case.5:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.1.28.29.38"(%"class.hls::stream.1"* %dst.addr, i32* align 512 %_5)
  br label %src.addr.exit

src.addr.case.6:                                  ; preds = %for.loop
  call void @"streamcpy_hls.p0class.hls::stream.1.28.29.38"(%"class.hls::stream.1"* %dst.addr, i32* align 512 %_6)
  br label %src.addr.exit

src.addr.case.7:                                  ; preds = %for.loop
  %4 = icmp eq i64 %for.loop.idx1, 7
  call void @llvm.assume(i1 %4)
  call void @"streamcpy_hls.p0class.hls::stream.1.28.29.38"(%"class.hls::stream.1"* %dst.addr, i32* align 512 %_7)
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.7, %src.addr.case.6, %src.addr.case.5, %src.addr.case.4, %src.addr.case.3, %src.addr.case.2, %src.addr.case.1, %src.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx1, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 8
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %src.addr.exit, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal void @"streamcpy_hls.p0class.hls::stream.2.24.25"(%"class.hls::stream.2"* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", i16* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #3 {
entry:
  %2 = alloca i16
  %3 = alloca %"class.hls::stream.2"
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = bitcast i16* %1 to i8*
  %5 = call i1 @fpga_fifo_not_empty_2(i8* %4)
  br i1 %5, label %push, label %ret

push:                                             ; preds = %empty
  %6 = bitcast i16* %2 to i8*
  %7 = bitcast i16* %1 to i8*
  call void @fpga_fifo_pop_2(i8* %6, i8* %7)
  %8 = load volatile i16, i16* %2
  %9 = call %struct.ap_int_base @"_llvm.fpga.unpack.bits.s_class.hls::stream.2s.i16"(i16 %8)
  %oldret1 = insertvalue %struct.ap_uint undef, %struct.ap_int_base %9, 0
  %oldret = insertvalue %"class.hls::stream.2" undef, %struct.ap_uint %oldret1, 0
  store %"class.hls::stream.2" %oldret, %"class.hls::stream.2"* %3
  %10 = bitcast %"class.hls::stream.2"* %3 to i8*
  %11 = bitcast %"class.hls::stream.2"* %0 to i8*
  call void @fpga_fifo_push_2(i8* %10, i8* %11)
  br label %empty, !llvm.loop !8

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: alwaysinline nounwind readnone
define internal %struct.ap_int_base @"_llvm.fpga.unpack.bits.s_class.hls::stream.2s.i16"(i16 %A) #7 {
  %.0 = insertvalue %struct.ssdm_int undef, i16 %A, 0
  %.01 = insertvalue %struct.ap_int_base undef, %struct.ssdm_int %.0, 0
  %.02 = insertvalue %struct.ap_uint undef, %struct.ap_int_base %.01, 0
  %oldret = extractvalue %struct.ap_uint %.02, 0
  ret %struct.ap_int_base %oldret
}

; Function Attrs: argmemonly noinline
define internal void @"streamcpy_hls.p0class.hls::stream.2.12.13"(i16* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", %"class.hls::stream.2"* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #3 {
entry:
  %2 = alloca %"class.hls::stream.2"
  %3 = alloca i16
  br label %empty

empty:                                            ; preds = %push, %entry
  %4 = bitcast %"class.hls::stream.2"* %1 to i8*
  %5 = call i1 @fpga_fifo_not_empty_2(i8* %4)
  br i1 %5, label %push, label %ret

push:                                             ; preds = %empty
  %6 = bitcast %"class.hls::stream.2"* %2 to i8*
  %7 = bitcast %"class.hls::stream.2"* %1 to i8*
  call void @fpga_fifo_pop_2(i8* %6, i8* %7)
  %8 = load volatile %"class.hls::stream.2", %"class.hls::stream.2"* %2
  %9 = call i16 @"_llvm.fpga.pack.bits.i16.s_class.hls::stream.2s"(%"class.hls::stream.2" %8)
  store i16 %9, i16* %3
  %10 = bitcast i16* %3 to i8*
  %11 = bitcast i16* %0 to i8*
  call void @fpga_fifo_push_2(i8* %10, i8* %11)
  br label %empty, !llvm.loop !8

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: alwaysinline nounwind readnone
define internal i16 @"_llvm.fpga.pack.bits.i16.s_class.hls::stream.2s"(%"class.hls::stream.2" %A) #7 {
  %A.0 = extractvalue %"class.hls::stream.2" %A, 0
  %A.0.0 = extractvalue %struct.ap_uint %A.0, 0
  %A.0.0.0 = extractvalue %struct.ap_int_base %A.0.0, 0
  %A.0.0.0.0 = extractvalue %struct.ssdm_int %A.0.0.0, 0
  ret i16 %A.0.0.0.0
}

declare void @apatb_sort_C_hw(i32, %"class.hls::stream"*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*)

define void @sort_C_hw_stub_wrapper(i32, %"class.hls::stream"*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*) #8 {
entry:
  %26 = alloca [8 x %"class.hls::stream.2"]
  %27 = alloca [8 x %"class.hls::stream.1"]
  %28 = alloca [8 x %"class.hls::stream.1"]
  call void @copy_out(%"class.hls::stream"* null, %"class.hls::stream"* %1, [8 x %"class.hls::stream.2"]* %26, i16* %2, i16* %3, i16* %4, i16* %5, i16* %6, i16* %7, i16* %8, i16* %9, [8 x %"class.hls::stream.1"]* %27, i32* %10, i32* %11, i32* %12, i32* %13, i32* %14, i32* %15, i32* %16, i32* %17, [8 x %"class.hls::stream.1"]* %28, i32* %18, i32* %19, i32* %20, i32* %21, i32* %22, i32* %23, i32* %24, i32* %25)
  %29 = bitcast [8 x %"class.hls::stream.2"]* %26 to %"class.hls::stream.2"*
  %30 = bitcast [8 x %"class.hls::stream.1"]* %27 to %"class.hls::stream.1"*
  %31 = bitcast [8 x %"class.hls::stream.1"]* %28 to %"class.hls::stream.1"*
  call void @sort_C_hw_stub(i32 %0, %"class.hls::stream"* %1, %"class.hls::stream.2"* %29, %"class.hls::stream.1"* %30, %"class.hls::stream.1"* %31)
  call void @copy_in(%"class.hls::stream"* null, %"class.hls::stream"* %1, [8 x %"class.hls::stream.2"]* %26, i16* %2, i16* %3, i16* %4, i16* %5, i16* %6, i16* %7, i16* %8, i16* %9, [8 x %"class.hls::stream.1"]* %27, i32* %10, i32* %11, i32* %12, i32* %13, i32* %14, i32* %15, i32* %16, i32* %17, [8 x %"class.hls::stream.1"]* %28, i32* %18, i32* %19, i32* %20, i32* %21, i32* %22, i32* %23, i32* %24, i32* %25)
  ret void
}

declare void @sort_C_hw_stub(i32, %"class.hls::stream"*, %"class.hls::stream.2"*, %"class.hls::stream.1"*, %"class.hls::stream.1"*)

declare i1 @fpga_fifo_not_empty_4(i8*)

declare i1 @fpga_fifo_not_empty_2(i8*)

declare void @fpga_fifo_pop_4(i8*, i8*)

declare void @fpga_fifo_pop_2(i8*, i8*)

declare void @fpga_fifo_push_4(i8*, i8*)

declare void @fpga_fifo_push_2(i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #6 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #7 = { alwaysinline nounwind readnone }
attributes #8 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
