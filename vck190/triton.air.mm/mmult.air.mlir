#map = affine_map<()[s0] -> (s0 * 32)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @matmul_kernel(%arg0: memref<*xf64>, %arg1: memref<*xf64>, %arg2: memref<*xf64>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32, %arg12: i32, %arg13: i32, %arg14: i32) {
    %c2 = arith.constant 2 : index
    %c-1_i32 = arith.constant -1 : i32
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c64_i32 = arith.constant 64 : i32
    %c64 = arith.constant 64 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x64xf64>
    linalg.fill ins(%cst : f64) outs(%alloc : memref<64x64xf64>)
    %0 = arith.divsi %arg4, %c64_i32 : i32
    %1 = arith.cmpi slt, %0, %c0_i32 : i32
    %2 = arith.select %1, %c1_i32, %c-1_i32 : i32
    %3 = arith.subi %2, %arg12 : i32
    %4 = arith.divsi %3, %0 : i32
    %5 = arith.subi %c-1_i32, %4 : i32
    %6 = arith.divsi %arg12, %0 : i32
    %7 = arith.cmpi slt, %arg12, %c0_i32 : i32
    %8 = arith.cmpi sgt, %arg12, %c0_i32 : i32
    %9 = arith.cmpi sgt, %0, %c0_i32 : i32
    %10 = arith.andi %7, %9 : i1
    %11 = arith.andi %8, %1 : i1
    %12 = arith.ori %10, %11 : i1
    %13 = arith.select %12, %5, %6 : i32
    %14 = arith.remsi %arg12, %0 : i32
    %15 = arith.muli %13, %c64_i32 : i32
    %16 = arith.muli %14, %c64_i32 : i32
    %17 = arith.index_cast %15 : i32 to index
    %18 = arith.index_cast %arg6 : i32 to index
    %19 = arith.muli %17, %18 : index
    %20 = arith.index_cast %arg7 : i32 to index
    %21 = arith.index_cast %arg8 : i32 to index
    %22 = arith.index_cast %16 : i32 to index
    %23 = arith.index_cast %arg9 : i32 to index
    %24 = arith.muli %22, %23 : index
    %25 = arith.divsi %arg5, %c64_i32 : i32
    %26 = arith.index_cast %25 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%19], sizes: [64, 64], strides: [%18, %20] : memref<*xf64> to memref<64x64xf64, strided<[?, ?], offset: ?>>
    %reinterpret_cast_0 = memref.reinterpret_cast %arg1 to offset: [%24], sizes: [64, 64], strides: [%21, %23] : memref<*xf64> to memref<64x64xf64, strided<[?, ?], offset: ?>>
    %alloc_1 = memref.alloc() : memref<64x64xf64>
    memref.copy %alloc, %alloc_1 : memref<64x64xf64> to memref<64x64xf64>
    %27:5 = scf.for %arg15 = %c0 to %26 step %c1 iter_args(%arg16 = %alloc_1, %arg17 = %19, %arg18 = %c0, %arg19 = %24, %arg20 = %c0) -> (memref<64x64xf64>, index, index, index, index) {
      %43 = arith.muli %arg15, %c64 : index
      %44 = arith.index_cast %43 : index to i32
      %45 = arith.subi %arg5, %44 : i32
      %alloc_4 = memref.alloc() : memref<64x64xf64>
      %46 = arith.index_cast %45 : i32 to index
      %47 = arith.minsi %46, %c64 : index
      %subview_5 = memref.subview %reinterpret_cast[0, 0] [64, %47] [1, 1] : memref<64x64xf64, strided<[?, ?], offset: ?>> to memref<64x?xf64, strided<[?, ?], offset: ?>>
      %subview_6 = memref.subview %alloc_4[0, 0] [64, %47] [1, 1] : memref<64x64xf64> to memref<64x?xf64, strided<[64, 1]>>
      %48 = arith.cmpi slt, %47, %c64 : index
      scf.if %48 {
        linalg.fill ins(%cst : f64) outs(%alloc_4 : memref<64x64xf64>)
      }
      memref.copy %subview_5, %subview_6 : memref<64x?xf64, strided<[?, ?], offset: ?>> to memref<64x?xf64, strided<[64, 1]>>
      %alloc_7 = memref.alloc() : memref<64x64xf64>
      %subview_8 = memref.subview %reinterpret_cast_0[0, 0] [%47, 64] [1, 1] : memref<64x64xf64, strided<[?, ?], offset: ?>> to memref<?x64xf64, strided<[?, ?], offset: ?>>
      %subview_9 = memref.subview %alloc_7[0, 0] [%47, 64] [1, 1] : memref<64x64xf64> to memref<?x64xf64, strided<[64, 1]>>
      scf.if %48 {
        linalg.fill ins(%cst : f64) outs(%alloc_7 : memref<64x64xf64>)
      }
      memref.copy %subview_8, %subview_9 : memref<?x64xf64, strided<[?, ?], offset: ?>> to memref<?x64xf64, strided<[64, 1]>>
      %alloc_10 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf64>
      %alloc_11 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf64>
      memref.copy %alloc_10, %alloc_11 : memref<64x64xf64> to memref<64x64xf64>
      memref.dealloc %alloc_10 : memref<64x64xf64>
      air.herd @herd_0  tile (%arg21, %arg22) in (%arg23=%c2, %arg24=%c2) args(%arg25=%alloc_4, %arg26=%alloc_7, %arg27=%alloc_11) : memref<64x64xf64>, memref<64x64xf64>, memref<64x64xf64> {
        %c1_15 = arith.constant 1 : index
        %c0_16 = arith.constant 0 : index
        %c64_17 = arith.constant 64 : index
        %c32 = arith.constant 32 : index
        %57 = affine.apply #map()[%arg21]
        %58 = affine.apply #map()[%arg22]
        scf.for %arg28 = %c0_16 to %c64_17 step %c32 {
          %alloc_18 = memref.alloc() : memref<32x32xf64, 2>
          %alloc_19 = memref.alloc() : memref<32x32xf64, 2>
          %alloc_20 = memref.alloc() : memref<32x32xf64, 2>
          air.dma_memcpy_nd (%alloc_18[] [] [], %arg25[%57, %arg28] [%c32, %c32] [%c64_17, %c1_15]) {id = 1 : i32} : (memref<32x32xf64, 2>, memref<64x64xf64>)
          air.dma_memcpy_nd (%alloc_19[] [] [], %arg26[%arg28, %58] [%c32, %c32] [%c64_17, %c1_15]) {id = 2 : i32} : (memref<32x32xf64, 2>, memref<64x64xf64>)
          air.dma_memcpy_nd (%alloc_20[] [] [], %arg27[%57, %58] [%c32, %c32] [%c64_17, %c1_15]) {id = 3 : i32} : (memref<32x32xf64, 2>, memref<64x64xf64>)
          linalg.matmul ins(%alloc_18, %alloc_19 : memref<32x32xf64, 2>, memref<32x32xf64, 2>) outs(%alloc_20 : memref<32x32xf64, 2>)
          air.dma_memcpy_nd (%arg27[%57, %58] [%c32, %c32] [%c64_17, %c1_15], %alloc_20[] [] []) {id = 4 : i32} : (memref<64x64xf64>, memref<32x32xf64, 2>)
          memref.dealloc %alloc_18 : memref<32x32xf64, 2>
          memref.dealloc %alloc_19 : memref<32x32xf64, 2>
          memref.dealloc %alloc_20 : memref<32x32xf64, 2>
        }
        air.herd_terminator
      }
      memref.dealloc %alloc_7 : memref<64x64xf64>
      memref.dealloc %alloc_4 : memref<64x64xf64>
      %alloc_12 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf64>
      air.herd @herd_1  tile (%arg21, %arg22) in (%arg23=%c2, %arg24=%c2) args(%arg25=%alloc_11, %arg26=%alloc, %arg27=%alloc_12) : memref<64x64xf64>, memref<64x64xf64>, memref<64x64xf64> {
        %c1_15 = arith.constant 1 : index
        %c64_16 = arith.constant 64 : index
        %c0_17 = arith.constant 0 : index
        %c32 = arith.constant 32 : index
        %c16 = arith.constant 16 : index
        %57 = affine.apply #map()[%arg21]
        %58 = affine.apply #map()[%arg22]
        scf.for %arg28 = %c0_17 to %c32 step %c16 {
          %59 = arith.addi %58, %arg28 : index
          %alloc_18 = memref.alloc() : memref<32x16xf64, 2>
          %alloc_19 = memref.alloc() : memref<32x16xf64, 2>
          %alloc_20 = memref.alloc() : memref<32x16xf64, 2>
          air.dma_memcpy_nd (%alloc_18[] [] [], %arg25[%57, %59] [%c32, %c16] [%c64_16, %c1_15]) {id = 5 : i32} : (memref<32x16xf64, 2>, memref<64x64xf64>)
          air.dma_memcpy_nd (%alloc_19[] [] [], %arg26[%57, %59] [%c32, %c16] [%c64_16, %c1_15]) {id = 6 : i32} : (memref<32x16xf64, 2>, memref<64x64xf64>)
          linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%alloc_18, %alloc_19 : memref<32x16xf64, 2>, memref<32x16xf64, 2>) outs(%alloc_20 : memref<32x16xf64, 2>) {
          ^bb0(%in: f64, %in_21: f64, %out: f64):
            %60 = arith.addf %in, %in_21 : f64
            linalg.yield %60 : f64
          }
          air.dma_memcpy_nd (%arg27[%57, %59] [%c32, %c16] [%c64_16, %c1_15], %alloc_20[] [] []) {id = 7 : i32} : (memref<64x64xf64>, memref<32x16xf64, 2>)
          memref.dealloc %alloc_18 : memref<32x16xf64, 2>
          memref.dealloc %alloc_19 : memref<32x16xf64, 2>
          memref.dealloc %alloc_20 : memref<32x16xf64, 2>
        }
        air.herd_terminator
      }
      memref.dealloc %alloc_11 : memref<64x64xf64>
      %alloc_13 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf64>
      air.herd @herd_2  tile (%arg21, %arg22) in (%arg23=%c2, %arg24=%c2) args(%arg25=%arg16, %arg26=%alloc_12, %arg27=%alloc_13) : memref<64x64xf64>, memref<64x64xf64>, memref<64x64xf64> {
        %c1_15 = arith.constant 1 : index
        %c64_16 = arith.constant 64 : index
        %c0_17 = arith.constant 0 : index
        %c32 = arith.constant 32 : index
        %c16 = arith.constant 16 : index
        %57 = affine.apply #map()[%arg21]
        %58 = affine.apply #map()[%arg22]
        scf.for %arg28 = %c0_17 to %c32 step %c16 {
          %59 = arith.addi %58, %arg28 : index
          %alloc_18 = memref.alloc() : memref<32x16xf64, 2>
          %alloc_19 = memref.alloc() : memref<32x16xf64, 2>
          %alloc_20 = memref.alloc() : memref<32x16xf64, 2>
          air.dma_memcpy_nd (%alloc_18[] [] [], %arg25[%57, %59] [%c32, %c16] [%c64_16, %c1_15]) {id = 8 : i32} : (memref<32x16xf64, 2>, memref<64x64xf64>)
          air.dma_memcpy_nd (%alloc_19[] [] [], %arg26[%57, %59] [%c32, %c16] [%c64_16, %c1_15]) {id = 9 : i32} : (memref<32x16xf64, 2>, memref<64x64xf64>)
          linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%alloc_18, %alloc_19 : memref<32x16xf64, 2>, memref<32x16xf64, 2>) outs(%alloc_20 : memref<32x16xf64, 2>) {
          ^bb0(%in: f64, %in_21: f64, %out: f64):
            %60 = arith.addf %in, %in_21 : f64
            linalg.yield %60 : f64
          }
          air.dma_memcpy_nd (%arg27[%57, %59] [%c32, %c16] [%c64_16, %c1_15], %alloc_20[] [] []) {id = 10 : i32} : (memref<64x64xf64>, memref<32x16xf64, 2>)
          memref.dealloc %alloc_18 : memref<32x16xf64, 2>
          memref.dealloc %alloc_19 : memref<32x16xf64, 2>
          memref.dealloc %alloc_20 : memref<32x16xf64, 2>
        }
        air.herd_terminator
      }
      memref.dealloc %arg16 : memref<64x64xf64>
      memref.dealloc %alloc_12 : memref<64x64xf64>
      %49 = arith.muli %arg7, %c64_i32 : i32
      %50 = arith.index_cast %49 : i32 to index
      %51 = arith.addi %arg17, %50 : index
      %52 = arith.addi %51, %arg18 : index
      %53 = arith.muli %arg8, %c64_i32 : i32
      %54 = arith.index_cast %53 : i32 to index
      %55 = arith.addi %arg19, %54 : index
      %56 = arith.addi %55, %arg20 : index
      %alloc_14 = memref.alloc() : memref<64x64xf64>
      memref.copy %alloc_13, %alloc_14 : memref<64x64xf64> to memref<64x64xf64>
      memref.dealloc %alloc_13 : memref<64x64xf64>
      scf.yield %alloc_14, %52, %c0, %56, %c0 : memref<64x64xf64>, index, index, index, index
    }
    memref.dealloc %alloc : memref<64x64xf64>
    %28 = arith.index_cast %arg10 : i32 to index
    %29 = arith.muli %17, %28 : index
    %30 = arith.index_cast %arg11 : i32 to index
    %31 = arith.muli %22, %30 : index
    %32 = arith.addi %29, %31 : index
    %reinterpret_cast_2 = memref.reinterpret_cast %arg2 to offset: [%32], sizes: [64, 64], strides: [%28, %30] : memref<*xf64> to memref<64x64xf64, strided<[?, ?], offset: ?>>
    %33 = arith.addi %17, %c64 : index
    %34 = arith.index_cast %arg3 : i32 to index
    %35 = arith.minsi %33, %34 : index
    %36 = arith.subi %35, %17 : index
    %37 = arith.addi %22, %c64 : index
    %38 = arith.index_cast %arg4 : i32 to index
    %39 = arith.minsi %37, %38 : index
    %40 = arith.subi %39, %22 : index
    %41 = arith.minsi %36, %c64 : index
    %42 = arith.minsi %40, %c64 : index
    %subview = memref.subview %27#0[0, 0] [%41, %42] [1, 1] : memref<64x64xf64> to memref<?x?xf64, strided<[64, 1]>>
    %subview_3 = memref.subview %reinterpret_cast_2[0, 0] [%41, %42] [1, 1] : memref<64x64xf64, strided<[?, ?], offset: ?>> to memref<?x?xf64, strided<[?, ?], offset: ?>>
    memref.copy %subview, %subview_3 : memref<?x?xf64, strided<[64, 1]>> to memref<?x?xf64, strided<[?, ?], offset: ?>>
    memref.dealloc %27#0 : memref<64x64xf64>
    return
  }
}

