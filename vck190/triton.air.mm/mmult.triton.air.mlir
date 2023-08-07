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
    %16 = arith.muli %14, %c8_i32 : i32
    %17 = arith.muli %15, %c8_i32 : i32
    %18 = arith.index_cast %16 : i32 to index
    %19 = arith.index_cast %arg6 : i32 to index
    %20 = arith.muli %18, %19 : index
    %21 = arith.index_cast %arg7 : i32 to index
    %22 = arith.index_cast %arg8 : i32 to index
    %23 = arith.index_cast %17 : i32 to index
    %24 = arith.index_cast %arg9 : i32 to index
    %25 = arith.muli %23, %24 : index
    %26 = arith.divsi %arg5, %c8_i32 : i32
    %27 = arith.index_cast %26 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%20], sizes: [8, 8], strides: [%19, %21] : memref<*xf64> to memref<8x8xf64, strided<[?, ?], offset: ?>>
    %reinterpret_cast_0 = memref.reinterpret_cast %arg1 to offset: [%25], sizes: [8, 8], strides: [%22, %24] : memref<*xf64> to memref<8x8xf64, strided<[?, ?], offset: ?>>
    %alloc_1 = memref.alloc() : memref<8x8xf64>
    memref.copy %alloc, %alloc_1 : memref<8x8xf64> to memref<8x8xf64>
    %alloc_2 = memref.alloc() : memref<8x8xf64>
    %alloc_3 = memref.alloc() : memref<8x8xf64>
    %alloc_4 = memref.alloc() {alignment = 64 : i64} : memref<8x8xf64>
    %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<8x8xf64>
    %alloc_6 = memref.alloc() {alignment = 64 : i64} : memref<8x8xf64>
    %28:5 = scf.for %arg15 = %c0 to %27 step %c1 iter_args(%arg16 = %alloc_1, %arg17 = %20, %arg18 = %c0, %arg19 = %25, %arg20 = %c0) -> (memref<8x8xf64>, index, index, index, index) {
      %50 = arith.muli %arg15, %c8 : index
      %51 = arith.index_cast %50 : index to i32
      %52 = arith.subi %arg5, %51 : i32
      %53 = arith.index_cast %52 : i32 to index
      %54 = arith.minsi %53, %c8 : index
      %subview_9 = memref.subview %reinterpret_cast[0, 0] [8, %54] [1, 1] : memref<8x8xf64, strided<[?, ?], offset: ?>> to memref<8x?xf64, strided<[?, ?], offset: ?>>
      %subview_10 = memref.subview %alloc_2[0, 0] [8, %54] [1, 1] : memref<8x8xf64> to memref<8x?xf64, strided<[8, 1]>>
      %55 = arith.cmpi slt, %54, %c8 : index
      scf.if %55 {
        scf.for %arg21 = %c0 to %c8 step %c1 {
          scf.for %arg22 = %c0 to %c8 step %c1 {
            memref.store %cst, %alloc_2[%arg21, %arg22] : memref<8x8xf64>
          }
        }
      }
      memref.copy %subview_9, %subview_10 : memref<8x?xf64, strided<[?, ?], offset: ?>> to memref<8x?xf64, strided<[8, 1]>>
      %56 = arith.muli %arg15, %c8 : index
      %57 = arith.index_cast %56 : index to i32
      %58 = arith.subi %arg5, %57 : i32
      %59 = arith.index_cast %58 : i32 to index
      %60 = arith.minsi %59, %c8 : index
      %subview_11 = memref.subview %reinterpret_cast_0[0, 0] [%60, 8] [1, 1] : memref<8x8xf64, strided<[?, ?], offset: ?>> to memref<?x8xf64, strided<[?, ?], offset: ?>>
      %subview_12 = memref.subview %alloc_3[0, 0] [%60, 8] [1, 1] : memref<8x8xf64> to memref<?x8xf64, strided<[8, 1]>>
      %61 = arith.cmpi slt, %60, %c8 : index
      scf.if %61 {
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
            %70 = memref.load %alloc_2[%arg21, %arg23] : memref<8x8xf64>
            %71 = memref.load %alloc_3[%arg23, %arg22] : memref<8x8xf64>
            %72 = memref.load %alloc_5[%arg21, %arg22] : memref<8x8xf64>
            %73 = arith.mulf %70, %71 : f64
            %74 = arith.addf %72, %73 : f64
            memref.store %74, %alloc_5[%arg21, %arg22] : memref<8x8xf64>
          }
        }
      }
      memref.dealloc %alloc_3 : memref<8x8xf64>
      memref.dealloc %alloc_2 : memref<8x8xf64>
      scf.for %arg21 = %c0 to %c8 step %c1 {
        scf.for %arg22 = %c0 to %c8 step %c1 {
          %70 = memref.load %alloc_5[%arg21, %arg22] : memref<8x8xf64>
          %71 = memref.load %alloc[%arg21, %arg22] : memref<8x8xf64>
          %72 = arith.addf %70, %71 : f64
          memref.store %72, %alloc_6[%arg21, %arg22] : memref<8x8xf64>
        }
      }
      memref.dealloc %alloc_5 : memref<8x8xf64>
      %alloc_13 = memref.alloc() {alignment = 64 : i64} : memref<8x8xf64>
      scf.for %arg21 = %c0 to %c8 step %c1 {
        scf.for %arg22 = %c0 to %c8 step %c1 {
          %70 = memref.load %arg16[%arg21, %arg22] : memref<8x8xf64>
          %71 = memref.load %alloc_6[%arg21, %arg22] : memref<8x8xf64>
          %72 = arith.addf %70, %71 : f64
          memref.store %72, %alloc_13[%arg21, %arg22] : memref<8x8xf64>
        }
      }
      memref.dealloc %arg16 : memref<8x8xf64>
      memref.dealloc %alloc_6 : memref<8x8xf64>
      %62 = arith.muli %arg7, %c8_i32 : i32
      %63 = arith.index_cast %62 : i32 to index
      %64 = arith.addi %arg17, %63 : index
      %65 = arith.addi %64, %arg18 : index
      %66 = arith.muli %arg8, %c8_i32 : i32
      %67 = arith.index_cast %66 : i32 to index
      %68 = arith.addi %arg19, %67 : index
      %69 = arith.addi %68, %arg20 : index
      %alloc_14 = memref.alloc() : memref<8x8xf64>
      memref.copy %alloc_13, %alloc_14 : memref<8x8xf64> to memref<8x8xf64>
      memref.dealloc %alloc_13 : memref<8x8xf64>
      scf.yield %alloc_14, %65, %c0, %69, %c0 : memref<8x8xf64>, index, index, index, index
    }
    memref.dealloc %alloc : memref<8x8xf64>
    %29 = arith.muli %14, %c8_i32 : i32
    %30 = arith.muli %15, %c8_i32 : i32
    %31 = arith.index_cast %arg10 : i32 to index
    %32 = arith.index_cast %29 : i32 to index
    %33 = arith.muli %32, %31 : index
    %34 = arith.index_cast %arg11 : i32 to index
    %35 = arith.index_cast %30 : i32 to index
    %36 = arith.muli %35, %34 : index
    %37 = arith.addi %33, %36 : index
    %reinterpret_cast_7 = memref.reinterpret_cast %arg2 to offset: [%37], sizes: [8, 8], strides: [%31, %34] : memref<*xf64> to memref<8x8xf64, strided<[?, ?], offset: ?>>
    %38 = arith.index_cast %29 : i32 to index
    %39 = arith.addi %38, %c8 : index
    %40 = arith.index_cast %arg3 : i32 to index
    %41 = arith.minsi %39, %40 : index
    %42 = arith.subi %41, %38 : index
    %43 = arith.index_cast %30 : i32 to index
    %44 = arith.addi %43, %c8 : index
    %45 = arith.index_cast %arg4 : i32 to index
    %46 = arith.minsi %44, %45 : index
    %47 = arith.subi %46, %43 : index
    %48 = arith.minsi %42, %c8 : index
    %49 = arith.minsi %47, %c8 : index
    %subview = memref.subview %28#0[0, 0] [%48, %49] [1, 1] : memref<8x8xf64> to memref<?x?xf64, strided<[8, 1]>>
    %subview_8 = memref.subview %reinterpret_cast_7[0, 0] [%48, %49] [1, 1] : memref<8x8xf64, strided<[?, ?], offset: ?>> to memref<?x?xf64, strided<[?, ?], offset: ?>>
    memref.copy %subview, %subview_8 : memref<?x?xf64, strided<[8, 1]>> to memref<?x?xf64, strided<[?, ?], offset: ?>>
    memref.dealloc %28#0 : memref<8x8xf64>
    return
  }
}
