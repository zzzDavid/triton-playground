#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @matmul_kernel(%arg0: memref<*xf64>, %arg1: memref<*xf64>, %arg2: memref<*xf64>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32, %arg12: i32, %arg13: i32, %arg14: i32) {
    %c64_i32 = arith.constant 64 : i32
    %c64 = arith.constant 64 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64x64xf64>
    linalg.fill ins(%cst : f64) outs(%alloc : memref<64x64xf64>)
    %0 = arith.divsi %arg4, %c64_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %c0_i32 = arith.constant 0 : i32
    %c-1_i32 = arith.constant -1 : i32
    %1 = arith.cmpi slt, %0, %c0_i32 : i32
    %2 = arith.select %1, %c1_i32, %c-1_i32 : i32
    %3 = arith.subi %2, %arg12 : i32
    %4 = arith.divsi %3, %0 : i32
    %5 = arith.subi %c-1_i32, %4 : i32
    %6 = arith.divsi %arg12, %0 : i32
    %7 = arith.cmpi slt, %arg12, %c0_i32 : i32
    %8 = arith.cmpi sgt, %arg12, %c0_i32 : i32
    %9 = arith.cmpi slt, %0, %c0_i32 : i32
    %10 = arith.cmpi sgt, %0, %c0_i32 : i32
    %11 = arith.andi %7, %10 : i1
    %12 = arith.andi %8, %9 : i1
    %13 = arith.ori %11, %12 : i1
    %14 = arith.select %13, %5, %6 : i32
    %15 = arith.remsi %arg12, %0 : i32
    %16 = arith.muli %14, %c64_i32 : i32
    %17 = arith.muli %15, %c64_i32 : i32
    %18 = arith.index_cast %16 : i32 to index
    %19 = arith.index_cast %arg6 : i32 to index
    %20 = arith.muli %18, %19 : index
    %21 = arith.index_cast %arg7 : i32 to index
    %22 = arith.index_cast %arg8 : i32 to index
    %23 = arith.index_cast %17 : i32 to index
    %24 = arith.index_cast %arg9 : i32 to index
    %25 = arith.muli %23, %24 : index
    %26 = arith.divsi %arg5, %c64_i32 : i32
    %27 = arith.index_cast %26 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%20], sizes: [64, 64], strides: [%19, %21] : memref<*xf64> to memref<64x64xf64, strided<[?, ?], offset: ?>>
    %reinterpret_cast_0 = memref.reinterpret_cast %arg1 to offset: [%25], sizes: [64, 64], strides: [%22, %24] : memref<*xf64> to memref<64x64xf64, strided<[?, ?], offset: ?>>
    %alloc_1 = memref.alloc() : memref<64x64xf64>
    memref.copy %alloc, %alloc_1 : memref<64x64xf64> to memref<64x64xf64>
    %28:5 = scf.for %arg15 = %c0 to %27 step %c1 iter_args(%arg16 = %alloc_1, %arg17 = %20, %arg18 = %c0, %arg19 = %25, %arg20 = %c0) -> (memref<64x64xf64>, index, index, index, index) {
      %50 = arith.muli %arg15, %c64 : index
      %51 = arith.index_cast %50 : index to i32
      %52 = arith.subi %arg5, %51 : i32
      %alloc_4 = memref.alloc() : memref<64x64xf64>
      %53 = arith.index_cast %52 : i32 to index
      %54 = arith.minsi %53, %c64 : index
      %subview_5 = memref.subview %reinterpret_cast[0, 0] [64, %54] [1, 1] : memref<64x64xf64, strided<[?, ?], offset: ?>> to memref<64x?xf64, strided<[?, ?], offset: ?>>
      %subview_6 = memref.subview %alloc_4[0, 0] [64, %54] [1, 1] : memref<64x64xf64> to memref<64x?xf64, strided<[64, 1]>>
      %55 = arith.cmpi slt, %54, %c64 : index
      scf.if %55 {
        linalg.fill ins(%cst : f64) outs(%alloc_4 : memref<64x64xf64>)
      }
      memref.copy %subview_5, %subview_6 : memref<64x?xf64, strided<[?, ?], offset: ?>> to memref<64x?xf64, strided<[64, 1]>>
      %56 = arith.muli %arg15, %c64 : index
      %57 = arith.index_cast %56 : index to i32
      %58 = arith.subi %arg5, %57 : i32
      %alloc_7 = memref.alloc() : memref<64x64xf64>
      %59 = arith.index_cast %58 : i32 to index
      %60 = arith.minsi %59, %c64 : index
      %subview_8 = memref.subview %reinterpret_cast_0[0, 0] [%60, 64] [1, 1] : memref<64x64xf64, strided<[?, ?], offset: ?>> to memref<?x64xf64, strided<[?, ?], offset: ?>>
      %subview_9 = memref.subview %alloc_7[0, 0] [%60, 64] [1, 1] : memref<64x64xf64> to memref<?x64xf64, strided<[64, 1]>>
      %61 = arith.cmpi slt, %60, %c64 : index
      scf.if %61 {
        linalg.fill ins(%cst : f64) outs(%alloc_7 : memref<64x64xf64>)
      }
      memref.copy %subview_8, %subview_9 : memref<?x64xf64, strided<[?, ?], offset: ?>> to memref<?x64xf64, strided<[64, 1]>>
      %alloc_10 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf64>
      %alloc_11 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf64>
      memref.copy %alloc_10, %alloc_11 : memref<64x64xf64> to memref<64x64xf64>
      memref.dealloc %alloc_10 : memref<64x64xf64>
      linalg.matmul ins(%alloc_4, %alloc_7 : memref<64x64xf64>, memref<64x64xf64>) outs(%alloc_11 : memref<64x64xf64>)
      memref.dealloc %alloc_7 : memref<64x64xf64>
      memref.dealloc %alloc_4 : memref<64x64xf64>
      %alloc_12 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf64>
      linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%alloc_11, %alloc : memref<64x64xf64>, memref<64x64xf64>) outs(%alloc_12 : memref<64x64xf64>) {
      ^bb0(%in: f64, %in_15: f64, %out: f64):
        %70 = arith.addf %in, %in_15 : f64
        linalg.yield %70 : f64
      }
      memref.dealloc %alloc_11 : memref<64x64xf64>
      %alloc_13 = memref.alloc() {alignment = 64 : i64} : memref<64x64xf64>
      linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg16, %alloc_12 : memref<64x64xf64>, memref<64x64xf64>) outs(%alloc_13 : memref<64x64xf64>) {
      ^bb0(%in: f64, %in_15: f64, %out: f64):
        %70 = arith.addf %in, %in_15 : f64
        linalg.yield %70 : f64
      }
      memref.dealloc %arg16 : memref<64x64xf64>
      memref.dealloc %alloc_12 : memref<64x64xf64>
      %62 = arith.muli %arg7, %c64_i32 : i32
      %63 = arith.index_cast %62 : i32 to index
      %64 = arith.addi %arg17, %63 : index
      %65 = arith.addi %64, %arg18 : index
      %66 = arith.muli %arg8, %c64_i32 : i32
      %67 = arith.index_cast %66 : i32 to index
      %68 = arith.addi %arg19, %67 : index
      %69 = arith.addi %68, %arg20 : index
      %alloc_14 = memref.alloc() : memref<64x64xf64>
      memref.copy %alloc_13, %alloc_14 : memref<64x64xf64> to memref<64x64xf64>
      memref.dealloc %alloc_13 : memref<64x64xf64>
      scf.yield %alloc_14, %65, %c0, %69, %c0 : memref<64x64xf64>, index, index, index, index
    }
    memref.dealloc %alloc : memref<64x64xf64>
    %29 = arith.muli %14, %c64_i32 : i32
    %30 = arith.muli %15, %c64_i32 : i32
    %31 = arith.index_cast %arg10 : i32 to index
    %32 = arith.index_cast %29 : i32 to index
    %33 = arith.muli %32, %31 : index
    %34 = arith.index_cast %arg11 : i32 to index
    %35 = arith.index_cast %30 : i32 to index
    %36 = arith.muli %35, %34 : index
    %37 = arith.addi %33, %36 : index
    %reinterpret_cast_2 = memref.reinterpret_cast %arg2 to offset: [%37], sizes: [64, 64], strides: [%31, %34] : memref<*xf64> to memref<64x64xf64, strided<[?, ?], offset: ?>>
    %38 = arith.index_cast %29 : i32 to index
    %39 = arith.addi %38, %c64 : index
    %40 = arith.index_cast %arg3 : i32 to index
    %41 = arith.minsi %39, %40 : index
    %42 = arith.subi %41, %38 : index
    %43 = arith.index_cast %30 : i32 to index
    %44 = arith.addi %43, %c64 : index
    %45 = arith.index_cast %arg4 : i32 to index
    %46 = arith.minsi %44, %45 : index
    %47 = arith.subi %46, %43 : index
    %48 = arith.minsi %42, %c64 : index
    %49 = arith.minsi %47, %c64 : index
    %subview = memref.subview %28#0[0, 0] [%48, %49] [1, 1] : memref<64x64xf64> to memref<?x?xf64, strided<[64, 1]>>
    %subview_3 = memref.subview %reinterpret_cast_2[0, 0] [%48, %49] [1, 1] : memref<64x64xf64, strided<[?, ?], offset: ?>> to memref<?x?xf64, strided<[?, ?], offset: ?>>
    %cast = memref.cast %subview : memref<?x?xf64, strided<[64, 1]>> to memref<?x?xf64, strided<[?, ?], offset: ?>>
    memref.copy %subview, %subview_3 : memref<?x?xf64, strided<[64, 1]>> to memref<?x?xf64, strided<[?, ?], offset: ?>>
    memref.dealloc %28#0 : memref<64x64xf64>
    return
  }
}
