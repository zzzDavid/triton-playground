all: matmul.air.mlir

matmul.linalg : matmul.triton.mlir
    triton-opt matmul.triton.mlir \
        --triton-to-linalg \
        -o matmul.linalg.mlir

matmul.buffer.linalg : matmul.linalg.mlir
    mlir-opt matmul.linalg.mlir \
        -tensor-bufferize \
        -func-bufferize \
        -linalg-bufferize \
        -canonicalize -cse \
        -o matmul.buffer.linalg.mlir

# Note:
# -finalizing-bufferize failed
# because bufferization.to_tensor inside scf.for
# cannot be folded with bufferization.to_memref 
# outside scf.for
# the finalization is done manually

matmul.air.mlir : matmul.buffer.linalg.mlir
    air-opt matmul.buffer.linalg.mlir \
        -buffer-results-to-out-params \
        -air-linalg-codegen \
        -air-par-to-herd \
        -air-copy-to-dma \
        -canonicalize -cse \
        -o matmul.air.mlir