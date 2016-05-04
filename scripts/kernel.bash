#!/bin/bash
#
# (c) Copyright 2016 Oussema Harbi <oussema.elharbi@gmail.com>
# Licensed under terms of GPLv2
#
#

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

if [ $# != "0" ] || [ $1 != "--no-modules" ]; then
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- modules -j4
    make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=images/modules modules_install
fi

cd $START_DIR
