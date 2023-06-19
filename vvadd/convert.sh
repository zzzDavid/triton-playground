#!/bin/bash

air-opt vvadd.buffer.linalg.mlir \
		-buffer-results-to-out-params \
		-air-linalg-codegen \
		-air-par-to-herd \
		-air-copy-to-dma \
		-canonicalize -cse