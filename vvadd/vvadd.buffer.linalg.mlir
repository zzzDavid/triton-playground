#map = affine_map<(d0) -> (d0)>
module {
  func.func @kernel_0123(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: memref<*xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32) {
    %c64 = arith.constant 64 : index
    %c64_i32 = arith.constant 64 : i32
    %0 = arith.muli %arg4, %c64_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [64], strides: [1] : memref<*xf32> to memref<64xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<64xf32>
    %2 = arith.addi %1, %c64 : index
    %3 = arith.index_cast %arg3 : i32 to index
    %4 = arith.minsi %2, %3 : index
    %5 = arith.subi %4, %1 : index
    %subview = memref.subview %reinterpret_cast[0] [%5] [1] : memref<64xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%5] [1] : memref<64xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%1], sizes: [64], strides: [1] : memref<*xf32> to memref<64xf32, strided<[1], offset: ?>>
    %alloc_2 = memref.alloc() : memref<64xf32>
    %subview_3 = memref.subview %reinterpret_cast_1[0] [%5] [1] : memref<64xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_4 = memref.subview %alloc_2[0] [%5] [1] : memref<64xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview_3, %subview_4 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<64xf32>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%alloc, %alloc_2 : memref<64xf32>, memref<64xf32>) outs(%alloc_5 : memref<64xf32>) {
    ^bb0(%in: f32, %in_9: f32, %out: f32):
      %6 = arith.addf %in, %in_9 : f32
      linalg.yield %6 : f32
    }
    %reinterpret_cast_6 = memref.reinterpret_cast %arg2 to offset: [%1], sizes: [64], strides: [1] : memref<*xf32> to memref<64xf32, strided<[1], offset: ?>>
    %subview_7 = memref.subview %alloc_5[0] [%5] [1] : memref<64xf32> to memref<?xf32, strided<[1]>>
    %subview_8 = memref.subview %reinterpret_cast_6[0] [%5] [1] : memref<64xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    memref.copy %subview_7, %subview_8 : memref<?xf32, strided<[1]>> to memref<?xf32, strided<[1], offset: ?>>
    return
  }
}

