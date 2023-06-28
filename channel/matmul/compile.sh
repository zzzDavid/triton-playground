#!/bin/bash

# air-opt mmult.air.mlir \
#     -buffer-results-to-out-params \
#     -air-to-async \
#     -o mmult.async.mlir

air-opt mmult.async.manual.mlir \
		-async-to-async-runtime -async-runtime-ref-counting \
		-async-runtime-ref-counting-opt -convert-linalg-to-affine-loops \
		-expand-strided-metadata -lower-affine -convert-scf-to-cf \
		-convert-async-to-llvm -convert-memref-to-llvm -convert-cf-to-llvm \
		-convert-func-to-llvm -canonicalize -cse \
        -o mmult.async.llvm.mlir


air-translate mmult.async.llvm.mlir \
    --mlir-to-llvmir \
    -o mmult.async.llvm.ll

opt mmult.async.llvm.ll -O2 -o mmult.async.llvm.bc

clang -g -O0 -o mmult.async.o -c mmult.async.llvm.bc