#map = affine_map<(d0) -> (d0)>
module {
  func.func @kernel_0123(%arg0: memref<*xf32>, %arg1: memref<*xf32>, %arg2: memref<*xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32) {
    %c64 = arith.constant 64 : index
    %c64_i32 = arith.constant 64 : i32
    %0 = arith.muli %arg4, %c64_i32 : i32
    %1 = arith.index_cast %0 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%1], sizes: [64], strides: [1] : memref<*xf32> to memref<64xf32, strided<[1], offset: ?>>
    %alloc = memref.alloc() : memref<64xf32>
    %2 = arith.index_cast %0 : i32 to index
    %3 = arith.addi %2, %c64 : index
    %4 = arith.index_cast %arg3 : i32 to index
    %5 = arith.minsi %3, %4 : index
    %6 = arith.subi %5, %2 : index
    %subview = memref.subview %reinterpret_cast[0] [%6] [1] : memref<64xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_0 = memref.subview %alloc[0] [%6] [1] : memref<64xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview, %subview_0 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    %7 = bufferization.to_tensor %alloc : memref<64xf32>
    %8 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg1 to offset: [%8], sizes: [64], strides: [1] : memref<*xf32> to memref<64xf32, strided<[1], offset: ?>>
    %alloc_2 = memref.alloc() : memref<64xf32>
    %9 = arith.index_cast %0 : i32 to index
    %10 = arith.addi %9, %c64 : index
    %11 = arith.index_cast %arg3 : i32 to index
    %12 = arith.minsi %10, %11 : index
    %13 = arith.subi %12, %9 : index
    %subview_3 = memref.subview %reinterpret_cast_1[0] [%13] [1] : memref<64xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    %subview_4 = memref.subview %alloc_2[0] [%13] [1] : memref<64xf32> to memref<?xf32, strided<[1]>>
    memref.copy %subview_3, %subview_4 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1]>>
    // %14 = bufferization.to_tensor %alloc_2 : memref<64xf32>
    %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<64xf32>
    // %15 = bufferization.to_tensor %alloc_5 : memref<64xf32>
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%alloc, %alloc_2 : memref<64xf32>, memref<64xf32>) outs(%alloc_5 : memref<64xf32>) {
    ^bb0(%in: f32, %in_8: f32, %out: f32):
      %23 = arith.addf %in, %in_8 : f32
      linalg.yield %23 : f32
    }
    // %16 = bufferization.to_tensor %alloc_5 : memref<64xf32>
    // %17 = arith.index_cast %0 : i32 to index
    // %reinterpret_cast_6 = memref.reinterpret_cast %arg2 to offset: [%17], sizes: [64], strides: [1] : memref<*xf32> to memref<64xf32, strided<[1], offset: ?>>
    // %18 = arith.index_cast %0 : i32 to index
    // %19 = arith.addi %18, %c64 : index
    // %20 = arith.index_cast %arg3 : i32 to index
    // %21 = arith.minsi %19, %20 : index
    // %22 = arith.subi %21, %18 : index
    // %extracted_slice = tensor.extract_slice %16[0] [%22] [1] : tensor<64xf32> to tensor<?xf32>
    // %subview_7 = memref.subview %reinterpret_cast_6[0] [%22] [1] : memref<64xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    // memref.tensor_store %extracted_slice, %subview_7 : memref<?xf32, strided<[1], offset: ?>>
    return
  }
}

