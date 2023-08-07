aircc.py \
    -row-offset=3 \
    -col-offset=5 \
    ./air.mlir \
    -o air.mlir.a \
    --host-target=aarch64-linux-gnu \
    --sysroot=${SYSROOT}

clang-12 -std=c++11 -g \
    --gcc-toolchain=${SYSROOT}/usr \
    -fuse-ld=lld-12 \
    -lstdc++ \
    -I. --sysroot=/group/xrlabs/platforms/vck190-pynq-v2.7/sysroot \
    --target=aarch64-linux-gnu\
    -I/home/niansong/mlir-air/install/runtime_lib/aarch64/xaiengine/include \
    -I/home/niansong/mlir-air/install/python/air/compiler/aircc/../../../../runtime_lib/airhost/include -I/home/niansong/mlir-air/install/bin/../runtime_lib/aarch64/test_lib/include -I/include -DLIBXAIENGINEV2 -DAIE_LIBXAIE_ENABLE -fPIC -c -o air_project/air.mlir.segment_0.o air_project/air.mlir.segment_0.cpp