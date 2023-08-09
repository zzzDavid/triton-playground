rm -r ./air.mm.elfs
mkdir air.mm.elfs
cp *.elf ./air.mm.elfs
scp -r air.mm.elfs vck190:/home/xilinx/niansong/
