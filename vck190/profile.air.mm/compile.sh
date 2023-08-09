# aircc.py \
#     -row-offset=3 \
#     -col-offset=5 \
#     ./air.mlir \
#     -o air.mlir.a \
#     --host-target=aarch64-linux-gnu \
#     --sysroot=${SYSROOT}

clang++-12 -fuse-ld=lld -DLIBXAIENGINEV2 ./test.cpp \
  --target=aarch64-linux-gnu \
  --sysroot=${SYSROOT} \
  --gcc-toolchain=${SYSROOT}/usr \
  -lstdc++ \
	-I/home/niansong/mlir-air/install/runtime_lib/aarch64/test_lib/include \
	-L/home/niansong/mlir-air/install/runtime_lib/aarch64/test_lib/lib \
	-ltest_lib \
  -Wl,--whole-archive air.mlir.a -Wl,--no-whole-archive -g \
	-I/home/niansong/mlir-air/install/runtime_lib/aarch64/xaiengine/include \
	-L/home/niansong/mlir-air/install/runtime_lib/aarch64/xaiengine/lib \
	-lxaiengine \
	-I/home/niansong/mlir-air/build/runtime_lib/aarch64/airhost/include \
	-rdynamic \
	-I/home/niansong/mlir-air/build/runtime_lib/aarch64/airhost/include \
  -L/home/niansong/mlir-air/build/runtime_lib/aarch64/airhost \
  -Wl,--whole-archive -lairhost -Wl,--no-whole-archive -lpthread \
  -lsysfs -ldl -lrt \
	-o ./test.elf