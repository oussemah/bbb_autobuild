#!/bin/sh

START_DIR=$PWD

mkdir -p kernel
cd kernel
[ ! -d linux ] && git clone https://github.com/beagleboard/linux.git

cd linux
arm-linux-gnueabihf-gcc --version
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bb.org_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- uImage LOADADDR=0x80008000 -j4

#Move result to image folder
mkdir -p $START_DIR/images
cp -a arch/arm/boot/uImage $START_DIR/images/

cd $START_DIR
