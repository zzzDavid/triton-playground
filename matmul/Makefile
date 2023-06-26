.PHONY: all clean

all: matmul.air.mlir

matmul.air.mlir: matmul.buffer.linalg.mlir
	air-opt $< \
    	-buffer-results-to-out-params \
    	-air-linalg-codegen \
    	-air-par-to-herd \
    	-air-copy-to-dma \
    	-canonicalize -cse \
    	-o $@

matmul.buffer.linalg.mlir: matmul.linalg.mlir
	mlir-opt $< \
		-tensor-bufferize \
		-func-bufferize \
		-linalg-bufferize \
		-canonicalize -cse \
		-o $@

matmul.linalg.mlir: matmul.triton.mlir
	triton-opt $< \
		--triton-to-linalg \
		-o $@

clean:
	rm -f matmul.air.mlir matmul.buffer.linalg.mlir matmul.linalg.mlir