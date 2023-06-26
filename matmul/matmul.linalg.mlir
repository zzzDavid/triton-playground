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
    // %0 = tensor.empty() : tensor<128x256xf32>
    %0 = bufferization.alloc_tensor() : tensor<128x256xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<128x256xf32>) -> tensor<128x256xf32>
    %2 = arith.addi %arg3, %c127_i32 : i32
    %3 = arith.divsi %2, %c128_i32 : i32
    %4 = arith.addi %arg4, %c255_i32 : i32
    %5 = arith.divsi %4, %c256_i32 : i32
    %6 = arith.addi %arg5, %c63_i32 : i32
    %7 = arith.divsi %6, %c64_i32 : i32
    %8 = arith.muli %5, %c8_i32 : i32
    %9 = arith.divsi %arg12, %8 : i32
    %10 = arith.muli %9, %c8_i32 : i32
    %11 = arith.subi %3, %10 : i32
    %12 = arith.cmpi slt, %11, %c8_i32 : i32
    %13 = arith.select %12, %11, %c8_i32 : i32
    %14 = arith.remsi %arg12, %13 : i32
    %15 = arith.addi %10, %14 : i32
    %16 = arith.remsi %arg12, %8 : i32
    %17 = arith.divsi %16, %13 : i32
    %18 = arith.muli %15, %c128_i32 : i32
    %19 = arith.muli %17, %c256_i32 : i32
    %20 = arith.index_cast %18 : i32 to index
    %21 = arith.index_cast %arg6 : i32 to index
    %22 = arith.muli %20, %21 : index
    %23 = arith.index_cast %arg7 : i32 to index
    %24 = arith.index_cast %arg8 : i32 to index
    %25 = arith.index_cast %19 : i32 to index
    %26 = arith.index_cast %arg9 : i32 to index
    %27 = arith.muli %25, %26 : index
    %28 = arith.muli %arg7, %c64_i32 : i32
    %29 = arith.muli %arg8, %c64_i32 : i32
    %30 = arith.index_cast %7 : i32 to index
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%22], sizes: [128, 64], strides: [%21, %23] : memref<*xbf16> to memref<128x64xbf16, strided<[?, ?], offset: ?>>
    %reinterpret_cast_0 = memref.reinterpret_cast %arg1 to offset: [%27], sizes: [64, 256], strides: [%24, %26] : memref<*xbf16> to memref<64x256xbf16, strided<[?, ?], offset: ?>>
    %31:7 = scf.for %arg15 = %c0 to %30 step %c1 iter_args(%arg16 = %1, %arg17 = %reinterpret_cast, %arg18 = %reinterpret_cast_0, %arg19 = %22, %arg20 = %c0, %arg21 = %27, %arg22 = %c0) -> (tensor<128x256xf32>, memref<128x64xbf16, strided<[?, ?], offset: ?>>, memref<64x256xbf16, strided<[?, ?], offset: ?>>, index, index, index, index) {
      %alloc = memref.alloc() : memref<128x64xbf16>
      memref.copy %arg17, %alloc : memref<128x64xbf16, strided<[?, ?], offset: ?>> to memref<128x64xbf16>
      %53 = bufferization.to_tensor %alloc : memref<128x64xbf16>
      %alloc_2 = memref.alloc() : memref<64x256xbf16>
      memref.copy %arg18, %alloc_2 : memref<64x256xbf16, strided<[?, ?], offset: ?>> to memref<64x256xbf16>
      %54 = bufferization.to_tensor %alloc_2 : memref<64x256xbf16>
      // %55 = tensor.empty() : tensor<128x256xf32>
      %55 = bufferization.alloc_tensor() : tensor<128x256xf32>
      %56 = linalg.matmul ins(%53, %54 : tensor<128x64xbf16>, tensor<64x256xbf16>) outs(%55 : tensor<128x256xf32>) -> tensor<128x256xf32>
      %57 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%56, %1 : tensor<128x256xf32>, tensor<128x256xf32>) outs(%56 : tensor<128x256xf32>) {
      ^bb0(%in: f32, %in_5: f32, %out: f32):
        %65 = arith.addf %in, %in_5 : f32
        linalg.yield %65 : f32
      } -> tensor<128x256xf32>
      %58 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg16, %57 : tensor<128x256xf32>, tensor<128x256xf32>) outs(%arg16 : tensor<128x256xf32>) {
      ^bb0(%in: f32, %in_5: f32, %out: f32):
        %65 = arith.addf %in, %in_5 : f32
        linalg.yield %65 : f32
      } -> tensor<128x256xf32>
      %59 = arith.index_cast %28 : i32 to index
      %60 = arith.addi %arg19, %59 : index
      %61 = arith.addi %60, %arg20 : index
      %reinterpret_cast_3 = memref.reinterpret_cast %arg0 to offset: [%61], sizes: [128, 64], strides: [%21, %23] : memref<*xbf16> to memref<128x64xbf16, strided<[?, ?], offset: ?>>
      %62 = arith.index_cast %29 : i32 to index
      %63 = arith.addi %arg21, %62 : index
      %64 = arith.addi %63, %arg22 : index
      %reinterpret_cast_4 = memref.reinterpret_cast %arg1 to offset: [%64], sizes: [64, 256], strides: [%24, %26] : memref<*xbf16> to memref<64x256xbf16, strided<[?, ?], offset: ?>>
      scf.yield %58, %reinterpret_cast_3, %reinterpret_cast_4, %61, %c0, %64, %c0 : tensor<128x256xf32>, memref<128x64xbf16, strided<[?, ?], offset: ?>>, memref<64x256xbf16, strided<[?, ?], offset: ?>>, index, index, index, index
    }
    // %32 = tensor.empty() : tensor<128x256xbf16>
    %32 = bufferization.alloc_tensor() : tensor<128x256xbf16>
    %33 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%31#0 : tensor<128x256xf32>) outs(%32 : tensor<128x256xbf16>) {
    ^bb0(%in: f32, %out: bf16):
      %53 = arith.truncf %in : f32 to bf16
      linalg.yield %53 : bf16
    } -> tensor<128x256xbf16>
    %34 = arith.index_cast %arg10 : i32 to index
    %35 = arith.index_cast %18 : i32 to index
    %36 = arith.muli %35, %34 : index
    %37 = arith.index_cast %arg11 : i32 to index
    %38 = arith.index_cast %19 : i32 to index
    %39 = arith.muli %38, %37 : index
    %40 = arith.addi %36, %39 : index
    %reinterpret_cast_1 = memref.reinterpret_cast %arg2 to offset: [%40], sizes: [128, 256], strides: [%34, %37] : memref<*xbf16> to memref<128x256xbf16, strided<[?, ?], offset: ?>>
    %41 = arith.index_cast %18 : i32 to index
    %42 = arith.addi %41, %c128 : index
    %43 = arith.index_cast %arg3 : i32 to index
    %44 = arith.minsi %42, %43 : index
    %45 = arith.subi %44, %41 : index
    %46 = arith.index_cast %19 : i32 to index
    %47 = arith.addi %46, %c256 : index
    %48 = arith.index_cast %arg4 : i32 to index
    %49 = arith.minsi %47, %48 : index
    %50 = arith.subi %49, %46 : index
    %51 = arith.minsi %45, %c128 : index
    %52 = arith.minsi %50, %c256 : index
    %extracted_slice = tensor.extract_slice %33[0, 0] [%51, %52] [1, 1] : tensor<128x256xbf16> to tensor<?x?xbf16>
    %subview = memref.subview %reinterpret_cast_1[0, 0] [%51, %52] [1, 1] : memref<128x256xbf16, strided<[?, ?], offset: ?>> to memref<?x?xbf16, strided<[?, ?], offset: ?>>
    // memref.tensor_store %extracted_slice, %subview : memref<?x?xbf16, strided<[?, ?], offset: ?>>
    %53 = bufferization.to_memref %extracted_slice : memref<?x?xbf16, strided<[?, ?], offset: ?>>
    memref.copy %53, %subview : memref<?x?xbf16, strided<[?, ?], offset: ?>> to memref<?x?xbf16, strided<[?, ?], offset: ?>>
    return
  }
}

