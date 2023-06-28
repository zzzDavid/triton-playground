; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@assert_msg_1 = private constant [40 x i8] c"Awaited async operand is in error state\00"
@assert_msg_0 = private constant [40 x i8] c"Awaited async operand is in error state\00"
@channel_0 = private global i64 0

declare ptr @malloc(i64)

declare void @free(ptr)

declare void @abort()

declare void @puts(ptr)

declare ptr @aligned_alloc(i64, i64)

define void @forward(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8) {
  %10 = call ptr @async_execute_fn()
  %11 = call ptr @async_execute_fn_0(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8)
  call void @mlirAsyncRuntimeAwaitToken(ptr %10)
  %12 = call i1 @mlirAsyncRuntimeIsTokenError(ptr %10)
  call void @mlirAsyncRuntimeDropRef(ptr %10, i64 1)
  %13 = xor i1 %12, true
  br i1 %13, label %14, label %18

14:                                               ; preds = %9
  call void @mlirAsyncRuntimeAwaitToken(ptr %11)
  %15 = call i1 @mlirAsyncRuntimeIsTokenError(ptr %11)
  call void @mlirAsyncRuntimeDropRef(ptr %11, i64 1)
  %16 = xor i1 %15, true
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  ret void

18:                                               ; preds = %9
  call void @puts(ptr @assert_msg_0)
  call void @abort()
  unreachable

19:                                               ; preds = %14
  call void @puts(ptr @assert_msg_1)
  call void @abort()
  unreachable
}

define void @_mlir_ciface_forward(ptr %0) {
  %2 = load { ptr, ptr, i64, [3 x i64], [3 x i64] }, ptr %0, align 8
  %3 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %2, 0
  %4 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %2, 1
  %5 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %2, 2
  %6 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %2, 3, 0
  %7 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %2, 3, 1
  %8 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %2, 3, 2
  %9 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %2, 4, 0
  %10 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %2, 4, 1
  %11 = extractvalue { ptr, ptr, i64, [3 x i64], [3 x i64] } %2, 4, 2
  call void @forward(ptr %3, ptr %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11)
  ret void
}

define void @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr %0, ptr %1, i64 %2, ptr %3, ptr %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, i64 %14, i64 %15) {
  %17 = insertvalue { ptr, ptr, i64 } undef, ptr %0, 0
  %18 = insertvalue { ptr, ptr, i64 } %17, ptr %1, 1
  %19 = insertvalue { ptr, ptr, i64 } %18, i64 %2, 2
  %20 = alloca { ptr, ptr, i64 }, i64 1, align 8
  store { ptr, ptr, i64 } %19, ptr %20, align 8
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %3, 0
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, ptr %4, 1
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 %5, 2
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 %6, 3, 0
  %25 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, i64 %8, 4, 0
  %26 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %25, i64 %7, 3, 1
  %27 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %26, i64 %9, 4, 1
  %28 = alloca { ptr, ptr, i64, [2 x i64], [2 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [2 x i64], [2 x i64] } %27, ptr %28, align 8
  call void @_mlir_ciface_air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr %20, ptr %28, i64 %10, i64 %11, i64 %12, i64 %13, i64 %14, i64 %15)
  ret void
}

declare void @_mlir_ciface_air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr, ptr, i64, i64, i64, i64, i64, i64)

define void @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr %0, ptr %1, i64 %2, ptr %3, ptr %4, i64 %5, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, i64 %14, i64 %15) {
  %17 = insertvalue { ptr, ptr, i64 } undef, ptr %0, 0
  %18 = insertvalue { ptr, ptr, i64 } %17, ptr %1, 1
  %19 = insertvalue { ptr, ptr, i64 } %18, i64 %2, 2
  %20 = alloca { ptr, ptr, i64 }, i64 1, align 8
  store { ptr, ptr, i64 } %19, ptr %20, align 8
  %21 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } undef, ptr %3, 0
  %22 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, ptr %4, 1
  %23 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %22, i64 %5, 2
  %24 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %23, i64 %6, 3, 0
  %25 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %24, i64 %8, 4, 0
  %26 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %25, i64 %7, 3, 1
  %27 = insertvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %26, i64 %9, 4, 1
  %28 = alloca { ptr, ptr, i64, [2 x i64], [2 x i64] }, i64 1, align 8
  store { ptr, ptr, i64, [2 x i64], [2 x i64] } %27, ptr %28, align 8
  call void @_mlir_ciface_air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr %20, ptr %28, i64 %10, i64 %11, i64 %12, i64 %13, i64 %14, i64 %15)
  ret void
}

declare void @_mlir_ciface_air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr, ptr, i64, i64, i64, i64, i64, i64)

; Function Attrs: presplitcoroutine
define ptr @async_execute_fn() #0 {
  %1 = call ptr @mlirAsyncRuntimeCreateToken()
  %2 = call token @llvm.coro.id(i32 0, ptr null, ptr null, ptr null)
  %3 = call i64 @llvm.coro.size.i64()
  %4 = call i64 @llvm.coro.align.i64()
  %5 = add i64 %3, %4
  %6 = sub i64 %5, 1
  %7 = sub i64 0, %4
  %8 = and i64 %6, %7
  %9 = call ptr @aligned_alloc(i64 %4, i64 %8)
  %10 = call ptr @llvm.coro.begin(token %2, ptr %9)
  %11 = call token @llvm.coro.save(ptr %10)
  call void @mlirAsyncRuntimeExecute(ptr %10, ptr @__resume)
  %12 = call i8 @llvm.coro.suspend(token %11, i1 false)
  %13 = sext i8 %12 to i32
  switch i32 %13, label %40 [
    i32 0, label %14
    i32 1, label %38
  ]

14:                                               ; preds = %0
  br label %15

15:                                               ; preds = %35, %14
  %16 = phi i64 [ %36, %35 ], [ 0, %14 ]
  %17 = icmp slt i64 %16, 32
  br i1 %17, label %18, label %37

18:                                               ; preds = %15
  %19 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1024) to i64))
  %20 = trunc i64 %16 to i32
  br label %21

21:                                               ; preds = %33, %18
  %22 = phi i64 [ %34, %33 ], [ 0, %18 ]
  %23 = icmp slt i64 %22, 32
  br i1 %23, label %24, label %35

24:                                               ; preds = %21
  br label %25

25:                                               ; preds = %28, %24
  %26 = phi i64 [ %32, %28 ], [ 0, %24 ]
  %27 = icmp slt i64 %26, 32
  br i1 %27, label %28, label %33

28:                                               ; preds = %25
  %29 = mul i64 %22, 32
  %30 = add i64 %29, %26
  %31 = getelementptr i32, ptr %19, i64 %30
  store i32 %20, ptr %31, align 4
  %32 = add i64 %26, 1
  br label %25

33:                                               ; preds = %25
  %34 = add i64 %22, 1
  br label %21

35:                                               ; preds = %21
  call void @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_0, i64 0, ptr %19, ptr %19, i64 0, i64 32, i64 32, i64 32, i64 1, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  call void @free(ptr %19)
  %36 = add i64 %16, 1
  br label %15

37:                                               ; preds = %15
  call void @mlirAsyncRuntimeEmplaceToken(ptr %1)
  br label %38

38:                                               ; preds = %37, %0
  %39 = call ptr @llvm.coro.free(token %2, ptr %10)
  call void @free(ptr %39)
  br label %40

40:                                               ; preds = %38, %0
  %41 = call i1 @llvm.coro.end(ptr %10, i1 false)
  ret ptr %1
}

; Function Attrs: presplitcoroutine
define ptr @async_execute_fn_0(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7, i64 %8) #0 {
  %10 = call ptr @mlirAsyncRuntimeCreateToken()
  %11 = call token @llvm.coro.id(i32 0, ptr null, ptr null, ptr null)
  %12 = call i64 @llvm.coro.size.i64()
  %13 = call i64 @llvm.coro.align.i64()
  %14 = add i64 %12, %13
  %15 = sub i64 %14, 1
  %16 = sub i64 0, %13
  %17 = and i64 %15, %16
  %18 = call ptr @aligned_alloc(i64 %13, i64 %17)
  %19 = call ptr @llvm.coro.begin(token %11, ptr %18)
  %20 = call token @llvm.coro.save(ptr %19)
  call void @mlirAsyncRuntimeExecute(ptr %19, ptr @__resume)
  %21 = call i8 @llvm.coro.suspend(token %20, i1 false)
  %22 = sext i8 %21 to i32
  switch i32 %22, label %53 [
    i32 0, label %23
    i32 1, label %51
  ]

23:                                               ; preds = %9
  br label %24

24:                                               ; preds = %48, %23
  %25 = phi i64 [ %49, %48 ], [ 0, %23 ]
  %26 = icmp slt i64 %25, 32
  br i1 %26, label %27, label %50

27:                                               ; preds = %24
  %28 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1024) to i64))
  call void @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_0, i64 0, ptr %28, ptr %28, i64 0, i64 32, i64 32, i64 32, i64 1, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  br label %29

29:                                               ; preds = %46, %27
  %30 = phi i64 [ %47, %46 ], [ 0, %27 ]
  %31 = icmp slt i64 %30, 32
  br i1 %31, label %32, label %48

32:                                               ; preds = %29
  br label %33

33:                                               ; preds = %36, %32
  %34 = phi i64 [ %45, %36 ], [ 0, %32 ]
  %35 = icmp slt i64 %34, 32
  br i1 %35, label %36, label %46

36:                                               ; preds = %33
  %37 = mul i64 %30, 32
  %38 = add i64 %37, %34
  %39 = getelementptr i32, ptr %28, i64 %38
  %40 = load i32, ptr %39, align 4
  %41 = mul i64 %25, 1024
  %42 = add i64 %41, %37
  %43 = add i64 %42, %34
  %44 = getelementptr i32, ptr %1, i64 %43
  store i32 %40, ptr %44, align 4
  %45 = add i64 %34, 1
  br label %33

46:                                               ; preds = %33
  %47 = add i64 %30, 1
  br label %29

48:                                               ; preds = %29
  call void @free(ptr %28)
  %49 = add i64 %25, 1
  br label %24

50:                                               ; preds = %24
  call void @mlirAsyncRuntimeEmplaceToken(ptr %10)
  br label %51

51:                                               ; preds = %50, %9
  %52 = call ptr @llvm.coro.free(token %11, ptr %19)
  call void @free(ptr %52)
  br label %53

53:                                               ; preds = %51, %9
  %54 = call i1 @llvm.coro.end(ptr %19, i1 false)
  ret ptr %10
}

declare void @mlirAsyncRuntimeAddRef(ptr, i64)

declare void @mlirAsyncRuntimeDropRef(ptr, i64)

declare ptr @mlirAsyncRuntimeCreateToken()

declare ptr @mlirAsyncRuntimeCreateValue(i64)

declare ptr @mlirAsyncRuntimeCreateGroup(i64)

declare void @mlirAsyncRuntimeEmplaceToken(ptr)

declare void @mlirAsyncRuntimeEmplaceValue(ptr)

declare void @mlirAsyncRuntimeSetTokenError(ptr)

declare void @mlirAsyncRuntimeSetValueError(ptr)

declare i1 @mlirAsyncRuntimeIsTokenError(ptr)

declare i1 @mlirAsyncRuntimeIsValueError(ptr)

declare i1 @mlirAsyncRuntimeIsGroupError(ptr)

declare void @mlirAsyncRuntimeAwaitToken(ptr)

declare void @mlirAsyncRuntimeAwaitValue(ptr)

declare void @mlirAsyncRuntimeAwaitAllInGroup(ptr)

declare void @mlirAsyncRuntimeExecute(ptr, ptr)

declare ptr @mlirAsyncRuntimeGetValueStorage(ptr)

declare i64 @mlirAsyncRuntimeAddTokenToGroup(ptr, ptr)

declare void @mlirAsyncRuntimeAwaitTokenAndExecute(ptr, ptr, ptr)

declare void @mlirAsyncRuntimeAwaitValueAndExecute(ptr, ptr, ptr)

declare void @mlirAsyncRuntimeAwaitAllInGroupAndExecute(ptr, ptr, ptr)

declare i64 @mlirAsyncRuntimGetNumWorkerThreads()

define void @__resume(ptr %0) {
  call void @llvm.coro.resume(ptr %0)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare token @llvm.coro.id(i32, ptr readnone, ptr nocapture readonly, ptr) #1

; Function Attrs: nounwind memory(none)
declare i64 @llvm.coro.size.i64() #2

; Function Attrs: nounwind memory(none)
declare i64 @llvm.coro.align.i64() #2

; Function Attrs: nounwind
declare ptr @llvm.coro.begin(token, ptr writeonly) #3

; Function Attrs: nomerge nounwind
declare token @llvm.coro.save(ptr) #4

; Function Attrs: nounwind
declare i8 @llvm.coro.suspend(token, i1) #3

; Function Attrs: nounwind memory(argmem: read)
declare ptr @llvm.coro.free(token, ptr nocapture readonly) #5

; Function Attrs: nounwind
declare i1 @llvm.coro.end(ptr, i1) #3

declare void @llvm.coro.resume(ptr)

attributes #0 = { presplitcoroutine }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) }
attributes #2 = { nounwind memory(none) }
attributes #3 = { nounwind }
attributes #4 = { nomerge nounwind }
attributes #5 = { nounwind memory(argmem: read) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
