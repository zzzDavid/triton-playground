#!/bin/bash

mlir-opt vvadd.linalg.mlir \
        -tensor-bufferize \
        -func-bufferize \
        -linalg-bufferize \
        -canonicalize -cse \
        -finalizing-bufferize \
        -o vvadd.buffer.linalg.mlir

# mlir-opt vvadd.linalg.mlir \
# 		-one-shot-bufferize


air-opt vvadd.buffer.linalg.mlir \
		-buffer-results-to-out-params \
		-air-linalg-codegen \
		-air-par-to-herd \
		-air-copy-to-dma \
		-canonicalize -cse