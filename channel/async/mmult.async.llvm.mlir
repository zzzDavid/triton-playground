module attributes {llvm.data_layout = ""} {
  llvm.mlir.global private constant @assert_msg_1(dense<[65, 119, 97, 105, 116, 101, 100, 32, 97, 115, 121, 110, 99, 32, 111, 112, 101, 114, 97, 110, 100, 32, 105, 115, 32, 105, 110, 32, 101, 114, 114, 111, 114, 32, 115, 116, 97, 116, 101, 0]> : tensor<40xi8>) {addr_space = 0 : i32} : !llvm.array<40 x i8>
  llvm.func @abort()
  llvm.func @puts(!llvm.ptr<i8>)
  llvm.mlir.global private constant @assert_msg_0(dense<[65, 119, 97, 105, 116, 101, 100, 32, 97, 115, 121, 110, 99, 32, 111, 112, 101, 114, 97, 110, 100, 32, 105, 115, 32, 105, 110, 32, 101, 114, 114, 111, 114, 32, 115, 116, 97, 116, 101, 0]> : tensor<40xi8>) {addr_space = 0 : i32} : !llvm.array<40 x i8>
  llvm.func @malloc(i64) -> !llvm.ptr<i8>
  llvm.func @free(!llvm.ptr<i8>)
  llvm.func @aligned_alloc(i64, i64) -> !llvm.ptr<i8>
  llvm.mlir.global private @channel_0(0 : i64) {addr_space = 0 : i32} : i64
  llvm.func @forward(%arg0: !llvm.ptr<i32>, %arg1: !llvm.ptr<i32>, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: i64) attributes {llvm.emit_c_interface} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(true) : i1
    %2 = llvm.call @async_execute_fn() : () -> !llvm.ptr<i8>
    %3 = llvm.call @async_execute_fn_0(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8) : (!llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64) -> !llvm.ptr<i8>
    llvm.call @mlirAsyncRuntimeAwaitToken(%2) : (!llvm.ptr<i8>) -> ()
    %4 = llvm.call @mlirAsyncRuntimeIsTokenError(%2) : (!llvm.ptr<i8>) -> i1
    llvm.call @mlirAsyncRuntimeDropRef(%2, %0) : (!llvm.ptr<i8>, i64) -> ()
    %5 = llvm.xor %4, %1  : i1
    llvm.cond_br %5, ^bb1, ^bb3
  ^bb1:  // pred: ^bb0
    llvm.call @mlirAsyncRuntimeAwaitToken(%3) : (!llvm.ptr<i8>) -> ()
    %6 = llvm.call @mlirAsyncRuntimeIsTokenError(%3) : (!llvm.ptr<i8>) -> i1
    llvm.call @mlirAsyncRuntimeDropRef(%3, %0) : (!llvm.ptr<i8>, i64) -> ()
    %7 = llvm.xor %6, %1  : i1
    llvm.cond_br %7, ^bb2, ^bb4
  ^bb2:  // pred: ^bb1
    llvm.return
  ^bb3:  // pred: ^bb0
    %8 = llvm.mlir.addressof @assert_msg_0 : !llvm.ptr<array<40 x i8>>
    %9 = llvm.getelementptr %8[0] : (!llvm.ptr<array<40 x i8>>) -> !llvm.ptr<i8>
    llvm.call @puts(%9) : (!llvm.ptr<i8>) -> ()
    llvm.call @abort() : () -> ()
    llvm.unreachable
  ^bb4:  // pred: ^bb1
    %10 = llvm.mlir.addressof @assert_msg_1 : !llvm.ptr<array<40 x i8>>
    %11 = llvm.getelementptr %10[0] : (!llvm.ptr<array<40 x i8>>) -> !llvm.ptr<i8>
    llvm.call @puts(%11) : (!llvm.ptr<i8>) -> ()
    llvm.call @abort() : () -> ()
    llvm.unreachable
  }
  llvm.func @_mlir_ciface_forward(%arg0: !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<3 x i64>, array<3 x i64>)>>) attributes {llvm.emit_c_interface} {
    %0 = llvm.load %arg0 : !llvm.ptr<struct<(ptr<i32>, ptr<i32>, i64, array<3 x i64>, array<3 x i64>)>>
    %1 = llvm.extractvalue %0[0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<3 x i64>, array<3 x i64>)> 
    %2 = llvm.extractvalue %0[1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<3 x i64>, array<3 x i64>)> 
    %3 = llvm.extractvalue %0[2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<3 x i64>, array<3 x i64>)> 
    %4 = llvm.extractvalue %0[3, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<3 x i64>, array<3 x i64>)> 
    %5 = llvm.extractvalue %0[3, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<3 x i64>, array<3 x i64>)> 
    %6 = llvm.extractvalue %0[3, 2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<3 x i64>, array<3 x i64>)> 
    %7 = llvm.extractvalue %0[4, 0] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<3 x i64>, array<3 x i64>)> 
    %8 = llvm.extractvalue %0[4, 1] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<3 x i64>, array<3 x i64>)> 
    %9 = llvm.extractvalue %0[4, 2] : !llvm.struct<(ptr<i32>, ptr<i32>, i64, array<3 x i64>, array<3 x i64>)> 
    llvm.call @forward(%1, %2, %3, %4, %5, %6, %7, %8, %9) : (!llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64) -> ()
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
    llvm.br ^bb2(%7 : i64)
  ^bb2(%23: i64):  // 2 preds: ^bb1, ^bb9
    %24 = llvm.icmp "slt" %23, %6 : i64
    llvm.cond_br %24, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    %25 = llvm.mlir.null : !llvm.ptr<i32>
    %26 = llvm.getelementptr %25[1024] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %27 = llvm.ptrtoint %26 : !llvm.ptr<i32> to i64
    %28 = llvm.call @malloc(%27) : (i64) -> !llvm.ptr<i8>
    %29 = llvm.bitcast %28 : !llvm.ptr<i8> to !llvm.ptr<i32>
    %30 = llvm.trunc %23 : i64 to i32
    llvm.br ^bb4(%7 : i64)
  ^bb4(%31: i64):  // 2 preds: ^bb3, ^bb8
    %32 = llvm.icmp "slt" %31, %6 : i64
    llvm.cond_br %32, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%7 : i64)
  ^bb6(%33: i64):  // 2 preds: ^bb5, ^bb7
    %34 = llvm.icmp "slt" %33, %6 : i64
    llvm.cond_br %34, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %35 = llvm.mul %31, %6  : i64
    %36 = llvm.add %35, %33  : i64
    %37 = llvm.getelementptr %29[%36] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    llvm.store %30, %37 : !llvm.ptr<i32>
    %38 = llvm.add %33, %5  : i64
    llvm.br ^bb6(%38 : i64)
  ^bb8:  // pred: ^bb6
    %39 = llvm.add %31, %5  : i64
    llvm.br ^bb4(%39 : i64)
  ^bb9:  // pred: ^bb4
    %40 = llvm.mlir.addressof @channel_0 : !llvm.ptr<i64>
    %41 = llvm.inttoptr %0 : i64 to !llvm.ptr<i64>
    llvm.call @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%41, %40, %7, %29, %29, %7, %6, %6, %6, %5, %7, %7, %6, %6, %5, %6) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    llvm.call @free(%28) : (!llvm.ptr<i8>) -> ()
    %42 = llvm.add %23, %5  : i64
    llvm.br ^bb2(%42 : i64)
  ^bb10:  // pred: ^bb2
    llvm.call @mlirAsyncRuntimeEmplaceToken(%8) : (!llvm.ptr<i8>) -> ()
    llvm.br ^bb11
  ^bb11:  // 2 preds: ^bb0, ^bb10
    %43 = llvm.intr.coro.free %10, %18 : !llvm.ptr<i8>
    llvm.call @free(%43) : (!llvm.ptr<i8>) -> ()
    llvm.br ^bb12
  ^bb12:  // 2 preds: ^bb0, ^bb11
    %44 = llvm.intr.coro.end %18, %1 : i1
    llvm.return %8 : !llvm.ptr<i8>
  }
  llvm.func @async_execute_fn_0(%arg0: !llvm.ptr<i32>, %arg1: !llvm.ptr<i32>, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: i64) -> !llvm.ptr<i8> attributes {passthrough = ["presplitcoroutine"], sym_visibility = "private"} {
    %0 = llvm.mlir.constant(3735928559 : index) : i64
    %1 = llvm.mlir.constant(1024 : index) : i64
    %2 = llvm.mlir.constant(false) : i1
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.mlir.constant(0 : i32) : i32
    %6 = llvm.mlir.constant(0 : index) : i64
    %7 = llvm.mlir.constant(32 : index) : i64
    %8 = llvm.mlir.constant(1 : index) : i64
    %9 = llvm.call @mlirAsyncRuntimeCreateToken() : () -> !llvm.ptr<i8>
    %10 = llvm.mlir.null : !llvm.ptr<i8>
    %11 = llvm.intr.coro.id %5, %10, %10, %10 : !llvm.token
    %12 = llvm.intr.coro.size : i64
    %13 = llvm.intr.coro.align : i64
    %14 = llvm.add %12, %13  : i64
    %15 = llvm.sub %14, %4  : i64
    %16 = llvm.sub %3, %13  : i64
    %17 = llvm.and %15, %16  : i64
    %18 = llvm.call @aligned_alloc(%13, %17) : (i64, i64) -> !llvm.ptr<i8>
    %19 = llvm.intr.coro.begin %11, %18 : !llvm.ptr<i8>
    %20 = llvm.intr.coro.save %19 : !llvm.token
    %21 = llvm.mlir.addressof @__resume : !llvm.ptr<func<void (ptr<i8>)>>
    llvm.call @mlirAsyncRuntimeExecute(%19, %21) : (!llvm.ptr<i8>, !llvm.ptr<func<void (ptr<i8>)>>) -> ()
    %22 = llvm.intr.coro.suspend %20, %2 : i8
    %23 = llvm.sext %22 : i8 to i32
    llvm.switch %23 : i32, ^bb12 [
      0: ^bb1,
      1: ^bb11
    ]
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2(%6 : i64)
  ^bb2(%24: i64):  // 2 preds: ^bb1, ^bb9
    %25 = llvm.icmp "slt" %24, %7 : i64
    llvm.cond_br %25, ^bb3, ^bb10
  ^bb3:  // pred: ^bb2
    %26 = llvm.mlir.null : !llvm.ptr<i32>
    %27 = llvm.getelementptr %26[1024] : (!llvm.ptr<i32>) -> !llvm.ptr<i32>
    %28 = llvm.ptrtoint %27 : !llvm.ptr<i32> to i64
    %29 = llvm.call @malloc(%28) : (i64) -> !llvm.ptr<i8>
    %30 = llvm.bitcast %29 : !llvm.ptr<i8> to !llvm.ptr<i32>
    %31 = llvm.mlir.addressof @channel_0 : !llvm.ptr<i64>
    %32 = llvm.inttoptr %0 : i64 to !llvm.ptr<i64>
    llvm.call @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%32, %31, %6, %30, %30, %6, %7, %7, %7, %8, %6, %6, %7, %7, %8, %7) : (!llvm.ptr<i64>, !llvm.ptr<i64>, i64, !llvm.ptr<i32>, !llvm.ptr<i32>, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64) -> ()
    llvm.br ^bb4(%6 : i64)
  ^bb4(%33: i64):  // 2 preds: ^bb3, ^bb8
    %34 = llvm.icmp "slt" %33, %7 : i64
    llvm.cond_br %34, ^bb5, ^bb9
  ^bb5:  // pred: ^bb4
    llvm.br ^bb6(%6 : i64)
  ^bb6(%35: i64):  // 2 preds: ^bb5, ^bb7
    %36 = llvm.icmp "slt" %35, %7 : i64
    llvm.cond_br %36, ^bb7, ^bb8
  ^bb7:  // pred: ^bb6
    %37 = llvm.mul %33, %7  : i64
    %38 = llvm.add %37, %35  : i64
    %39 = llvm.getelementptr %30[%38] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    %40 = llvm.load %39 : !llvm.ptr<i32>
    %41 = llvm.mul %24, %1  : i64
    %42 = llvm.add %41, %37  : i64
    %43 = llvm.add %42, %35  : i64
    %44 = llvm.getelementptr %arg1[%43] : (!llvm.ptr<i32>, i64) -> !llvm.ptr<i32>
    llvm.store %40, %44 : !llvm.ptr<i32>
    %45 = llvm.add %35, %8  : i64
    llvm.br ^bb6(%45 : i64)
  ^bb8:  // pred: ^bb6
    %46 = llvm.add %33, %8  : i64
    llvm.br ^bb4(%46 : i64)
  ^bb9:  // pred: ^bb4
    llvm.call @free(%29) : (!llvm.ptr<i8>) -> ()
    %47 = llvm.add %24, %8  : i64
    llvm.br ^bb2(%47 : i64)
  ^bb10:  // pred: ^bb2
    llvm.call @mlirAsyncRuntimeEmplaceToken(%9) : (!llvm.ptr<i8>) -> ()
    llvm.br ^bb11
  ^bb11:  // 2 preds: ^bb0, ^bb10
    %48 = llvm.intr.coro.free %11, %19 : !llvm.ptr<i8>
    llvm.call @free(%48) : (!llvm.ptr<i8>) -> ()
    llvm.br ^bb12
  ^bb12:  // 2 preds: ^bb0, ^bb11
    %49 = llvm.intr.coro.end %19, %2 : i1
    llvm.return %9 : !llvm.ptr<i8>
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

