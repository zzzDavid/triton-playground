#map = affine_map<()[s0] -> (s0 * 32)>
module attributes {torch.debug_module_name = "model"} {
  memref.global "private" @global_seed : memref<i64> = dense<0>
  func.func @forward(%arg0: memref<128x128xi32>, %arg1: memref<128x128xi32>, %arg2: memref<128x128xi32>, %arg3: memref<128x128xi32>) attributes {llvm.emit_c_interface} {
    %c4 = arith.constant 4 : index
    %c0_i32 = arith.constant 0 : i32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<128x128xi32>
    linalg.fill ins(%c0_i32 : i32) outs(%alloc : memref<128x128xi32>)
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x128xi32>
    memref.copy %alloc, %alloc_0 : memref<128x128xi32> to memref<128x128xi32>
    %token = async.execute {
      %c16 = arith.constant 16 : index
      %0 = async.create_group %c16 : !async.group
      affine.for %arg4 = 0 to 4 {
        affine.for %arg5 = 0 to 4 {
          %token_3 = async.execute {
            %c1 = arith.constant 1 : index
            %c0 = arith.constant 0 : index
            %c128 = arith.constant 128 : index
            %c32 = arith.constant 32 : index
            %2 = affine.apply #map()[%arg4]
            %3 = affine.apply #map()[%arg5]
            scf.for %arg6 = %c0 to %c128 step %c32 {
              %alloc_4 = memref.alloc() : memref<32x32xi32>
              %alloc_5 = memref.alloc() : memref<32x32xi32>
              %alloc_6 = memref.alloc() : memref<32x32xi32>
              %c1_i32 = arith.constant 1 : i32
              %4 = builtin.unrealized_conversion_cast %alloc_4 : memref<32x32xi32> to memref<?x?xi32>
              %5 = builtin.unrealized_conversion_cast %arg0 : memref<128x128xi32> to memref<?x?xi32>
              func.call @air_memcpy_nd_I32_M0D2I32_M0D2I32_I64_I64_I64_I64_I64_I64(%c1_i32, %4, %5, %2, %arg6, %c32, %c32, %c128, %c1) : (i32, memref<?x?xi32>, memref<?x?xi32>, index, index, index, index, index, index) -> ()
              %c2_i32 = arith.constant 2 : i32
              %6 = builtin.unrealized_conversion_cast %alloc_5 : memref<32x32xi32> to memref<?x?xi32>
              %7 = builtin.unrealized_conversion_cast %arg1 : memref<128x128xi32> to memref<?x?xi32>
              func.call @air_memcpy_nd_I32_M0D2I32_M0D2I32_I64_I64_I64_I64_I64_I64(%c2_i32, %6, %7, %arg6, %3, %c32, %c32, %c128, %c1) : (i32, memref<?x?xi32>, memref<?x?xi32>, index, index, index, index, index, index) -> ()
              %c3_i32 = arith.constant 3 : i32
              %8 = builtin.unrealized_conversion_cast %alloc_6 : memref<32x32xi32> to memref<?x?xi32>
              %9 = builtin.unrealized_conversion_cast %alloc_0 : memref<128x128xi32> to memref<?x?xi32>
              func.call @air_memcpy_nd_I32_M0D2I32_M0D2I32_I64_I64_I64_I64_I64_I64(%c3_i32, %8, %9, %2, %3, %c32, %c32, %c128, %c1) : (i32, memref<?x?xi32>, memref<?x?xi32>, index, index, index, index, index, index) -> ()
              linalg.matmul ins(%alloc_4, %alloc_5 : memref<32x32xi32>, memref<32x32xi32>) outs(%alloc_6 : memref<32x32xi32>)
              %c4_i32 = arith.constant 4 : i32
              %10 = builtin.unrealized_conversion_cast %alloc_0 : memref<128x128xi32> to memref<?x?xi32>
              %11 = builtin.unrealized_conversion_cast %alloc_6 : memref<32x32xi32> to memref<?x?xi32>
              func.call @air_memcpy_nd_I32_M0D2I32_I64_I64_I64_I64_I64_I64_M0D2I32(%c4_i32, %10, %2, %3, %c32, %c32, %c128, %c1, %11) : (i32, memref<?x?xi32>, index, index, index, index, index, index, memref<?x?xi32>) -> ()
              memref.dealloc %alloc_4 : memref<32x32xi32>
              memref.dealloc %alloc_5 : memref<32x32xi32>
              memref.dealloc %alloc_6 : memref<32x32xi32>
            }
            async.yield
          }
          %1 = async.add_to_group %token_3, %0 : !async.token
        } {air.herd = "inner"}
      } {air.herd = "outer"}
      async.await_all %0
      async.yield
    }
    async.await %token : !async.token
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<128x128xi32>
    memref.copy %alloc, %alloc_1 : memref<128x128xi32> to memref<128x128xi32>
    %token_2 = async.execute {
      %c16 = arith.constant 16 : index
      %0 = async.create_group %c16 : !async.group
      affine.for %arg4 = 0 to 4 {
        affine.for %arg5 = 0 to 4 {
          %token_3 = async.execute {
            %c1 = arith.constant 1 : index
            %c0 = arith.constant 0 : index
            %c128 = arith.constant 128 : index
            %c32 = arith.constant 32 : index
            %2 = affine.apply #map()[%arg4]
            %3 = affine.apply #map()[%arg5]
            scf.for %arg6 = %c0 to %c128 step %c32 {
              %alloc_4 = memref.alloc() : memref<32x32xi32>
              %alloc_5 = memref.alloc() : memref<32x32xi32>
              %alloc_6 = memref.alloc() : memref<32x32xi32>
              %c5_i32 = arith.constant 5 : i32
              %4 = builtin.unrealized_conversion_cast %alloc_4 : memref<32x32xi32> to memref<?x?xi32>
              %5 = builtin.unrealized_conversion_cast %alloc_0 : memref<128x128xi32> to memref<?x?xi32>
              func.call @air_memcpy_nd_I32_M0D2I32_M0D2I32_I64_I64_I64_I64_I64_I64(%c5_i32, %4, %5, %2, %arg6, %c32, %c32, %c128, %c1) : (i32, memref<?x?xi32>, memref<?x?xi32>, index, index, index, index, index, index) -> ()
              %c6_i32 = arith.constant 6 : i32
              %6 = builtin.unrealized_conversion_cast %alloc_5 : memref<32x32xi32> to memref<?x?xi32>
              %7 = builtin.unrealized_conversion_cast %arg2 : memref<128x128xi32> to memref<?x?xi32>
              func.call @air_memcpy_nd_I32_M0D2I32_M0D2I32_I64_I64_I64_I64_I64_I64(%c6_i32, %6, %7, %arg6, %3, %c32, %c32, %c128, %c1) : (i32, memref<?x?xi32>, memref<?x?xi32>, index, index, index, index, index, index) -> ()
              %c7_i32 = arith.constant 7 : i32
              %8 = builtin.unrealized_conversion_cast %alloc_6 : memref<32x32xi32> to memref<?x?xi32>
              %9 = builtin.unrealized_conversion_cast %alloc_1 : memref<128x128xi32> to memref<?x?xi32>
              func.call @air_memcpy_nd_I32_M0D2I32_M0D2I32_I64_I64_I64_I64_I64_I64(%c7_i32, %8, %9, %2, %3, %c32, %c32, %c128, %c1) : (i32, memref<?x?xi32>, memref<?x?xi32>, index, index, index, index, index, index) -> ()
              linalg.matmul ins(%alloc_4, %alloc_5 : memref<32x32xi32>, memref<32x32xi32>) outs(%alloc_6 : memref<32x32xi32>)
              %c8_i32 = arith.constant 8 : i32
              %10 = builtin.unrealized_conversion_cast %alloc_1 : memref<128x128xi32> to memref<?x?xi32>
              %11 = builtin.unrealized_conversion_cast %alloc_6 : memref<32x32xi32> to memref<?x?xi32>
              func.call @air_memcpy_nd_I32_M0D2I32_I64_I64_I64_I64_I64_I64_M0D2I32(%c8_i32, %10, %2, %3, %c32, %c32, %c128, %c1, %11) : (i32, memref<?x?xi32>, index, index, index, index, index, index, memref<?x?xi32>) -> ()
              memref.dealloc %alloc_4 : memref<32x32xi32>
              memref.dealloc %alloc_5 : memref<32x32xi32>
              memref.dealloc %alloc_6 : memref<32x32xi32>
            }
            async.yield
          }
          %1 = async.add_to_group %token_3, %0 : !async.token
        } {air.herd = "inner"}
      } {air.herd = "outer"}
      async.await_all %0
      async.yield
    }
    async.await %token_2 : !async.token
    memref.copy %alloc_1, %arg3 : memref<128x128xi32> to memref<128x128xi32>
    return
  }
  func.func private @air_memcpy_nd_I32_M0D2I32_M0D2I32_I64_I64_I64_I64_I64_I64(i32, memref<?x?xi32>, memref<?x?xi32>, index, index, index, index, index, index) attributes {llvm.emit_c_interface}
  func.func private @air_memcpy_nd_I32_M0D2I32_I64_I64_I64_I64_I64_I64_M0D2I32(i32, memref<?x?xi32>, index, index, index, index, index, index, memref<?x?xi32>) attributes {llvm.emit_c_interface}
}

