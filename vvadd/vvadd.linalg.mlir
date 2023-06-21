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
    %14 = bufferization.to_tensor %alloc_2 : memref<64xf32>
    %15 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%7, %14 : tensor<64xf32>, tensor<64xf32>) outs(%7 : tensor<64xf32>) {
    ^bb0(%in: f32, %in_7: f32, %out: f32):
      %22 = arith.addf %in, %in_7 : f32
      linalg.yield %22 : f32
    } -> tensor<64xf32>
    %16 = arith.index_cast %0 : i32 to index
    %reinterpret_cast_5 = memref.reinterpret_cast %arg2 to offset: [%16], sizes: [64], strides: [1] : memref<*xf32> to memref<64xf32, strided<[1], offset: ?>>
    %17 = arith.index_cast %0 : i32 to index
    %18 = arith.addi %17, %c64 : index
    %19 = arith.index_cast %arg3 : i32 to index
    %20 = arith.minsi %18, %19 : index // mask calculation
    %21 = arith.subi %20, %17 : index
    %extracted_slice = tensor.extract_slice %15[0] [%21] [1] : tensor<64xf32> to tensor<?xf32>
    %subview_6 = memref.subview %reinterpret_cast_5[0] [%21] [1] : memref<64xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    // memref.tensor_store bufferization interface is not yet added in the LLVM version 
    // mlir-air is using, so it's not bufferizable at the moment
    // should be lowered to memref.copy
    // memref.tensor_store %extracted_slice, %subview_6 : memref<?xf32, strided<[1], offset: ?>>
    
    // replacing it with to_memref and memref.copy works with conversion-based bufferization
    %22 = bufferization.to_memref %extracted_slice : memref<?xf32, strided<[1], offset: ?>>
    memref.copy %22, %subview_6 : memref<?xf32, strided<[1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
    return
  }
}

