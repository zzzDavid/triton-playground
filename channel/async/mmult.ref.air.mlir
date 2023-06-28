#map = affine_map<()[s0] -> (s0 * 32)>
module attributes {torch.debug_module_name = "model"} {
  memref.global "private" @global_seed : memref<i64> = dense<0>
  func.func @forward(%arg0: memref<128x128xi32>, %arg1: memref<128x128xi32>, %arg2: memref<128x128xi32>, %arg3: memref<128x128xi32>) {
    %c4 = arith.constant 4 : index
    %c0_i32 = arith.constant 0 : i32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<128x128xi32>
    linalg.fill ins(%c0_i32 : i32) outs(%alloc : memref<128x128xi32>)
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<128x128xi32>
    memref.copy %alloc, %alloc_0 : memref<128x128xi32> to memref<128x128xi32>
    air.herd @herd_0  tile (%arg4, %arg5) in (%arg6=%c4, %arg7=%c4) args(%arg8=%arg0, %arg9=%arg1, %arg10=%alloc_0) : memref<128x128xi32>, memref<128x128xi32>, memref<128x128xi32> {
      %c1 = arith.constant 1 : index
      %c0 = arith.constant 0 : index
      %c128 = arith.constant 128 : index
      %c32 = arith.constant 32 : index
      %0 = affine.apply #map()[%arg4]
      %1 = affine.apply #map()[%arg5]
      scf.for %arg11 = %c0 to %c128 step %c32 {
        %alloc_2 = memref.alloc() : memref<32x32xi32, 2>
        %alloc_3 = memref.alloc() : memref<32x32xi32, 2>
        %alloc_4 = memref.alloc() : memref<32x32xi32, 2>
        air.dma_memcpy_nd (%alloc_2[] [] [], %arg8[%0, %arg11] [%c32, %c32] [%c128, %c1]) {id = 1 : i32} : (memref<32x32xi32, 2>, memref<128x128xi32>)
        air.dma_memcpy_nd (%alloc_3[] [] [], %arg9[%arg11, %1] [%c32, %c32] [%c128, %c1]) {id = 2 : i32} : (memref<32x32xi32, 2>, memref<128x128xi32>)
        air.dma_memcpy_nd (%alloc_4[] [] [], %arg10[%0, %1] [%c32, %c32] [%c128, %c1]) {id = 3 : i32} : (memref<32x32xi32, 2>, memref<128x128xi32>)
        linalg.matmul ins(%alloc_2, %alloc_3 : memref<32x32xi32, 2>, memref<32x32xi32, 2>) outs(%alloc_4 : memref<32x32xi32, 2>)
        air.dma_memcpy_nd (%arg10[%0, %1] [%c32, %c32] [%c128, %c1], %alloc_4[] [] []) {id = 4 : i32} : (memref<128x128xi32>, memref<32x32xi32, 2>)
        memref.dealloc %alloc_2 : memref<32x32xi32, 2>
        memref.dealloc %alloc_3 : memref<32x32xi32, 2>
        memref.dealloc %alloc_4 : memref<32x32xi32, 2>
      }
      air.herd_terminator
    }
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<128x128xi32>
    memref.copy %alloc, %alloc_1 : memref<128x128xi32> to memref<128x128xi32>
    air.herd @herd_1  tile (%arg4, %arg5) in (%arg6=%c4, %arg7=%c4) args(%arg8=%alloc_0, %arg9=%arg2, %arg10=%alloc_1) : memref<128x128xi32>, memref<128x128xi32>, memref<128x128xi32> {
      %c1 = arith.constant 1 : index
      %c0 = arith.constant 0 : index
      %c128 = arith.constant 128 : index
      %c32 = arith.constant 32 : index
      %0 = affine.apply #map()[%arg4]
      %1 = affine.apply #map()[%arg5]
      scf.for %arg11 = %c0 to %c128 step %c32 {
        %alloc_2 = memref.alloc() : memref<32x32xi32, 2>
        %alloc_3 = memref.alloc() : memref<32x32xi32, 2>
        %alloc_4 = memref.alloc() : memref<32x32xi32, 2>
        air.dma_memcpy_nd (%alloc_2[] [] [], %arg8[%0, %arg11] [%c32, %c32] [%c128, %c1]) {id = 5 : i32} : (memref<32x32xi32, 2>, memref<128x128xi32>)
        air.dma_memcpy_nd (%alloc_3[] [] [], %arg9[%arg11, %1] [%c32, %c32] [%c128, %c1]) {id = 6 : i32} : (memref<32x32xi32, 2>, memref<128x128xi32>)
        air.dma_memcpy_nd (%alloc_4[] [] [], %arg10[%0, %1] [%c32, %c32] [%c128, %c1]) {id = 7 : i32} : (memref<32x32xi32, 2>, memref<128x128xi32>)
        linalg.matmul ins(%alloc_2, %alloc_3 : memref<32x32xi32, 2>, memref<32x32xi32, 2>) outs(%alloc_4 : memref<32x32xi32, 2>)
        air.dma_memcpy_nd (%arg10[%0, %1] [%c32, %c32] [%c128, %c1], %alloc_4[] [] []) {id = 8 : i32} : (memref<128x128xi32>, memref<32x32xi32, 2>)
        memref.dealloc %alloc_2 : memref<32x32xi32, 2>
        memref.dealloc %alloc_3 : memref<32x32xi32, 2>
        memref.dealloc %alloc_4 : memref<32x32xi32, 2>
      }
      air.herd_terminator
    }
    memref.copy %alloc_1, %arg3 : memref<128x128xi32> to memref<128x128xi32>
    return
  }
}

