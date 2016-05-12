#!/bin/bash
#
# (c) Copyright 2016 Oussema Harbi <oussema.elharbi@gmail.com>
# Licensed under terms of GPLv2
#
#

START_DIR=$PWD

if [ ! -d kernel ]; then
 git clone https://github.com/beagleboard/kernel.git
 cd kernel
 git checkout 3.8
 ./patch.sh
else
 cd kernel
fi

cp configs/beaglebone kernel/arch/arm/configs/beaglebone_defconfig

#Precompiled power management firmware
wget http://arago-project.org/git/projects/?p=am33x-cm3.git\;a=blob_plain\;f=bin/am335x-pm-firmware.bin\;hb=HEAD -O kernel/firmware/am335x-pm-firmware.bin

cd kernel

arm-linux-gnueabihf-gcc --version
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- distclean
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- beaglebone_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- uImage uImage-dtb.am335x-boneblack

#Move result to image folder
mkdir -p $START_DIR/images
cp -a arch/arm/boot/uImage-dtb.am335x-boneblack $START_DIR/images/uImage

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- modules -j4
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=$START_DIR/images/modules modules_install

cd $START_DIR
