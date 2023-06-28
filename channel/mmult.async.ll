; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

@assert_msg_1 = private constant [40 x i8] c"Awaited async operand is in error state\00"
@assert_msg_0 = private constant [40 x i8] c"Awaited async operand is in error state\00"
@channel_7 = private global i64 0
@channel_6 = private global i64 0
@channel_5 = private global i64 0
@channel_4 = private global i64 0
@channel_3 = private global i64 0
@channel_2 = private global i64 0
@channel_1 = private global i64 0
@channel_0 = private global i64 0

declare ptr @malloc(i64)

declare void @free(ptr)

declare void @abort()

declare void @puts(ptr)

declare ptr @aligned_alloc(i64, i64)

define void @forward(ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, ptr %7, ptr %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, ptr %14, ptr %15, i64 %16, i64 %17, i64 %18, i64 %19, i64 %20, ptr %21, ptr %22, i64 %23, i64 %24, i64 %25, i64 %26, i64 %27) {
  %29 = call ptr @malloc(i64 add (i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1024) to i64), i64 64))
  %30 = ptrtoint ptr %29 to i64
  %31 = add i64 %30, 63
  %32 = urem i64 %31, 64
  %33 = sub i64 %31, %32
  %34 = inttoptr i64 %33 to ptr
  br label %35

35:                                               ; preds = %47, %28
  %36 = phi i64 [ %48, %47 ], [ 0, %28 ]
  %37 = icmp slt i64 %36, 32
  br i1 %37, label %38, label %49

38:                                               ; preds = %35
  br label %39

39:                                               ; preds = %42, %38
  %40 = phi i64 [ %46, %42 ], [ 0, %38 ]
  %41 = icmp slt i64 %40, 32
  br i1 %41, label %42, label %47

42:                                               ; preds = %39
  %43 = mul i64 %36, 32
  %44 = add i64 %43, %40
  %45 = getelementptr i32, ptr %34, i64 %44
  store i32 0, ptr %45, align 4
  %46 = add i64 %40, 1
  br label %39

47:                                               ; preds = %39
  %48 = add i64 %36, 1
  br label %35

49:                                               ; preds = %35
  %50 = call ptr @malloc(i64 add (i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1024) to i64), i64 64))
  %51 = ptrtoint ptr %50 to i64
  %52 = add i64 %51, 63
  %53 = urem i64 %52, 64
  %54 = sub i64 %52, %53
  %55 = inttoptr i64 %54 to ptr
  call void @llvm.memcpy.p0.p0.i64(ptr %55, ptr %34, i64 mul (i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i64 1024), i1 false)
  call void @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_0, i64 0, ptr %0, ptr %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  call void @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_1, i64 0, ptr %7, ptr %8, i64 %9, i64 %10, i64 %11, i64 %12, i64 %13, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  call void @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_2, i64 0, ptr %50, ptr %55, i64 0, i64 32, i64 32, i64 32, i64 1, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  %56 = call ptr @async_execute_fn()
  call void @mlirAsyncRuntimeAwaitToken(ptr %56)
  %57 = call i1 @mlirAsyncRuntimeIsTokenError(ptr %56)
  call void @mlirAsyncRuntimeDropRef(ptr %56, i64 1)
  %58 = xor i1 %57, true
  br i1 %58, label %59, label %71

59:                                               ; preds = %49
  %60 = call ptr @malloc(i64 add (i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1024) to i64), i64 64))
  %61 = ptrtoint ptr %60 to i64
  %62 = add i64 %61, 63
  %63 = urem i64 %62, 64
  %64 = sub i64 %62, %63
  %65 = inttoptr i64 %64 to ptr
  call void @llvm.memcpy.p0.p0.i64(ptr %65, ptr %34, i64 mul (i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i64 1024), i1 false)
  call void @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_3, i64 0, ptr %50, ptr %55, i64 0, i64 32, i64 32, i64 32, i64 1, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  call void @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_4, i64 0, ptr %50, ptr %55, i64 0, i64 32, i64 32, i64 32, i64 1, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  call void @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_5, i64 0, ptr %14, ptr %15, i64 %16, i64 %17, i64 %18, i64 %19, i64 %20, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  call void @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_6, i64 0, ptr %60, ptr %65, i64 0, i64 32, i64 32, i64 32, i64 1, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  %66 = call ptr @async_execute_fn_0()
  call void @mlirAsyncRuntimeAwaitToken(ptr %66)
  %67 = call i1 @mlirAsyncRuntimeIsTokenError(ptr %66)
  call void @mlirAsyncRuntimeDropRef(ptr %66, i64 1)
  %68 = xor i1 %67, true
  br i1 %68, label %69, label %72

69:                                               ; preds = %59
  call void @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_7, i64 0, ptr %60, ptr %65, i64 0, i64 32, i64 32, i64 32, i64 1, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  %70 = getelementptr i32, ptr %22, i64 %23
  call void @llvm.memcpy.p0.p0.i64(ptr %70, ptr %65, i64 mul (i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1) to i64), i64 1024), i1 false)
  ret void

71:                                               ; preds = %49
  call void @puts(ptr @assert_msg_0)
  call void @abort()
  unreachable

72:                                               ; preds = %59
  call void @puts(ptr @assert_msg_1)
  call void @abort()
  unreachable
}

define void @_mlir_ciface_forward(ptr %0, ptr %1, ptr %2, ptr %3) {
  %5 = load { ptr, ptr, i64, [2 x i64], [2 x i64] }, ptr %0, align 8
  %6 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, 0
  %7 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, 1
  %8 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, 2
  %9 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, 3, 0
  %10 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, 3, 1
  %11 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, 4, 0
  %12 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %5, 4, 1
  %13 = load { ptr, ptr, i64, [2 x i64], [2 x i64] }, ptr %1, align 8
  %14 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, 0
  %15 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, 1
  %16 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, 2
  %17 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, 3, 0
  %18 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, 3, 1
  %19 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, 4, 0
  %20 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %13, 4, 1
  %21 = load { ptr, ptr, i64, [2 x i64], [2 x i64] }, ptr %2, align 8
  %22 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, 0
  %23 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, 1
  %24 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, 2
  %25 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, 3, 0
  %26 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, 3, 1
  %27 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, 4, 0
  %28 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %21, 4, 1
  %29 = load { ptr, ptr, i64, [2 x i64], [2 x i64] }, ptr %3, align 8
  %30 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, 0
  %31 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, 1
  %32 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, 2
  %33 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, 3, 0
  %34 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, 3, 1
  %35 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, 4, 0
  %36 = extractvalue { ptr, ptr, i64, [2 x i64], [2 x i64] } %29, 4, 1
  call void @forward(ptr %6, ptr %7, i64 %8, i64 %9, i64 %10, i64 %11, i64 %12, ptr %14, ptr %15, i64 %16, i64 %17, i64 %18, i64 %19, i64 %20, ptr %22, ptr %23, i64 %24, i64 %25, i64 %26, i64 %27, i64 %28, ptr %30, ptr %31, i64 %32, i64 %33, i64 %34, i64 %35, i64 %36)
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
  switch i32 %13, label %51 [
    i32 0, label %14
    i32 1, label %49
  ]

14:                                               ; preds = %0
  %15 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1024) to i64))
  %16 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1024) to i64))
  %17 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1024) to i64))
  call void @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_0, i64 0, ptr %15, ptr %15, i64 0, i64 32, i64 32, i64 32, i64 1, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  call void @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_1, i64 0, ptr %16, ptr %16, i64 0, i64 32, i64 32, i64 32, i64 1, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  call void @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_2, i64 0, ptr %17, ptr %17, i64 0, i64 32, i64 32, i64 32, i64 1, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  br label %18

18:                                               ; preds = %46, %14
  %19 = phi i64 [ %47, %46 ], [ 0, %14 ]
  %20 = icmp slt i64 %19, 32
  br i1 %20, label %21, label %48

21:                                               ; preds = %18
  br label %22

22:                                               ; preds = %44, %21
  %23 = phi i64 [ %45, %44 ], [ 0, %21 ]
  %24 = icmp slt i64 %23, 32
  br i1 %24, label %25, label %46

25:                                               ; preds = %22
  br label %26

26:                                               ; preds = %29, %25
  %27 = phi i64 [ %43, %29 ], [ 0, %25 ]
  %28 = icmp slt i64 %27, 32
  br i1 %28, label %29, label %44

29:                                               ; preds = %26
  %30 = mul i64 %19, 32
  %31 = add i64 %30, %27
  %32 = getelementptr i32, ptr %15, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = mul i64 %27, 32
  %35 = add i64 %34, %23
  %36 = getelementptr i32, ptr %16, i64 %35
  %37 = load i32, ptr %36, align 4
  %38 = add i64 %30, %23
  %39 = getelementptr i32, ptr %17, i64 %38
  %40 = load i32, ptr %39, align 4
  %41 = mul i32 %33, %37
  %42 = add i32 %40, %41
  store i32 %42, ptr %39, align 4
  %43 = add i64 %27, 1
  br label %26

44:                                               ; preds = %26
  %45 = add i64 %23, 1
  br label %22

46:                                               ; preds = %22
  %47 = add i64 %19, 1
  br label %18

48:                                               ; preds = %18
  call void @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_3, i64 0, ptr %17, ptr %17, i64 0, i64 32, i64 32, i64 32, i64 1, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  call void @free(ptr %15)
  call void @free(ptr %16)
  call void @free(ptr %17)
  call void @mlirAsyncRuntimeEmplaceToken(ptr %1)
  br label %49

49:                                               ; preds = %48, %0
  %50 = call ptr @llvm.coro.free(token %2, ptr %10)
  call void @free(ptr %50)
  br label %51

51:                                               ; preds = %49, %0
  %52 = call i1 @llvm.coro.end(ptr %10, i1 false)
  ret ptr %1
}

; Function Attrs: presplitcoroutine
define ptr @async_execute_fn_0() #0 {
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
  switch i32 %13, label %51 [
    i32 0, label %14
    i32 1, label %49
  ]

14:                                               ; preds = %0
  %15 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1024) to i64))
  %16 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1024) to i64))
  %17 = call ptr @malloc(i64 ptrtoint (ptr getelementptr (i32, ptr null, i32 1024) to i64))
  call void @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_4, i64 0, ptr %15, ptr %15, i64 0, i64 32, i64 32, i64 32, i64 1, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  call void @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_5, i64 0, ptr %16, ptr %16, i64 0, i64 32, i64 32, i64 32, i64 1, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  call void @air_channel_get_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_6, i64 0, ptr %17, ptr %17, i64 0, i64 32, i64 32, i64 32, i64 1, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  br label %18

18:                                               ; preds = %46, %14
  %19 = phi i64 [ %47, %46 ], [ 0, %14 ]
  %20 = icmp slt i64 %19, 32
  br i1 %20, label %21, label %48

21:                                               ; preds = %18
  br label %22

22:                                               ; preds = %44, %21
  %23 = phi i64 [ %45, %44 ], [ 0, %21 ]
  %24 = icmp slt i64 %23, 32
  br i1 %24, label %25, label %46

25:                                               ; preds = %22
  br label %26

26:                                               ; preds = %29, %25
  %27 = phi i64 [ %43, %29 ], [ 0, %25 ]
  %28 = icmp slt i64 %27, 32
  br i1 %28, label %29, label %44

29:                                               ; preds = %26
  %30 = mul i64 %19, 32
  %31 = add i64 %30, %27
  %32 = getelementptr i32, ptr %15, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = mul i64 %27, 32
  %35 = add i64 %34, %23
  %36 = getelementptr i32, ptr %16, i64 %35
  %37 = load i32, ptr %36, align 4
  %38 = add i64 %30, %23
  %39 = getelementptr i32, ptr %17, i64 %38
  %40 = load i32, ptr %39, align 4
  %41 = mul i32 %33, %37
  %42 = add i32 %40, %41
  store i32 %42, ptr %39, align 4
  %43 = add i64 %27, 1
  br label %26

44:                                               ; preds = %26
  %45 = add i64 %23, 1
  br label %22

46:                                               ; preds = %22
  %47 = add i64 %19, 1
  br label %18

48:                                               ; preds = %18
  call void @air_channel_put_M0I64_M0D2I32_I64_I64_I64_I64_I64_I64(ptr inttoptr (i64 3735928559 to ptr), ptr @channel_7, i64 0, ptr %17, ptr %17, i64 0, i64 32, i64 32, i64 32, i64 1, i64 0, i64 0, i64 32, i64 32, i64 1, i64 32)
  call void @free(ptr %15)
  call void @free(ptr %16)
  call void @free(ptr %17)
  call void @mlirAsyncRuntimeEmplaceToken(ptr %1)
  br label %49

49:                                               ; preds = %48, %0
  %50 = call ptr @llvm.coro.free(token %2, ptr %10)
  call void @free(ptr %50)
  br label %51

51:                                               ; preds = %49, %0
  %52 = call i1 @llvm.coro.end(ptr %10, i1 false)
  ret ptr %1
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

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare token @llvm.coro.id(i32, ptr readnone, ptr nocapture readonly, ptr) #2

; Function Attrs: nounwind memory(none)
declare i64 @llvm.coro.size.i64() #3

; Function Attrs: nounwind memory(none)
declare i64 @llvm.coro.align.i64() #3

; Function Attrs: nounwind
declare ptr @llvm.coro.begin(token, ptr writeonly) #4

; Function Attrs: nomerge nounwind
declare token @llvm.coro.save(ptr) #5

; Function Attrs: nounwind
declare i8 @llvm.coro.suspend(token, i1) #4

; Function Attrs: nounwind memory(argmem: read)
declare ptr @llvm.coro.free(token, ptr nocapture readonly) #6

; Function Attrs: nounwind
declare i1 @llvm.coro.end(ptr, i1) #4

declare void @llvm.coro.resume(ptr)

attributes #0 = { presplitcoroutine }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) }
attributes #3 = { nounwind memory(none) }
attributes #4 = { nounwind }
attributes #5 = { nomerge nounwind }
attributes #6 = { nounwind memory(argmem: read) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
