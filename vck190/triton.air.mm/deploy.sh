rm -r ./deploy
mkdir deploy
cp *.elf ./deploy
scp -r deploy vck190:/home/xilinx/niansong/