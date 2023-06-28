module attributes {llvm.data_layout = "", torch.debug_module_name = "model"} {
  llvm.mlir.global private constant @assert_msg_1(dense<[65, 119, 97, 105, 116, 101, 100, 32, 97, 115, 121, 110, 99, 32, 111, 112, 101, 114, 97, 110, 100, 32, 105, 115, 32, 105, 110, 32, 101, 114, 114, 111, 114, 32, 115, 116, 97, 116, 101, 0]> : tensor<40xi8>) {addr_space = 0 : i32} : !llvm.array<40 x i8>
  llvm.func @abort()
  llvm.func @puts(!llvm.ptr<i8>)
  llvm.mlir.global private constant @assert_msg_0(dense<[65, 119, 97, 105, 116, 101, 100, 32, 97, 115, 121, 110, 99, 32, 111, 112, 101, 114, 97, 110, 100, 32, 105, 115, 32, 105, 110, 32, 101, 114, 114, 111, 114, 32, 115, 116, 97, 116, 101, 0]> : tensor<40xi8>) {addr_space = 0 : i32} : !llvm.array<40 x i8>
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.func @free(!llvm.ptr<i8>)
  llvm.func @aligned_alloc(i64, i64) -> !llvm.ptr<i8>
  llvm.mlir.global private @channel_7(0 : i64) {addr_space = 0 : i32} : i64
  llvm.mlir.global private @channel_6(0 : i64) {addr_space = 0 : i32} : i64
  llvm.mlir.global private @channel_5(0 : i64) {addr_space = 0 : i32} : i64
  llvm.mlir.global private @channel_4(0 : i64) {addr_space = 0 : i32} : i64
  llvm.mlir.global private @channel_3(0 : i64) {addr_space = 0 : i32} : i64
  llvm.mlir.global private @channel_2(0 : i64) {addr_space = 0 : i32} : i64
  llvm.mlir.global private @channel_1(0 : i64) {addr_space = 0 : i32} : i64
  llvm.mlir.global private @channel_0(0 : i64) {addr_space = 0 : i32} : i64
  llvm.func @forward(%arg0: !llvm.ptr<i32>, %arg1: !llvm.ptr<i32>, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: !llvm.ptr<i32>, %arg8: !llvm.ptr<i32>, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: !llvm.ptr<i32>, %arg15: !llvm.ptr<i32>, %arg16: i64, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: i64, %arg21: !llvm.ptr<i32>, %arg22: !llvm.ptr<i32>, %arg23: i64, %arg24: i64, %arg25: i64, %arg26: i64, %arg27: i64) attributes {llvm.emit_c_interface} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(3735928559 : index) : i64
    %2 = llvm.mlir.constant(false) : i1
    %3 = llvm.mlir.constant(64 : index) : i64
    %4 = llvm.mlir.constant(0 : i32) : i32
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.mlir.constant(32 : index) : i64
    %7 = llvm.mlir.constant(0 : index) : i64
    %8 = llvm.mlir.constant(true) : i1
    %9 = llvm.mlir.null : !llvm.ptr<i32>
    %10 = llvm.getelementptr %9[1024] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %11 = llvm.ptrtoint %10 : !llvm.ptr<i32> to i64
    %12 = llvm.add %11, %3  : i64
    %13 = llvm.call @malloc(%12) : (i64) -> !llvm.ptr<i8>
    %14 = llvm.bitcast %13 : !llvm.ptr<i8> to !llvm.ptr<i32>
    %15 = llvm.ptrtoint %14 : !llvm.ptr<i32> to i64
    %16 = llvm.sub %3, %5  : i64
    %17 = llvm.add %15, %16  : i64
    %18 = llvm.urem %17, %3  : i64
    %19 = llvm.sub %17, %18  : i64
    %20 = llvm.inttoptr %19 : i64 to !llvm.ptr<i32>
    llvm.br ^bb1(%7 : i64)
  ^bb1(%21: i64):  // 2 preds: ^bb0, ^bb5
    %22 = llvm.icmp "slt" %21, %6 : i64
    llvm.cond_br %22, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%7 : i64)
  ^bb3(%23: i64):  // 2 preds: ^bb2, ^bb4
    %24 = llvm.icmp "slt" %23, %6 : i64
    llvm.cond_br %24, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %25 = llvm.mul %21, %6  : i64
    %26 = llvm.add %25, %23  : i64
    %27 = llvm.getelementptr %20[%26] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    llvm.store %4, %27 : !llvm.ptr<i32>
    %28 = llvm.add %23, %5  : i64
    llvm.br ^bb3(%28 : i64)
  ^bb5:  // pred: ^bb3
    %29 = llvm.add %21, %5  : i64
    llvm.br ^bb1(%29 : i64)
  ^bb6:  // pred: ^bb1
    %30 = llvm.call @malloc(%12) : (i64) -> !llvm.ptr<i8>
    %31 = llvm.bitcast %30 : !llvm.ptr<i8> to !llvm.ptr<i32>
    %32 = llvm.ptrtoint %31 : !llvm.ptr<i32> to i64
    %33 = llvm.add %32, %16  : i64
    %34 = llvm.urem %33, %3  : i64
    %35 = llvm.sub %33, %34  : i64
    %36 = llvm.inttoptr %35 : i64 to !llvm.ptr<i32>
    %37 = llvm.mul %5, %6  : i64
    %38 = llvm.mul %37, %6  : i64
    %39 = llvm.getelementptr %9[1] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %40 = llvm.ptrtoint %39 : !llvm.ptr<i32> to i64
    %41 = llvm.mul %38, %40  : i64
    "llvm.intr.memcpy"(%36, %20, %41, %2) : (!llvm.ptr<i32>, !llvm.ptr<i32>, i64, i1) -> ()
    %42 = llvm.mlir.addressof @channel_0 : !llvm.ptr<i64>
    %43 = llvm.inttoptr %1 : i64 to !llvm.ptr<i64>
    llvm.call @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%43, %42, %7, %arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %7, %7, %6, %6, %5, %6) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    %44 = llvm.mlir.addressof @channel_1 : !llvm.ptr<i64>
    llvm.call @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%43, %44, %7, %arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %7, %7, %6, %6, %5, %6) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    %45 = llvm.mlir.addressof @channel_2 : !llvm.ptr<i64>
    llvm.call @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%43, %45, %7, %31, %36, %7, %6, %6, %6, %5, %7, %7, %6, %6, %5, %6) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    %46 = llvm.call @async_execute_fn() : () -> !llvm.ptr<i8>
    llvm.call @mlirAsyncRuntimeAwaitToken(%46) : (!llvm.ptr<i8>) -> ()
    %47 = llvm.call @mlirAsyncRuntimeIsTokenError(%46) : (!llvm.ptr<i8>) -> i1
    llvm.call @mlirAsyncRuntimeDropRef(%46, %0) : (!llvm.ptr<i8>, i64) -> ()
    %48 = llvm.xor %47, %8  : i1
    llvm.cond_br %48, ^bb7, ^bb9
  ^bb7:  // pred: ^bb6
    %49 = llvm.call @malloc(%12) : (i64) -> !llvm.ptr<i8>
    %50 = llvm.bitcast %49 : !llvm.ptr<i8> to !llvm.ptr<i32>
    %51 = llvm.ptrtoint %50 : !llvm.ptr<i32> to i64
    %52 = llvm.add %51, %16  : i64
    %53 = llvm.urem %52, %3  : i64
    %54 = llvm.sub %52, %53  : i64
    %55 = llvm.inttoptr %54 : i64 to !llvm.ptr<i32>
    "llvm.intr.memcpy"(%55, %20, %41, %2) : (!llvm.ptr<i32>, !llvm.ptr<i32>, i64, i1) -> ()
    %56 = llvm.mlir.addressof @channel_3 : !llvm.ptr<i64>
    llvm.call @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%43, %56, %7, %31, %36, %7, %6, %6, %6, %5, %7, %7, %6, %6, %5, %6) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    %57 = llvm.mlir.addressof @channel_4 : !llvm.ptr<i64>
    llvm.call @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%43, %57, %7, %31, %36, %7, %6, %6, %6, %5, %7, %7, %6, %6, %5, %6) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    %58 = llvm.mlir.addressof @channel_5 : !llvm.ptr<i64>
    llvm.call @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%43, %58, %7, %arg14, %arg15, %arg16, %arg17, %arg18, %arg19, %arg20, %7, %7, %6, %6, %5, %6) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    %59 = llvm.mlir.addressof @channel_6 : !llvm.ptr<i64>
    llvm.call @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%43, %59, %7, %50, %55, %7, %6, %6, %6, %5, %7, %7, %6, %6, %5, %6) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    %60 = llvm.call @async_execute_fn_0() : () -> !llvm.ptr<i8>
    llvm.call @mlirAsyncRuntimeAwaitToken(%60) : (!llvm.ptr<i8>) -> ()
    %61 = llvm.call @mlirAsyncRuntimeIsTokenError(%60) : (!llvm.ptr<i8>) -> i1
    llvm.call @mlirAsyncRuntimeDropRef(%60, %0) : (!llvm.ptr<i8>, i64) -> ()
    %62 = llvm.xor %61, %8  : i1
    llvm.cond_br %62, ^bb8, ^bb10
  ^bb8:  // pred: ^bb7
    %63 = llvm.mlir.addressof @channel_7 : !llvm.ptr<i64>
    llvm.call @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%43, %63, %7, %50, %55, %7, %6, %6, %6, %5, %7, %7, %6, %6, %5, %6) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    %64 = llvm.getelementptr %arg22[%arg23] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    "llvm.intr.memcpy"(%64, %55, %41, %2) : (!llvm.ptr<i32>, !llvm.ptr<i32>, i64, i1) -> ()
    llvm.return
  ^bb9:  // pred: ^bb6
    %65 = llvm.mlir.addressof @assert_msg_0 : !llvm.ptr<array<40 x i8>>
    %66 = llvm.getelementptr %65[0] : (!llvm.ptr<array<40 x i8>>) -> !llvm.ptr<i8>
    llvm.call @puts(%66) : (!llvm.ptr<i8>) -> ()
    llvm.call @abort() : () -> ()
    llvm.unreachable
  ^bb10:  // pred: ^bb7
    %67 = llvm.mlir.addressof @assert_msg_1 : !llvm.ptr<array<40 x i8>>
    %68 = llvm.getelementptr %67[0] : (!llvm.ptr<array<40 x i8>>) -> !llvm.ptr<i8>
    llvm.call @puts(%68) : (!llvm.ptr<i8>) -> ()
    llvm.call @abort() : () -> ()
    llvm.unreachable
  }
  llvm.func @_mlir_ciface_forward(%arg0: !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>>, %arg1: !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>>, %arg2: !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>>, %arg3: !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>>) attributes {llvm.emit_c_interface} {
    %0 = llvm.load %arg0 : !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>>
    %1 = llvm.extractvalue %0[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %2 = llvm.extractvalue %0[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %3 = llvm.extractvalue %0[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %4 = llvm.extractvalue %0[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %5 = llvm.extractvalue %0[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %6 = llvm.extractvalue %0[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %7 = llvm.extractvalue %0[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.load %arg1 : !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>>
    %9 = llvm.extractvalue %8[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %10 = llvm.extractvalue %8[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.extractvalue %8[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.extractvalue %8[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.extractvalue %8[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.extractvalue %8[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %15 = llvm.extractvalue %8[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %16 = llvm.load %arg2 : !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>>
    %17 = llvm.extractvalue %16[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %18 = llvm.extractvalue %16[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %19 = llvm.extractvalue %16[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %20 = llvm.extractvalue %16[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %21 = llvm.extractvalue %16[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %22 = llvm.extractvalue %16[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %23 = llvm.extractvalue %16[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %24 = llvm.load %arg3 : !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>>
    %25 = llvm.extractvalue %24[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %26 = llvm.extractvalue %24[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %27 = llvm.extractvalue %24[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %28 = llvm.extractvalue %24[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %29 = llvm.extractvalue %24[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %30 = llvm.extractvalue %24[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %31 = llvm.extractvalue %24[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.call @forward(%1, %2, %3, %4, %5, %6, %7, %9, %10, %11, %12, %13, %14, %15, %17, %18, %19, %20, %21, %22, %23, %25, %26, %27, %28, %29, %30, %31) : (!llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64) -> ()
    llvm.return
  }
  llvm.func @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%arg0: !llvm.ptr<i64>, %arg1: !llvm.ptr<i64>, %arg2: i64, %arg3: !llvm.ptr<i32>, %arg4: !llvm.ptr<i32>, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: i64, %arg15: i64) attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64)>
    %2 = llvm.insertvalue %arg0, %1[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64)> 
    %3 = llvm.insertvalue %arg1, %2[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64)> 
    %4 = llvm.insertvalue %arg2, %3[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64)> 
    %5 = llvm.alloca %0 x !llvm.struct<(ptr<i64>, ptr<i64>, i64)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64)>>
    llvm.store %4, %5 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64)>>
    %6 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %7 = llvm.insertvalue %arg3, %6[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.insertvalue %arg4, %7[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.insertvalue %arg5, %8[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %10 = llvm.insertvalue %arg6, %9[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.insertvalue %arg8, %10[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.insertvalue %arg7, %11[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.insertvalue %arg9, %12[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.alloca %0 x !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>>
    llvm.store %13, %14 : !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>>
    llvm.call @_mlir_ciface_air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%5, %14, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15) : (!llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64)>>, !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>>, i64, i64, i64, i64, i64, i64) -> ()
    llvm.return
  }
  llvm.func @_mlir_ciface_air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(!llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64)>>, !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>>, i64, i64, i64, i64, i64, i64) attributes {llvm.emit_c_interface, sym_visibility = "private"}
  llvm.func @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%arg0: !llvm.ptr<i64>, %arg1: !llvm.ptr<i64>, %arg2: i64, %arg3: !llvm.ptr<i32>, %arg4: !llvm.ptr<i32>, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: i64, %arg15: i64) attributes {llvm.emit_c_interface, sym_visibility = "private"} {
    %0 = llvm.mlir.constant(1 : index) : i64
    %1 = llvm.mlir.undef : !llvm.struct<(ptr<i64>, ptr<i64>, i64)>
    %2 = llvm.insertvalue %arg0, %1[0] : !llvm.struct<(ptr<i64>, ptr<i64>, i64)> 
    %3 = llvm.insertvalue %arg1, %2[1] : !llvm.struct<(ptr<i64>, ptr<i64>, i64)> 
    %4 = llvm.insertvalue %arg2, %3[2] : !llvm.struct<(ptr<i64>, ptr<i64>, i64)> 
    %5 = llvm.alloca %0 x !llvm.struct<(ptr<i64>, ptr<i64>, i64)> : (i64) -> !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64)>>
    llvm.store %4, %5 : !llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64)>>
    %6 = llvm.mlir.undef : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>
    %7 = llvm.insertvalue %arg3, %6[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %8 = llvm.insertvalue %arg4, %7[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %9 = llvm.insertvalue %arg5, %8[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %10 = llvm.insertvalue %arg6, %9[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %11 = llvm.insertvalue %arg8, %10[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %12 = llvm.insertvalue %arg7, %11[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %13 = llvm.insertvalue %arg9, %12[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> 
    %14 = llvm.alloca %0 x !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)> : (i64) -> !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>>
    llvm.store %13, %14 : !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>>
    llvm.call @_mlir_ciface_air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%5, %14, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15) : (!llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64)>>, !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>>, i64, i64, i64, i64, i64, i64) -> ()
    llvm.return
  }
  llvm.func @_mlir_ciface_air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(!llvm.ptr<struct<(ptr<i64>, ptr<i64>, i64)>>, !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<2 x i64>, array<2 x i64>)>>, i64, i64, i64, i64, i64, i64) attributes {llvm.emit_c_interface, sym_visibility = "private"}
  llvm.func @async_execute_fn() -> !llvm.ptr<i8> attributes {passthrough = ["presplitcoroutine"], sym_visibility = "private"} {
    %0 = llvm.mlir.constant(3735928559 : index) : i64
    %1 = llvm.mlir.constant(false) : i1
    %2 = llvm.mlir.constant(0 : i64) : i64
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.mlir.constant(0 : i32) : i32
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.mlir.constant(32 : index) : i64
    %7 = llvm.mlir.constant(0 : index) : i64
    %8 = llvm.call @mlirAsyncRuntimeCreateToken() : () -> !llvm.ptr<i8>
    %9 = llvm.mlir.null : !llvm.ptr<i8>
    %10 = llvm.intr.coro.id %4, %9, %9, %9 : !llvm.token
    %11 = llvm.intr.coro.size : i64
    %12 = llvm.intr.coro.align : i64
    %13 = llvm.add %11, %12  : i64
    %14 = llvm.sub %13, %3  : i64
    %15 = llvm.sub %2, %12  : i64
    %16 = llvm.and %14, %15  : i64
    %17 = llvm.call @aligned_alloc(%12, %16) : (i64, i64) -> !llvm.ptr<i8>
    %18 = llvm.intr.coro.begin %10, %17 : !llvm.ptr<i8>
    %19 = llvm.intr.coro.save %18 : !llvm.token
    %20 = llvm.mlir.addressof @__resume : !llvm.ptr<func<void (ptr<i8>)>>
    llvm.call @mlirAsyncRuntimeExecute(%18, %20) : (!llvm.ptr<i8>, !llvm.ptr<func<void (ptr<i8>)>>) -> ()
    %21 = llvm.intr.coro.suspend %19, %1 : i8
    %22 = llvm.sext %21 : i8 to i32
    llvm.switch %22 : i32, ^bb12 [
      0: ^bb1,
      1: ^bb11
    ]
  ^bb1:  // pred: ^bb0
    %23 = llvm.mlir.null : !llvm.ptr<i32>
    %24 = llvm.getelementptr %23[1024] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %25 = llvm.ptrtoint %24 : !llvm.ptr<i32> to i64
    %26 = llvm.call @malloc(%25) : (i64) -> !llvm.ptr<i8>
    %27 = llvm.bitcast %26 : !llvm.ptr<i8> to !llvm.ptr<i32>
    %28 = llvm.call @malloc(%25) : (i64) -> !llvm.ptr<i8>
    %29 = llvm.bitcast %28 : !llvm.ptr<i8> to !llvm.ptr<i32>
    %30 = llvm.call @malloc(%25) : (i64) -> !llvm.ptr<i8>
    %31 = llvm.bitcast %30 : !llvm.ptr<i8> to !llvm.ptr<i32>
    %32 = llvm.mlir.addressof @channel_0 : !llvm.ptr<i64>
    %33 = llvm.inttoptr %0 : i64 to !llvm.ptr<i64>
    llvm.call @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%33, %32, %7, %27, %27, %7, %6, %6, %6, %5, %7, %7, %6, %6, %5, %6) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    %34 = llvm.mlir.addressof @channel_1 : !llvm.ptr<i64>
    llvm.call @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%33, %34, %7, %29, %29, %7, %6, %6, %6, %5, %7, %7, %6, %6, %5, %6) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    %35 = llvm.mlir.addressof @channel_2 : !llvm.ptr<i64>
    llvm.call @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%33, %35, %7, %31, %31, %7, %6, %6, %6, %5, %7, %7, %6, %6, %5, %6) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    llvm.br ^bb2(%7 : i64)
  ^bb2(%36: i64):  // 2 preds: ^bb1, ^bb9
    %37 = llvm.icmp "slt" %36, %6 : i64
    llvm.cond_br %37, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%7 : i64)
  ^bb4(%38: i64):  // 2 preds: ^bb3, ^bb8
    %39 = llvm.icmp "slt" %38, %6 : i64
    llvm.cond_br %39, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%7 : i64)
  ^bb6(%40: i64):  // 2 preds: ^bb5, ^bb7
    %41 = llvm.icmp "slt" %40, %6 : i64
    llvm.cond_br %41, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %42 = llvm.mul %36, %6  : i64
    %43 = llvm.add %42, %40  : i64
    %44 = llvm.getelementptr %27[%43] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %45 = llvm.load %44 : !llvm.ptr<i32>
    %46 = llvm.mul %40, %6  : i64
    %47 = llvm.add %46, %38  : i64
    %48 = llvm.getelementptr %29[%47] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %49 = llvm.load %48 : !llvm.ptr<i32>
    %50 = llvm.add %42, %38  : i64
    %51 = llvm.getelementptr %31[%50] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %52 = llvm.load %51 : !llvm.ptr<i32>
    %53 = llvm.mul %45, %49  : i32
    %54 = llvm.add %52, %53  : i32
    llvm.store %54, %51 : !llvm.ptr<i32>
    %55 = llvm.add %40, %5  : i64
    llvm.br ^bb6(%55 : i64)
  ^bb8:  // pred: ^bb6
    %56 = llvm.add %38, %5  : i64
    llvm.br ^bb4(%56 : i64)
  ^bb9:  // pred: ^bb4
    %57 = llvm.add %36, %5  : i64
    llvm.br ^bb2(%57 : i64)
  ^bb10:  // pred: ^bb2
    %58 = llvm.mlir.addressof @channel_3 : !llvm.ptr<i64>
    llvm.call @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%33, %58, %7, %31, %31, %7, %6, %6, %6, %5, %7, %7, %6, %6, %5, %6) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    llvm.call @free(%26) : (!llvm.ptr<i8>) -> ()
    llvm.call @free(%28) : (!llvm.ptr<i8>) -> ()
    llvm.call @free(%30) : (!llvm.ptr<i8>) -> ()
    llvm.call @mlirAsyncRuntimeEmplaceToken(%8) : (!llvm.ptr<i8>) -> ()
    llvm.br ^bb11
  ^bb11:  // 2 preds: ^bb0, ^bb10
    %59 = llvm.intr.coro.free %10, %18 : !llvm.ptr<i8>
    llvm.call @free(%59) : (!llvm.ptr<i8>) -> ()
    llvm.br ^bb12
  ^bb12:  // 2 preds: ^bb0, ^bb11
    %60 = llvm.intr.coro.end %18, %1 : i1
    llvm.return %8 : !llvm.ptr<i8>
  }
  llvm.func @async_execute_fn_0() -> !llvm.ptr<i8> attributes {passthrough = ["presplitcoroutine"], sym_visibility = "private"} {
    %0 = llvm.mlir.constant(3735928559 : index) : i64
    %1 = llvm.mlir.constant(false) : i1
    %2 = llvm.mlir.constant(0 : i64) : i64
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.mlir.constant(0 : i32) : i32
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.mlir.constant(32 : index) : i64
    %7 = llvm.mlir.constant(0 : index) : i64
    %8 = llvm.call @mlirAsyncRuntimeCreateToken() : () -> !llvm.ptr<i8>
    %9 = llvm.mlir.null : !llvm.ptr<i8>
    %10 = llvm.intr.coro.id %4, %9, %9, %9 : !llvm.token
    %11 = llvm.intr.coro.size : i64
    %12 = llvm.intr.coro.align : i64
    %13 = llvm.add %11, %12  : i64
    %14 = llvm.sub %13, %3  : i64
    %15 = llvm.sub %2, %12  : i64
    %16 = llvm.and %14, %15  : i64
    %17 = llvm.call @aligned_alloc(%12, %16) : (i64, i64) -> !llvm.ptr<i8>
    %18 = llvm.intr.coro.begin %10, %17 : !llvm.ptr<i8>
    %19 = llvm.intr.coro.save %18 : !llvm.token
    %20 = llvm.mlir.addressof @__resume : !llvm.ptr<func<void (ptr<i8>)>>
    llvm.call @mlirAsyncRuntimeExecute(%18, %20) : (!llvm.ptr<i8>, !llvm.ptr<func<void (ptr<i8>)>>) -> ()
    %21 = llvm.intr.coro.suspend %19, %1 : i8
    %22 = llvm.sext %21 : i8 to i32
    llvm.switch %22 : i32, ^bb12 [
      0: ^bb1,
      1: ^bb11
    ]
  ^bb1:  // pred: ^bb0
    %23 = llvm.mlir.null : !llvm.ptr<i32>
    %24 = llvm.getelementptr %23[1024] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %25 = llvm.ptrtoint %24 : !llvm.ptr<i32> to i64
    %26 = llvm.call @malloc(%25) : (i64) -> !llvm.ptr<i8>
    %27 = llvm.bitcast %26 : !llvm.ptr<i8> to !llvm.ptr<i32>
    %28 = llvm.call @malloc(%25) : (i64) -> !llvm.ptr<i8>
    %29 = llvm.bitcast %28 : !llvm.ptr<i8> to !llvm.ptr<i32>
    %30 = llvm.call @malloc(%25) : (i64) -> !llvm.ptr<i8>
    %31 = llvm.bitcast %30 : !llvm.ptr<i8> to !llvm.ptr<i32>
    %32 = llvm.mlir.addressof @channel_4 : !llvm.ptr<i64>
    %33 = llvm.inttoptr %0 : i64 to !llvm.ptr<i64>
    llvm.call @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%33, %32, %7, %27, %27, %7, %6, %6, %6, %5, %7, %7, %6, %6, %5, %6) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    %34 = llvm.mlir.addressof @channel_5 : !llvm.ptr<i64>
    llvm.call @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%33, %34, %7, %29, %29, %7, %6, %6, %6, %5, %7, %7, %6, %6, %5, %6) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    %35 = llvm.mlir.addressof @channel_6 : !llvm.ptr<i64>
    llvm.call @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%33, %35, %7, %31, %31, %7, %6, %6, %6, %5, %7, %7, %6, %6, %5, %6) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    llvm.br ^bb2(%7 : i64)
  ^bb2(%36: i64):  // 2 preds: ^bb1, ^bb9
    %37 = llvm.icmp "slt" %36, %6 : i64
    llvm.cond_br %37, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    llvm.br ^bb4(%7 : i64)
  ^bb4(%38: i64):  // 2 preds: ^bb3, ^bb8
    %39 = llvm.icmp "slt" %38, %6 : i64
    llvm.cond_br %39, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%7 : i64)
  ^bb6(%40: i64):  // 2 preds: ^bb5, ^bb7
    %41 = llvm.icmp "slt" %40, %6 : i64
    llvm.cond_br %41, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %42 = llvm.mul %36, %6  : i64
    %43 = llvm.add %42, %40  : i64
    %44 = llvm.getelementptr %27[%43] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %45 = llvm.load %44 : !llvm.ptr<i32>
    %46 = llvm.mul %40, %6  : i64
    %47 = llvm.add %46, %38  : i64
    %48 = llvm.getelementptr %29[%47] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %49 = llvm.load %48 : !llvm.ptr<i32>
    %50 = llvm.add %42, %38  : i64
    %51 = llvm.getelementptr %31[%50] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %52 = llvm.load %51 : !llvm.ptr<i32>
    %53 = llvm.mul %45, %49  : i32
    %54 = llvm.add %52, %53  : i32
    llvm.store %54, %51 : !llvm.ptr<i32>
    %55 = llvm.add %40, %5  : i64
    llvm.br ^bb6(%55 : i64)
  ^bb8:  // pred: ^bb6
    %56 = llvm.add %38, %5  : i64
    llvm.br ^bb4(%56 : i64)
  ^bb9:  // pred: ^bb4
    %57 = llvm.add %36, %5  : i64
    llvm.br ^bb2(%57 : i64)
  ^bb10:  // pred: ^bb2
    %58 = llvm.mlir.addressof @channel_7 : !llvm.ptr<i64>
    llvm.call @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%33, %58, %7, %31, %31, %7, %6, %6, %6, %5, %7, %7, %6, %6, %5, %6) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    llvm.call @free(%26) : (!llvm.ptr<i8>) -> ()
    llvm.call @free(%28) : (!llvm.ptr<i8>) -> ()
    llvm.call @free(%30) : (!llvm.ptr<i8>) -> ()
    llvm.call @mlirAsyncRuntimeEmplaceToken(%8) : (!llvm.ptr<i8>) -> ()
    llvm.br ^bb11
  ^bb11:  // 2 preds: ^bb0, ^bb10
    %59 = llvm.intr.coro.free %10, %18 : !llvm.ptr<i8>
    llvm.call @free(%59) : (!llvm.ptr<i8>) -> ()
    llvm.br ^bb12
  ^bb12:  // 2 preds: ^bb0, ^bb11
    %60 = llvm.intr.coro.end %18, %1 : i1
    llvm.return %8 : !llvm.ptr<i8>
  }
  llvm.func @mlirAsyncRuntimeAddRef(!llvm.ptr<i8>, i64) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeDropRef(!llvm.ptr<i8>, i64) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeCreateToken() -> !llvm.ptr<i8> attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeCreateValue(i64) -> !llvm.ptr<i8> attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeCreateGroup(i64) -> !llvm.ptr<i8> attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeEmplaceToken(!llvm.ptr<i8>) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeEmplaceValue(!llvm.ptr<i8>) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeSetTokenError(!llvm.ptr<i8>) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeSetValueError(!llvm.ptr<i8>) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeIsTokenError(!llvm.ptr<i8>) -> i1 attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeIsValueError(!llvm.ptr<i8>) -> i1 attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeIsGroupError(!llvm.ptr<i8>) -> i1 attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeAwaitToken(!llvm.ptr<i8>) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeAwaitValue(!llvm.ptr<i8>) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeAwaitAllInGroup(!llvm.ptr<i8>) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeExecute(!llvm.ptr<i8>, !llvm.ptr<func<void (ptr<i8>)>>) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeGetValueStorage(!llvm.ptr<i8>) -> !llvm.ptr<i8> attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeAddTokenToGroup(!llvm.ptr<i8>, !llvm.ptr<i8>) -> i64 attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeAwaitTokenAndExecute(!llvm.ptr<i8>, !llvm.ptr<i8>, !llvm.ptr<func<void (ptr<i8>)>>) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeAwaitValueAndExecute(!llvm.ptr<i8>, !llvm.ptr<i8>, !llvm.ptr<func<void (ptr<i8>)>>) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeAwaitAllInGroupAndExecute(!llvm.ptr<i8>, !llvm.ptr<i8>, !llvm.ptr<func<void (ptr<i8>)>>) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimGetNumWorkerThreads() -> i64 attributes {sym_visibility = "private"}
  llvm.func @__resume(%arg0: !llvm.ptr<i8>) attributes {sym_visibility = "private"} {
    llvm.intr.coro.resume %arg0
    llvm.return
  }
}

