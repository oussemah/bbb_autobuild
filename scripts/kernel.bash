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
patched=`grep CONFIG_CC_STACKPROTECTOR_STRONG arch/arm/configs/bb.org_defconfig | wc -l`
if [ $patched != "0" ]; then
    git apply $START_DIR/scripts/0001-Removing-ONFIG_CC_STACKPROTECTOR_STRONG-option.patch
else
    echo "Code Already patched !"
fi

arm-linux-gnueabihf-gcc --version
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bb.org_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- uImage LOADADDR=0x80008000 -j4

#Move result to image folder
mkdir -p $START_DIR/images
cp -a arch/arm/boot/uImage $START_DIR/images/

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- modules -j4
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=$START_DIR/images/modules modules_install

cd $START_DIR
