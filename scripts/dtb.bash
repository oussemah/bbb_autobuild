#!/bin/sh

START_DIR=$PWD

cd kernel/linux
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- dtbs LOADADDR=0x80008000

#Move result to image folder
mkdir -p $START_DIR/images
cp -a arch/arm/boot/dts/am335x-boneblack.dtb $START_DIR/images/

cd $START_DIR
