#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @matmul_kernel_0123456789101112131415(%arg0: memref<*xbf16>, %arg1: memref<*xbf16>, %arg2: memref<*xbf16>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32, %arg12: i32, %arg13: i32, %arg14: i32) {
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
    %1 = arith.addi %arg3, %c127_i32 : i32
    %2 = arith.divsi %1, %c128_i32 : i32
    %3 = arith.addi %arg4, %c255_i32 : i32
    %4 = arith.divsi %3, %c256_i32 : i32
    %5 = arith.addi %arg5, %c63_i32 : i32
    %6 = arith.divsi %5, %c64_i32 : i32
    %7 = arith.muli %4, %c8_i32 : i32
    %8 = arith.divsi %arg12, %7 : i32
    %9 = arith.muli %8, %c8_i32 : i32
    %10 = arith.subi %2, %9 : i32
    %11 = arith.cmpi slt, %10, %c8_i32 : i32
    %12 = arith.select %11, %10, %c8_i32 : i32
    %13 = arith.remsi %arg12, %12 : i32
    %14 = arith.addi %9, %13 : i32
    %15 = arith.remsi %arg12, %7 : i32
    %16 = arith.divsi %15, %12 : i32
    %17 = arith.muli %14, %c128_i32 : i32
    %18 = arith.muli %16, %c256_i32 : i32
    %19 = arith.index_cast %17 : i32 to index
    %20 = arith.index_cast %arg6 : i32 to index
    %21 = arith.muli %19, %20 : index
    %22 = arith.index_cast %arg7 : i32 to index
    %23 = arith.index_cast %arg8 : i32 to index
    %24 = arith.index_cast %18 : i32 to index
    %25 = arith.index_cast %arg9 : i32 to index
    %26 = arith.muli %24, %25 : index
    %27 = arith.muli %arg7, %c64_i32 : i32
    %28 = arith.muli %arg8, %c64_i32 : i32
    %29 = arith.index_cast %6 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%21], sizes: [128, 64], strides: [%20, %22] : memref<*xbf16> to memref<128x64xbf16, strided<[?, ?], offset: ?>>
    %reinterpret_cast_0 = memref.reinterpret_cast %arg1 to offset: [%26], sizes: [64, 256], strides: [%23, %25] : memref<*xbf16> to memref<64x256xbf16, strided<[?, ?], offset: ?>>
    %30:7 = scf.for %arg15 = %c0 to %29 step %c1 iter_args(%arg16 = %alloc, %arg17 = %reinterpret_cast, %arg18 = %reinterpret_cast_0, %arg19 = %21, %arg20 = %c0, %arg21 = %26, %arg22 = %c0) -> (memref<128x256xf32>, memref<128x64xbf16, strided<[?, ?], offset: ?>>, memref<64x256xbf16, strided<[?, ?], offset: ?>>, index, index, index, index) {
      %alloc_4 = memref.alloc() : memref<128x64xbf16>
      memref.copy %arg17, %alloc_4 : memref<128x64xbf16, strided<[?, ?], offset: ?>> to memref<128x64xbf16>
      %alloc_5 = memref.alloc() : memref<64x256xbf16>
      memref.copy %arg18, %alloc_5 : memref<64x256xbf16, strided<[?, ?], offset: ?>> to memref<64x256xbf16>
      %alloc_6 = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32>
      %alloc_7 = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32>
      memref.copy %alloc_6, %alloc_7 : memref<128x256xf32> to memref<128x256xf32>
      linalg.matmul ins(%alloc_4, %alloc_5 : memref<128x64xbf16>, memref<64x256xbf16>) outs(%alloc_7 : memref<128x256xf32>)
      %alloc_8 = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32>
      linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%alloc_7, %alloc : memref<128x256xf32>, memref<128x256xf32>) outs(%alloc_8 : memref<128x256xf32>) {
      ^bb0(%in: f32, %in_12: f32, %out: f32):
        %55 = arith.addf %in, %in_12 : f32
        linalg.yield %55 : f32
      }
      %alloc_9 = memref.alloc() {alignment = 64 : i64} : memref<128x256xf32>
      linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg16, %alloc_8 : memref<128x256xf32>, memref<128x256xf32>) outs(%alloc_9 : memref<128x256xf32>) {
      ^bb0(%in: f32, %in_12: f32, %out: f32):
        %55 = arith.addf %in, %in_12 : f32
        linalg.yield %55 : f32
      }
      %49 = arith.index_cast %27 : i32 to index
      %50 = arith.addi %arg19, %49 : index
      %51 = arith.addi %50, %arg20 : index
      %reinterpret_cast_10 = memref.reinterpret_cast %arg0 to offset: [%51], sizes: [128, 64], strides: [%20, %22] : memref<*xbf16> to memref<128x64xbf16, strided<[?, ?], offset: ?>>
      %52 = arith.index_cast %28 : i32 to index
      %53 = arith.addi %arg21, %52 : index
      %54 = arith.addi %53, %arg22 : index
      %reinterpret_cast_11 = memref.reinterpret_cast %arg1 to offset: [%54], sizes: [64, 256], strides: [%23, %25] : memref<*xbf16> to memref<64x256xbf16, strided<[?, ?], offset: ?>>
      scf.yield %alloc_9, %reinterpret_cast_10, %reinterpret_cast_11, %51, %c0, %54, %c0 : memref<128x256xf32>, memref<128x64xbf16, strided<[?, ?], offset: ?>>, memref<64x256xbf16, strided<[?, ?], offset: ?>>, index, index, index, index
    }
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<128x256xbf16>
    linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%30#0 : memref<128x256xf32>) outs(%alloc_1 : memref<128x256xbf16>) {
    ^bb0(%in: f32, %out: bf16):
      %47 = arith.truncf %in : f32 to bf16
      linalg.yield %47 : bf16
    }
    %32 = arith.index_cast %arg10 : i32 to index
    %33 = arith.muli %19, %32 : index
    %34 = arith.index_cast %arg11 : i32 to index
    %35 = arith.muli %24, %34 : index
    %36 = arith.addi %33, %35 : index
    %reinterpret_cast_2 = memref.reinterpret_cast %arg2 to offset: [%36], sizes: [128, 256], strides: [%32, %34] : memref<*xbf16> to memref<128x256xbf16, strided<[?, ?], offset: ?>>
    %37 = arith.addi %19, %c128 : index
    %38 = arith.index_cast %arg3 : i32 to index
    %39 = arith.minsi %37, %38 : index
    %40 = arith.subi %39, %19 : index
    %41 = arith.addi %24, %c256 : index
    %42 = arith.index_cast %arg4 : i32 to index
    %43 = arith.minsi %41, %42 : index
    %44 = arith.subi %43, %24 : index
    %45 = arith.minsi %40, %c128 : index
    %46 = arith.minsi %44, %c256 : index
    %subview = memref.subview %alloc_1[0, 0] [%45, %46] [1, 1] : memref<128x256xbf16> to memref<?x?xbf16, strided<[256, 1]>>
    %subview_3 = memref.subview %reinterpret_cast_2[0, 0] [%45, %46] [1, 1] : memref<128x256xbf16, strided<[?, ?], offset: ?>> to memref<?x?xbf16, strided<[?, ?], offset: ?>>
    memref.copy %subview, %subview_3 : memref<?x?xbf16, strided<[256, 1]>> to memref<?x?xbf16, strided<[?, ?], offset: ?>>
    return
  }
}

