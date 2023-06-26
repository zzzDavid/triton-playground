#map = affine_map<()[s0] -> (s0 * 32)>
#map1 = affine_map<()[s0] -> (s0 * 64)>
#map2 = affine_map<()[s0] -> (s0 * 128)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @matmul_kernel_0123456789101112131415(%arg0: memref<*xbf16>, %arg1: memref<*xbf16>, %arg2: memref<*xbf16>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32, %arg12: i32, %arg13: i32, %arg14: i32) {
    %c2 = arith.constant 2 : index
    %c8 = arith.constant 8 : index
    %c4 = arith.constant 4 : index
    %c256 = arith.constant 256 : index
    %c128 = arith.constant 128 : index
    %c8_i32 = arith.constant 8 : i32
    %c128_i32 = arith.constant 128 : i32
    %c256_i32 = arith.constant 256 : i32
    %c64_i32 = arith.constant 64 : i32
    %c127_i32 = arith.constant 127 : i32
    %c255_i32 = arith.constant 255 : i32
    %c63_i32 = arith.constant 63 : i32
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32>
    linalg.fill ins(%cst : f32) outs(%alloc : memref<128x256xf32>)
    %0 = arith.addi %arg3, %c127_i32 : i32
    %1 = arith.divsi %0, %c128_i32 : i32
    %2 = arith.addi %arg4, %c255_i32 : i32
    %3 = arith.divsi %2, %c256_i32 : i32
    %4 = arith.addi %arg5, %c63_i32 : i32
    %5 = arith.divsi %4, %c64_i32 : i32
    %6 = arith.muli %3, %c8_i32 : i32
    %7 = arith.divsi %arg12, %6 : i32
    %8 = arith.muli %7, %c8_i32 : i32
    %9 = arith.subi %1, %8 : i32
    %10 = arith.cmpi slt, %9, %c8_i32 : i32
    %11 = arith.select %10, %9, %c8_i32 : i32
    %12 = arith.remsi %arg12, %11 : i32
    %13 = arith.addi %8, %12 : i32
    %14 = arith.remsi %arg12, %6 : i32
    %15 = arith.divsi %14, %11 : i32
    %16 = arith.muli %13, %c128_i32 : i32
    %17 = arith.muli %15, %c256_i32 : i32
    %18 = arith.index_cast %16 : i32 to index
    %19 = arith.index_cast %arg6 : i32 to index
    %20 = arith.muli %18, %19 : index
    %21 = arith.index_cast %arg7 : i32 to index
    %22 = arith.index_cast %arg8 : i32 to index
    %23 = arith.index_cast %17 : i32 to index
    %24 = arith.index_cast %arg9 : i32 to index
    %25 = arith.muli %23, %24 : index
    %26 = arith.muli %arg7, %c64_i32 : i32
    %27 = arith.muli %arg8, %c64_i32 : i32
    %28 = arith.index_cast %5 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%20], sizes: [128, 64], strides: [%19, %21] : memref<*xbf16> to memref<128x64xbf16, strided<[?, ?], offset: ?>>
    %reinterpret_cast_0 = memref.reinterpret_cast %arg1 to offset: [%25], sizes: [64, 256], strides: [%22, %24] : memref<*xbf16> to memref<64x256xbf16, strided<[?, ?], offset: ?>>
    %29:7 = scf.for %arg15 = %c0 to %28 step %c1 iter_args(%arg16 = %alloc, %arg17 = %reinterpret_cast, %arg18 = %reinterpret_cast_0, %arg19 = %20, %arg20 = %c0, %arg21 = %25, %arg22 = %c0) -> (memref<128x256xf32>, memref<128x64xbf16, strided<[?, ?], offset: ?>>, memref<64x256xbf16, strided<[?, ?], offset: ?>>, index, index, index, index) {
      %alloc_4 = memref.alloc() : memref<128x64xbf16>
      memref.copy %arg17, %alloc_4 : memref<128x64xbf16, strided<[?, ?], offset: ?>> to memref<128x64xbf16>
      %alloc_5 = memref.alloc() : memref<64x256xbf16>
      memref.copy %arg18, %alloc_5 : memref<64x256xbf16, strided<[?, ?], offset: ?>> to memref<64x256xbf16>
      %alloc_6 = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32>
      %alloc_7 = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32>
      memref.copy %alloc_6, %alloc_7 : memref<128x256xf32> to memref<128x256xf32>
      air.herd @herd_0  tile (%arg23, %arg24) in (%arg25=%c4, %arg26=%c8) args(%arg27=%alloc_4, %arg28=%alloc_5, %arg29=%alloc_7) : memref<128x64xbf16>, memref<64x256xbf16>, memref<128x256xf32> {
        %c256_12 = arith.constant 256 : index
        %c1_13 = arith.constant 1 : index
        %c0_14 = arith.constant 0 : index
        %c64 = arith.constant 64 : index
        %c32 = arith.constant 32 : index
        %51 = affine.apply #map()[%arg23]
        %52 = affine.apply #map()[%arg24]
        scf.for %arg30 = %c0_14 to %c64 step %c32 {
          %alloc_15 = memref.alloc() : memref<32x32xbf16, 2>
          %alloc_16 = memref.alloc() : memref<32x32xbf16, 2>
          %alloc_17 = memref.alloc() : memref<32x32xf32, 2>
          air.dma_memcpy_nd (%alloc_15[] [] [], %arg27[%51, %arg30] [%c32, %c32] [%c64, %c1_13]) {id = 1 : i32} : (memref<32x32xbf16, 2>, memref<128x64xbf16>)
          air.dma_memcpy_nd (%alloc_16[] [] [], %arg28[%arg30, %52] [%c32, %c32] [%c256_12, %c1_13]) {id = 2 : i32} : (memref<32x32xbf16, 2>, memref<64x256xbf16>)
          air.dma_memcpy_nd (%alloc_17[] [] [], %arg29[%51, %52] [%c32, %c32] [%c256_12, %c1_13]) {id = 3 : i32} : (memref<32x32xf32, 2>, memref<128x256xf32>)
          linalg.matmul ins(%alloc_15, %alloc_16 : memref<32x32xbf16, 2>, memref<32x32xbf16, 2>) outs(%alloc_17 : memref<32x32xf32, 2>)
          air.dma_memcpy_nd (%arg29[%51, %52] [%c32, %c32] [%c256_12, %c1_13], %alloc_17[] [] []) {id = 4 : i32} : (memref<128x256xf32>, memref<32x32xf32, 2>)
          memref.dealloc %alloc_15 : memref<32x32xbf16, 2>
          memref.dealloc %alloc_16 : memref<32x32xbf16, 2>
          memref.dealloc %alloc_17 : memref<32x32xf32, 2>
        }
        air.herd_terminator
      }
      %alloc_8 = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32>
      air.herd @herd_1  tile (%arg23, %arg24) in (%arg25=%c2, %arg26=%c2) args(%arg27=%alloc_7, %arg28=%alloc, %arg29=%alloc_8) : memref<128x256xf32>, memref<128x256xf32>, memref<128x256xf32> {
        %c1_12 = arith.constant 1 : index
        %c256_13 = arith.constant 256 : index
        %c0_14 = arith.constant 0 : index
        %c128_15 = arith.constant 128 : index
        %c64 = arith.constant 64 : index
        %c32 = arith.constant 32 : index
        %51 = affine.apply #map1()[%arg23]
        %52 = affine.apply #map2()[%arg24]
        scf.for %arg30 = %c0_14 to %c64 step %c32 {
          scf.for %arg31 = %c0_14 to %c128_15 step %c64 {
            %53 = arith.addi %51, %arg30 : index
            %54 = arith.addi %52, %arg31 : index
            %alloc_16 = memref.alloc() : memref<32x64xf32, 2>
            %alloc_17 = memref.alloc() : memref<32x64xf32, 2>
            %alloc_18 = memref.alloc() : memref<32x64xf32, 2>
            air.dma_memcpy_nd (%alloc_16[] [] [], %arg27[%53, %54] [%c32, %c64] [%c256_13, %c1_12]) {id = 5 : i32} : (memref<32x64xf32, 2>, memref<128x256xf32>)
            air.dma_memcpy_nd (%alloc_17[] [] [], %arg28[%53, %54] [%c32, %c64] [%c256_13, %c1_12]) {id = 6 : i32} : (memref<32x64xf32, 2>, memref<128x256xf32>)
            linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%alloc_16, %alloc_17 : memref<32x64xf32, 2>, memref<32x64xf32, 2>) outs(%alloc_18 : memref<32x64xf32, 2>) {
            ^bb0(%in: f32, %in_19: f32, %out: f32):
              %55 = arith.addf %in, %in_19 : f32
              linalg.yield %55 : f32
            }
            air.dma_memcpy_nd (%arg29[%53, %54] [%c32, %c64] [%c256_13, %c1_12], %alloc_18[] [] []) {id = 7 : i32} : (memref<128x256xf32>, memref<32x64xf32, 2>)
            memref.dealloc %alloc_16 : memref<32x64xf32, 2>
            memref.dealloc %alloc_17 : memref<32x64xf32, 2>
            memref.dealloc %alloc_18 : memref<32x64xf32, 2>
          }
        }
        air.herd_terminator
      }
      %alloc_9 = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32>
      air.herd @herd_2  tile (%arg23, %arg24) in (%arg25=%c2, %arg26=%c2) args(%arg27=%arg16, %arg28=%alloc_8, %arg29=%alloc_9) : memref<128x256xf32>, memref<128x256xf32>, memref<128x256xf32> {
        %c1_12 = arith.constant 1 : index
        %c256_13 = arith.constant 256 : index
        %c0_14 = arith.constant 0 : index
        %c128_15 = arith.constant 128 : index
        %c64 = arith.constant 64 : index
        %c32 = arith.constant 32 : index
        %51 = affine.apply #map1()[%arg23]
        %52 = affine.apply #map2()[%arg24]
        scf.for %arg30 = %c0_14 to %c64 step %c32 {
          scf.for %arg31 = %c0_14 to %c128_15 step %c64 {
            %53 = arith.addi %51, %arg30 : index
            %54 = arith.addi %52, %arg31 : index
            %alloc_16 = memref.alloc() : memref<32x64xf32, 2>
            %alloc_17 = memref.alloc() : memref<32x64xf32, 2>
            %alloc_18 = memref.alloc() : memref<32x64xf32, 2>
            air.dma_memcpy_nd (%alloc_16[] [] [], %arg27[%53, %54] [%c32, %c64] [%c256_13, %c1_12]) {id = 8 : i32} : (memref<32x64xf32, 2>, memref<128x256xf32>)
            air.dma_memcpy_nd (%alloc_17[] [] [], %arg28[%53, %54] [%c32, %c64] [%c256_13, %c1_12]) {id = 9 : i32} : (memref<32x64xf32, 2>, memref<128x256xf32>)
            linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%alloc_16, %alloc_17 : memref<32x64xf32, 2>, memref<32x64xf32, 2>) outs(%alloc_18 : memref<32x64xf32, 2>) {
            ^bb0(%in: f32, %in_19: f32, %out: f32):
              %55 = arith.addf %in, %in_19 : f32
              linalg.yield %55 : f32
            }
            air.dma_memcpy_nd (%arg29[%53, %54] [%c32, %c64] [%c256_13, %c1_12], %alloc_18[] [] []) {id = 10 : i32} : (memref<128x256xf32>, memref<32x64xf32, 2>)
            memref.dealloc %alloc_16 : memref<32x64xf32, 2>
            memref.dealloc %alloc_17 : memref<32x64xf32, 2>
            memref.dealloc %alloc_18 : memref<32x64xf32, 2>
          }
        }
        air.herd_terminator
      }
      %45 = arith.index_cast %26 : i32 to index
      %46 = arith.addi %arg19, %45 : index
      %47 = arith.addi %46, %arg20 : index
      %reinterpret_cast_10 = memref.reinterpret_cast %arg0 to offset: [%47], sizes: [128, 64], strides: [%19, %21] : memref<*xbf16> to memref<128x64xbf16, strided<[?, ?], offset: ?>>
      %48 = arith.index_cast %27 : i32 to index
      %49 = arith.addi %arg21, %48 : index
      %50 = arith.addi %49, %arg22 : index
      %reinterpret_cast_11 = memref.reinterpret_cast %arg1 to offset: [%50], sizes: [64, 256], strides: [%22, %24] : memref<*xbf16> to memref<64x256xbf16, strided<[?, ?], offset: ?>>
      scf.yield %alloc_9, %reinterpret_cast_10, %reinterpret_cast_11, %47, %c0, %50, %c0 : memref<128x256xf32>, memref<128x64xbf16, strided<[?, ?], offset: ?>>, memref<64x256xbf16, strided<[?, ?], offset: ?>>, index, index, index, index
    }
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<128x256xbf16>
    air.herd @herd_3  tile (%arg15, %arg16) in (%arg17=%c2, %arg18=%c2) args(%arg19=%29#0, %arg20=%alloc_1) : memref<128x256xf32>, memref<128x256xbf16> {
      %c1_4 = arith.constant 1 : index
      %c256_5 = arith.constant 256 : index
      %c0_6 = arith.constant 0 : index
      %c128_7 = arith.constant 128 : index
      %c64 = arith.constant 64 : index
      %45 = affine.apply #map1()[%arg15]
      %46 = affine.apply #map2()[%arg16]
      scf.for %arg21 = %c0_6 to %c128_7 step %c64 {
        %47 = arith.addi %46, %arg21 : index
        %alloc_8 = memref.alloc() : memref<64x64xf32, 2>
        %alloc_9 = memref.alloc() : memref<64x64xbf16, 2>
        air.dma_memcpy_nd (%alloc_8[] [] [], %arg19[%45, %47] [%c64, %c64] [%c256_5, %c1_4]) {id = 11 : i32} : (memref<64x64xf32, 2>, memref<128x256xf32>)
        linalg.generic {indexing_maps = [#map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%alloc_8 : memref<64x64xf32, 2>) outs(%alloc_9 : memref<64x64xbf16, 2>) {
        ^bb0(%in: f32, %out: bf16):
          %48 = arith.truncf %in : f32 to bf16
          linalg.yield %48 : bf16
        }
        air.dma_memcpy_nd (%arg20[%45, %47] [%c64, %c64] [%c256_5, %c1_4], %alloc_9[] [] []) {id = 12 : i32} : (memref<128x256xbf16>, memref<64x64xbf16, 2>)
        memref.dealloc %alloc_8 : memref<64x64xf32, 2>
        memref.dealloc %alloc_9 : memref<64x64xbf16, 2>
      }
      air.herd_terminator
    }
    %30 = arith.index_cast %arg10 : i32 to index
    %31 = arith.muli %18, %30 : index
    %32 = arith.index_cast %arg11 : i32 to index
    %33 = arith.muli %23, %32 : index
    %34 = arith.addi %31, %33 : index
    %reinterpret_cast_2 = memref.reinterpret_cast %arg2 to offset: [%34], sizes: [128, 256], strides: [%30, %32] : memref<*xbf16> to memref<128x256xbf16, strided<[?, ?], offset: ?>>
    %35 = arith.addi %18, %c128 : index
    %36 = arith.index_cast %arg3 : i32 to index
    %37 = arith.minsi %35, %36 : index
    %38 = arith.subi %37, %18 : index
    %39 = arith.addi %23, %c256 : index
    %40 = arith.index_cast %arg4 : i32 to index
    %41 = arith.minsi %39, %40 : index
    %42 = arith.subi %41, %23 : index
    %43 = arith.minsi %38, %c128 : index
    %44 = arith.minsi %42, %c256 : index
    %subview = memref.subview %alloc_1[0, 0] [%43, %44] [1, 1] : memref<128x256xbf16> to memref<?x?xbf16, strided<[256, 1]>>
    %subview_3 = memref.subview %reinterpret_cast_2[0, 0] [%43, %44] [1, 1] : memref<128x256xbf16, strided<[?, ?], offset: ?>> to memref<?x?xbf16, strided<[?, ?], offset: ?>>
    memref.copy %subview, %subview_3 : memref<?x?xbf16, strided<[256, 1]>> to memref<?x?xbf16, strided<[?, ?], offset: ?>>
    return
  }
}

