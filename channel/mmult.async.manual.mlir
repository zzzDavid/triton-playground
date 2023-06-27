module attributes {torch.debug_module_name = "model"} {
  memref.global "private" @channel_7 : memref<i64> = dense<0>
  memref.global "private" @channel_6 : memref<i64> = dense<0>
  memref.global "private" @channel_5 : memref<i64> = dense<0>
  memref.global "private" @channel_4 : memref<i64> = dense<0>
  memref.global "private" @channel_3 : memref<i64> = dense<0>
  memref.global "private" @channel_2 : memref<i64> = dense<0>
  memref.global "private" @channel_1 : memref<i64> = dense<0>
  memref.global "private" @channel_0 : memref<i64> = dense<0>
  memref.global "private" @global_seed : memref<i64> = dense<0>
  func.func @forward(%arg0: memref<32x32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32x32xi32>, %arg3: memref<32x32xi32>) attributes {llvm.emit_c_interface} {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c0_i32 = arith.constant 0 : i32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x32xi32>
    linalg.fill ins(%c0_i32 : i32) outs(%alloc : memref<32x32xi32>)
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<32x32xi32>
    memref.copy %alloc, %alloc_0 : memref<32x32xi32> to memref<32x32xi32>
    %0 = memref.get_global @channel_0 : memref<i64>
    %1 = builtin.unrealized_conversion_cast %0 : memref<i64> to memref<i64>
    %2 = builtin.unrealized_conversion_cast %arg0 : memref<32x32xi32> to memref<?x?xi32>
    call @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%1, %2, %c0, %c0, %c32, %c32, %c32, %c1) : (memref<i64>, memref<?x?xi32>, index, index, index, index, index, index) -> ()
    %3 = memref.get_global @channel_1 : memref<i64>
    %4 = builtin.unrealized_conversion_cast %3 : memref<i64> to memref<i64>
    %5 = builtin.unrealized_conversion_cast %arg1 : memref<32x32xi32> to memref<?x?xi32>
    call @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%4, %5, %c0, %c0, %c32, %c32, %c32, %c1) : (memref<i64>,  memref<?x?xi32>, index, index, index, index, index, index) -> ()
    %6 = memref.get_global @channel_2 : memref<i64>
    %7 = builtin.unrealized_conversion_cast %6 : memref<i64> to memref<i64>
    %8 = builtin.unrealized_conversion_cast %alloc_0 : memref<32x32xi32> to memref<?x?xi32>
    call @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%7, %8, %c0, %c0, %c32, %c32, %c32, %c1) : (memref<i64>,  memref<?x?xi32>, index, index, index, index, index, index) -> ()
    %9 = memref.get_global @channel_3 : memref<i64>
    %10 = builtin.unrealized_conversion_cast %9 : memref<i64> to memref<i64>
    %11 = builtin.unrealized_conversion_cast %alloc_0 : memref<32x32xi32> to memref<?x?xi32>
    call @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%10, %11, %c0, %c0, %c32, %c32, %c32, %c1) : (memref<i64>,  memref<?x?xi32>, index, index, index, index, index, index) -> ()
    %token = async.execute {
      %alloc_2 = memref.alloc() : memref<32x32xi32>
      %alloc_3 = memref.alloc() : memref<32x32xi32>
      %alloc_4 = memref.alloc() : memref<32x32xi32>
      %24 = memref.get_global @channel_0 : memref<i64>
      %25 = builtin.unrealized_conversion_cast %24 : memref<i64> to memref<i64>
      %26 = builtin.unrealized_conversion_cast %alloc_2 : memref<32x32xi32> to memref<?x?xi32>
      func.call @air_channel_get_M0I64_M0D2I32(%25, %26) : (memref<i64>,  memref<?x?xi32>) -> ()
      %27 = memref.get_global @channel_1 : memref<i64>
      %28 = builtin.unrealized_conversion_cast %27 : memref<i64> to memref<i64>
      %29 = builtin.unrealized_conversion_cast %alloc_3 : memref<32x32xi32> to memref<?x?xi32>
      func.call @air_channel_get_M0I64_M0D2I32(%28, %29) : (memref<i64>,  memref<?x?xi32>) -> ()
      %30 = memref.get_global @channel_2 : memref<i64>
      %31 = builtin.unrealized_conversion_cast %30 : memref<i64> to memref<i64>
      %32 = builtin.unrealized_conversion_cast %alloc_4 : memref<32x32xi32> to memref<?x?xi32>
      func.call @air_channel_get_M0I64_M0D2I32(%31, %32) : (memref<i64>,  memref<?x?xi32>) -> ()
      linalg.matmul ins(%alloc_2, %alloc_3 : memref<32x32xi32>, memref<32x32xi32>) outs(%alloc_4 : memref<32x32xi32>)
      %33 = memref.get_global @channel_3 : memref<i64>
      %34 = builtin.unrealized_conversion_cast %33 : memref<i64> to memref<i64>
      %35 = builtin.unrealized_conversion_cast %alloc_4 : memref<32x32xi32> to memref<?x?xi32>
      func.call @air_channel_put_M0I64_M0D2I32(%34, %35) : (memref<i64>, memref<?x?xi32>) -> ()
      memref.dealloc %alloc_2 : memref<32x32xi32>
      memref.dealloc %alloc_3 : memref<32x32xi32>
      memref.dealloc %alloc_4 : memref<32x32xi32>
      async.yield
    }
    async.await %token : !async.token
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x32xi32>
    memref.copy %alloc, %alloc_1 : memref<32x32xi32> to memref<32x32xi32>
    %12 = memref.get_global @channel_4 : memref<i64>
    %13 = builtin.unrealized_conversion_cast %12 : memref<i64> to memref<i64>
    %14 = builtin.unrealized_conversion_cast %alloc_0 : memref<32x32xi32> to memref<?x?xi32>
    call @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%13, %14, %c0, %c0, %c32, %c32, %c32, %c1) : (memref<i64>,  memref<?x?xi32>, index, index, index, index, index, index) -> ()
    %15 = memref.get_global @channel_5 : memref<i64>
    %16 = builtin.unrealized_conversion_cast %15 : memref<i64> to memref<i64>
    %17 = builtin.unrealized_conversion_cast %arg2 : memref<32x32xi32> to memref<?x?xi32>
    call @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%16, %17, %c0, %c0, %c32, %c32, %c32, %c1) : (memref<i64>, memref<?x?xi32>, index, index, index, index, index, index) -> ()
    %18 = memref.get_global @channel_6 : memref<i64>
    %19 = builtin.unrealized_conversion_cast %18 : memref<i64> to memref<i64>
    %20 = builtin.unrealized_conversion_cast %alloc_1 : memref<32x32xi32> to memref<?x?xi32>
    call @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%19, %20, %c0, %c0, %c32, %c32, %c32, %c1) : (memref<i64>, memref<?x?xi32>, index, index, index, index, index, index) -> ()
    %21 = memref.get_global @channel_7 : memref<i64>
    %22 = builtin.unrealized_conversion_cast %21 : memref<i64> to memref<i64>
    %23 = builtin.unrealized_conversion_cast %alloc_1 : memref<32x32xi32> to memref<?x?xi32>
    call @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(%22, %23, %c0, %c0, %c32, %c32, %c32, %c1) : (memref<i64>, memref<?x?xi32>, index, index, index, index, index, index) -> ()
    %token_0 = async.execute {
      %alloc_2 = memref.alloc() : memref<32x32xi32>
      %alloc_3 = memref.alloc() : memref<32x32xi32>
      %alloc_4 = memref.alloc() : memref<32x32xi32>
      %24 = memref.get_global @channel_4 : memref<i64>
      %25 = builtin.unrealized_conversion_cast %24 : memref<i64> to memref<i64>
      %26 = builtin.unrealized_conversion_cast %alloc_2 : memref<32x32xi32> to memref<?x?xi32>
      func.call @air_channel_get_M0I64_M0D2I32(%25, %26) : (memref<i64>,  memref<?x?xi32>) -> ()
      %27 = memref.get_global @channel_5 : memref<i64>
      %28 = builtin.unrealized_conversion_cast %27 : memref<i64> to memref<i64>
      %29 = builtin.unrealized_conversion_cast %alloc_3 : memref<32x32xi32> to memref<?x?xi32>
      func.call @air_channel_get_M0I64_M0D2I32(%28,  %29) : (memref<i64>, memref<?x?xi32>) -> ()
      %30 = memref.get_global @channel_6 : memref<i64>
      %31 = builtin.unrealized_conversion_cast %30 : memref<i64> to memref<i64>
      %32 = builtin.unrealized_conversion_cast %alloc_4 : memref<32x32xi32> to memref<?x?xi32>
      func.call @air_channel_get_M0I64_M0D2I32(%31,  %32) : (memref<i64>,  memref<?x?xi32>) -> ()
      linalg.matmul ins(%alloc_2, %alloc_3 : memref<32x32xi32>, memref<32x32xi32>) outs(%alloc_4 : memref<32x32xi32>)
      %33 = memref.get_global @channel_7 : memref<i64>
      %34 = builtin.unrealized_conversion_cast %33 : memref<i64> to memref<i64>
      %35 = builtin.unrealized_conversion_cast %alloc_4 : memref<32x32xi32> to memref<?x?xi32>
      func.call @air_channel_put_M0I64_M0D2I32(%34, %35) : (memref<i64>,  memref<?x?xi32>) -> ()
      memref.dealloc %alloc_2 : memref<32x32xi32>
      memref.dealloc %alloc_3 : memref<32x32xi32>
      memref.dealloc %alloc_4 : memref<32x32xi32>
      async.yield
    }
    async.await %token_0 : !async.token
    memref.copy %alloc_1, %arg3 : memref<32x32xi32> to memref<32x32xi32>
    return
  }
  func.func private @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(memref<i64>, memref<?x?xi32>, index, index, index, index, index, index) attributes {llvm.emit_c_interface}
  func.func private @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(memref<i64>, memref<?x?xi32>, index, index, index, index, index, index) attributes {llvm.emit_c_interface}
  func.func private @air_channel_get_M0I64_M0D2I32(memref<i64>, memref<?x?xi32>) attributes {llvm.emit_c_interface}
  func.func private @air_channel_put_M0I64_M0D2I32(memref<i64>, memref<?x?xi32>) attributes {llvm.emit_c_interface}
}

