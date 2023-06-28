module attributes {torch.debug_module_name = "model"} {
  air.channel @channel_7 [1, 1]
  air.channel @channel_6 [1, 1]
  air.channel @channel_5 [1, 1]
  air.channel @channel_4 [1, 1]
  air.channel @channel_3 [1, 1]
  air.channel @channel_2 [1, 1]
  air.channel @channel_1 [1, 1]
  air.channel @channel_0 [1, 1]
  memref.global "private" @global_seed : memref<i64> = dense<0>
  func.func @forward(%arg0: memref<32x32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32x32xi32>, %arg3: memref<32x32xi32>) {
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1 = arith.constant 1 : index
    %c0_i32 = arith.constant 0 : i32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<32x32xi32>
    linalg.fill ins(%c0_i32 : i32) outs(%alloc : memref<32x32xi32>)
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<32x32xi32>
    memref.copy %alloc, %alloc_0 : memref<32x32xi32> to memref<32x32xi32>
    air.channel.put  @channel_0[%c0, %c0] (%arg0[%c0, %c0] [%c32, %c32] [%c32, %c1]) : (memref<32x32xi32>)
    air.channel.put  @channel_1[%c0, %c0] (%arg1[%c0, %c0] [%c32, %c32] [%c32, %c1]) : (memref<32x32xi32>)
    air.channel.put  @channel_2[%c0, %c0] (%alloc_0[%c0, %c0] [%c32, %c32] [%c32, %c1]) : (memref<32x32xi32>)
    air.channel.get  @channel_3[%c0, %c0] (%alloc_0[%c0, %c0] [%c32, %c32] [%c32, %c1]) : (memref<32x32xi32>)
    air.herd @herd_0  tile (%arg4, %arg5) in (%arg6=%c1, %arg7=%c1) {
      %alloc_2 = memref.alloc() : memref<32x32xi32, 2>
      %alloc_3 = memref.alloc() : memref<32x32xi32, 2>
      %alloc_4 = memref.alloc() : memref<32x32xi32, 2>
      air.channel.get  @channel_0[%arg4, %arg5] (%alloc_2[] [] []) : (memref<32x32xi32, 2>)
      air.channel.get  @channel_1[%arg4, %arg5] (%alloc_3[] [] []) : (memref<32x32xi32, 2>)
      air.channel.get  @channel_2[%arg4, %arg5] (%alloc_4[] [] []) : (memref<32x32xi32, 2>)
      linalg.matmul ins(%alloc_2, %alloc_3 : memref<32x32xi32, 2>, memref<32x32xi32, 2>) outs(%alloc_4 : memref<32x32xi32, 2>)
      air.channel.put  @channel_3[%arg4, %arg5] (%alloc_4[] [] []) : (memref<32x32xi32, 2>)
      memref.dealloc %alloc_2 : memref<32x32xi32, 2>
      memref.dealloc %alloc_3 : memref<32x32xi32, 2>
      memref.dealloc %alloc_4 : memref<32x32xi32, 2>
      air.herd_terminator
    }
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<32x32xi32>
    memref.copy %alloc, %alloc_1 : memref<32x32xi32> to memref<32x32xi32>
    air.channel.put  @channel_4[%c0, %c0] (%alloc_0[%c0, %c0] [%c32, %c32] [%c32, %c1]) : (memref<32x32xi32>)
    air.channel.put  @channel_5[%c0, %c0] (%arg2[%c0, %c0] [%c32, %c32] [%c32, %c1]) : (memref<32x32xi32>)
    air.channel.put  @channel_6[%c0, %c0] (%alloc_1[%c0, %c0] [%c32, %c32] [%c32, %c1]) : (memref<32x32xi32>)
    air.channel.get  @channel_7[%c0, %c0] (%alloc_1[%c0, %c0] [%c32, %c32] [%c32, %c1]) : (memref<32x32xi32>)
    air.herd @herd_1  tile (%arg4, %arg5) in (%arg6=%c1, %arg7=%c1) {
      %alloc_2 = memref.alloc() : memref<32x32xi32, 2>
      %alloc_3 = memref.alloc() : memref<32x32xi32, 2>
      %alloc_4 = memref.alloc() : memref<32x32xi32, 2>
      air.channel.get  @channel_4[%arg4, %arg5] (%alloc_2[] [] []) : (memref<32x32xi32, 2>)
      air.channel.get  @channel_5[%arg4, %arg5] (%alloc_3[] [] []) : (memref<32x32xi32, 2>)
      air.channel.get  @channel_6[%arg4, %arg5] (%alloc_4[] [] []) : (memref<32x32xi32, 2>)
      linalg.matmul ins(%alloc_2, %alloc_3 : memref<32x32xi32, 2>, memref<32x32xi32, 2>) outs(%alloc_4 : memref<32x32xi32, 2>)
      air.channel.put  @channel_7[%arg4, %arg5] (%alloc_4[] [] []) : (memref<32x32xi32, 2>)
      memref.dealloc %alloc_2 : memref<32x32xi32, 2>
      memref.dealloc %alloc_3 : memref<32x32xi32, 2>
      memref.dealloc %alloc_4 : memref<32x32xi32, 2>
      air.herd_terminator
    }
    memref.copy %alloc_1, %arg3 : memref<32x32xi32> to memref<32x32xi32>
    return
  }
}

