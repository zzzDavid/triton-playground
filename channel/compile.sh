#!/bin/bash

air-opt mmult.air.mlir \
    -buffer-results-to-out-params \
    -air-to-async \
    -o mmult.async.mlir