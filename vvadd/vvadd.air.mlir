#map = affine_map<()[s0] -> (s0 * 64)>
module {
  func.func @vector_add(%arg0: memref<256xf32>, %arg1: memref<256xf32>) -> memref<256xf32> {
    %c0_i32 = arith.constant 0 : i32
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc() : memref<256xf32>
    linalg.fill ins(%c0_i32 : i32) outs(%alloc : memref<256xf32>)
    air.herd @herd_0 tile (%arg3, %arg4) in (%arg5=%c4, %arg6=%c1) args(%arg7=%arg0, %arg8=%arg1, %arg9=%alloc) : memref<256xf32>, memref<256xf32>, memref<256xf32> {
      %c0 = arith.constant 0 : index
      %c1_2 = arith.constant 1 : index
      %c64 = arith.constant 64 : index
      %c256 = arith.constant 256 : index
      %arg10 = affine.apply #map()[%arg3]
      %alloc_2 = memref.alloc() : memref<64xf32>
      %alloc_3 = memref.alloc() : memref<64xf32>
      %alloc_4 = memref.alloc() : memref<64xf32>
      air.dma_memcpy_nd (%alloc_2[] [] [], %arg7[%arg10] [%c64] [%c256]) {id = 1 : i32} : (memref<64xf32>, memref<256xf32>)
      air.dma_memcpy_nd (%alloc_3[] [] [], %arg8[%arg10] [%c64] [%c256]) {id = 2 : i32} : (memref<64xf32>, memref<256xf32>)
      scf.for %arg11 = %c0 to %c64 step %c1_2 {
        %2 = memref.load %alloc_2[%arg11] : memref<64xf32>
        %3 = memref.load %alloc_3[%arg11] : memref<64xf32>
        %4 = arith.addf %2, %3 : f32
        memref.store %4, %alloc_4[%arg11] : memref<64xf32>
      }
      air.dma_memcpy_nd (%arg9[%arg10] [%c64] [%c256], %alloc_4[] [] []) {id = 3 : i32} : (memref<256xf32>, memref<64xf32>)
      memref.dealloc %alloc_2 : memref<64xf32>
      memref.dealloc %alloc_3 : memref<64xf32>
      memref.dealloc %alloc_4 : memref<64xf32>
      air.herd_terminator
    }
    return %alloc : memref<256xf32>
  }
}