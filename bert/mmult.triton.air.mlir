module {
  func.func @matmul_kernel(%arg0: memref<*xf64>, %arg1: memref<*xf64>, %arg2: memref<*xf64>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32, %arg12: i32, %arg13: i32, %arg14: i32) {
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c8_i32 = arith.constant 8 : i32
    %cst = arith.constant 0.000000e+00 : f64
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<8x8xf64>
    scf.for %arg15 = %c0 to %c8 step %c1 {
      scf.for %arg16 = %c0 to %c8 step %c1 {
        memref.store %cst, %alloc[%arg15, %arg16] : memref<8x8xf64>
      }
    }
    %0 = arith.divsi %arg4, %c8_i32 : i32
    %1 = arith.floordivsi %arg12, %0 : i32
    %2 = arith.remsi %arg12, %0 : i32
    %3 = arith.muli %1, %c8_i32 : i32
    %4 = arith.muli %2, %c8_i32 : i32
    %5 = arith.index_cast %3 : i32 to index
    %6 = arith.index_cast %arg6 : i32 to index
    %7 = arith.muli %5, %6 : index
    %8 = arith.index_cast %arg7 : i32 to index
    %9 = arith.index_cast %arg8 : i32 to index
    %10 = arith.index_cast %4 : i32 to index
    %11 = arith.index_cast %arg9 : i32 to index
    %12 = arith.muli %10, %11 : index
    %13 = arith.divsi %arg5, %c8_i32 : i32
    %14 = arith.index_cast %13 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%7], sizes: [8, 8], strides: [%6, %8] : memref<*xf64> to memref<8x8xf64, strided<[?, ?], offset: ?>>
    %reinterpret_cast_0 = memref.reinterpret_cast %arg1 to offset: [%12], sizes: [8, 8], strides: [%9, %11] : memref<*xf64> to memref<8x8xf64, strided<[?, ?], offset: ?>>
    %alloc_1 = memref.alloc() : memref<8x8xf64>
    memref.copy %alloc, %alloc_1 : memref<8x8xf64> to memref<8x8xf64>
    %alloc_2 = memref.alloc() : memref<8x8xf64>
    %alloc_3 = memref.alloc() : memref<8x8xf64>
    %alloc_4 = memref.alloc() {alignment = 64 : i64} : memref<8x8xf64>
    %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<8x8xf64>
    %alloc_6 = memref.alloc() {alignment = 64 : i64} : memref<8x8xf64>
    %15:5 = scf.for %arg15 = %c0 to %14 step %c1 iter_args(%arg16 = %alloc_1, %arg17 = %7, %arg18 = %c0, %arg19 = %12, %arg20 = %c0) -> (memref<8x8xf64>, index, index, index, index) {
      %37 = arith.muli %arg15, %c8 : index
      %38 = arith.index_cast %37 : index to i32
      %39 = arith.subi %arg5, %38 : i32
      %40 = arith.index_cast %39 : i32 to index
      %41 = arith.minsi %40, %c8 : index
      %subview_9 = memref.subview %reinterpret_cast[0, 0] [8, %41] [1, 1] : memref<8x8xf64, strided<[?, ?], offset: ?>> to memref<8x?xf64, strided<[?, ?], offset: ?>>
      %subview_10 = memref.subview %alloc_2[0, 0] [8, %41] [1, 1] : memref<8x8xf64> to memref<8x?xf64, strided<[8, 1]>>
      %42 = arith.cmpi slt, %41, %c8 : index
      scf.if %42 {
        scf.for %arg21 = %c0 to %c8 step %c1 {
          scf.for %arg22 = %c0 to %c8 step %c1 {
            memref.store %cst, %alloc_2[%arg21, %arg22] : memref<8x8xf64>
          }
        }
      }
      memref.copy %subview_9, %subview_10 : memref<8x?xf64, strided<[?, ?], offset: ?>> to memref<8x?xf64, strided<[8, 1]>>
      %43 = arith.muli %arg15, %c8 : index
      %44 = arith.index_cast %43 : index to i32
      %45 = arith.subi %arg5, %44 : i32
      %46 = arith.index_cast %45 : i32 to index
      %47 = arith.minsi %46, %c8 : index
      %subview_11 = memref.subview %reinterpret_cast_0[0, 0] [%47, 8] [1, 1] : memref<8x8xf64, strided<[?, ?], offset: ?>> to memref<?x8xf64, strided<[?, ?], offset: ?>>
      %subview_12 = memref.subview %alloc_3[0, 0] [%47, 8] [1, 1] : memref<8x8xf64> to memref<?x8xf64, strided<[8, 1]>>
      %48 = arith.cmpi slt, %47, %c8 : index
      scf.if %48 {
        scf.for %arg21 = %c0 to %c8 step %c1 {
          scf.for %arg22 = %c0 to %c8 step %c1 {
            memref.store %cst, %alloc_3[%arg21, %arg22] : memref<8x8xf64>
          }
        }
      }
      memref.copy %subview_11, %subview_12 : memref<?x8xf64, strided<[?, ?], offset: ?>> to memref<?x8xf64, strided<[8, 1]>>
      memref.copy %alloc_4, %alloc_5 : memref<8x8xf64> to memref<8x8xf64>
      memref.dealloc %alloc_4 : memref<8x8xf64>
      scf.for %arg21 = %c0 to %c8 step %c1 {
        scf.for %arg22 = %c0 to %c8 step %c1 {
          scf.for %arg23 = %c0 to %c8 step %c1 {
            %57 = memref.load %alloc_2[%arg21, %arg23] : memref<8x8xf64>
            %58 = memref.load %alloc_3[%arg23, %arg22] : memref<8x8xf64>
            %59 = memref.load %alloc_5[%arg21, %arg22] : memref<8x8xf64>
            %60 = arith.mulf %57, %58 : f64
            %61 = arith.addf %59, %60 : f64
            memref.store %61, %alloc_5[%arg21, %arg22] : memref<8x8xf64>
          }
        }
      }
      memref.dealloc %alloc_3 : memref<8x8xf64>
      memref.dealloc %alloc_2 : memref<8x8xf64>
      scf.for %arg21 = %c0 to %c8 step %c1 {
        scf.for %arg22 = %c0 to %c8 step %c1 {
          %57 = memref.load %alloc_5[%arg21, %arg22] : memref<8x8xf64>
          %58 = memref.load %alloc[%arg21, %arg22] : memref<8x8xf64>
          %59 = arith.addf %57, %58 : f64
          memref.store %59, %alloc_6[%arg21, %arg22] : memref<8x8xf64>
        }
      }
      memref.dealloc %alloc_5 : memref<8x8xf64>
      %alloc_13 = memref.alloc() {alignment = 64 : i64} : memref<8x8xf64>
      scf.for %arg21 = %c0 to %c8 step %c1 {
        scf.for %arg22 = %c0 to %c8 step %c1 {
          %57 = memref.load %arg16[%arg21, %arg22] : memref<8x8xf64>
          %58 = memref.load %alloc_6[%arg21, %arg22] : memref<8x8xf64>
          %59 = arith.addf %57, %58 : f64
          memref.store %59, %alloc_13[%arg21, %arg22] : memref<8x8xf64>
        }
      }
      memref.dealloc %arg16 : memref<8x8xf64>
      memref.dealloc %alloc_6 : memref<8x8xf64>
      %49 = arith.muli %arg7, %c8_i32 : i32
      %50 = arith.index_cast %49 : i32 to index
      %51 = arith.addi %arg17, %50 : index
      %52 = arith.addi %51, %arg18 : index
      %53 = arith.muli %arg8, %c8_i32 : i32
      %54 = arith.index_cast %53 : i32 to index
      %55 = arith.addi %arg19, %54 : index
      %56 = arith.addi %55, %arg20 : index
      %alloc_14 = memref.alloc() : memref<8x8xf64>
      memref.copy %alloc_13, %alloc_14 : memref<8x8xf64> to memref<8x8xf64>
      memref.dealloc %alloc_13 : memref<8x8xf64>
      scf.yield %alloc_14, %52, %c0, %56, %c0 : memref<8x8xf64>, index, index, index, index
    }
    memref.dealloc %alloc : memref<8x8xf64>
    %16 = arith.muli %1, %c8_i32 : i32
    %17 = arith.muli %2, %c8_i32 : i32
    %18 = arith.index_cast %arg10 : i32 to index
    %19 = arith.index_cast %16 : i32 to index
    %20 = arith.muli %19, %18 : index
    %21 = arith.index_cast %arg11 : i32 to index
    %22 = arith.index_cast %17 : i32 to index
    %23 = arith.muli %22, %21 : index
    %24 = arith.addi %20, %23 : index
    %reinterpret_cast_7 = memref.reinterpret_cast %arg2 to offset: [%24], sizes: [8, 8], strides: [%18, %21] : memref<*xf64> to memref<8x8xf64, strided<[?, ?], offset: ?>>
    %25 = arith.index_cast %16 : i32 to index
    %26 = arith.addi %25, %c8 : index
    %27 = arith.index_cast %arg3 : i32 to index
    %28 = arith.minsi %26, %27 : index
    %29 = arith.subi %28, %25 : index
    %30 = arith.index_cast %17 : i32 to index
    %31 = arith.addi %30, %c8 : index
    %32 = arith.index_cast %arg4 : i32 to index
    %33 = arith.minsi %31, %32 : index
    %34 = arith.subi %33, %30 : index
    %35 = arith.minsi %29, %c8 : index
    %36 = arith.minsi %34, %c8 : index
    %subview = memref.subview %15#0[0, 0] [%35, %36] [1, 1] : memref<8x8xf64> to memref<?x?xf64, strided<[8, 1]>>
    %subview_8 = memref.subview %reinterpret_cast_7[0, 0] [%35, %36] [1, 1] : memref<8x8xf64, strided<[?, ?], offset: ?>> to memref<?x?xf64, strided<[?, ?], offset: ?>>
    memref.copy %subview, %subview_8 : memref<?x?xf64, strided<[8, 1]>> to memref<?x?xf64, strided<[?, ?], offset: ?>>
    memref.dealloc %15#0 : memref<8x8xf64>
    return
  }
}
