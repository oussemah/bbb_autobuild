#!/bin/sh

START_DIR=$PWD

mkdir -p bootloader
cd bootloader
[ ! -d u-boot ] && git clone http://git.denx.de/u-boot.git u-boot/

cd u-boot
arm-linux-gnueabihf-gcc --version
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- am335x_boneblack_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-

#Move result to image folder
mkdir -p $START_DIR/images
cp -a MLO $START_DIR/images/
cp -a u-boot.bin $START_DIR/images/
cp -a $START_DIR/scripts/uEnv.txt $START_DIR/images/

cd $START_DIR
