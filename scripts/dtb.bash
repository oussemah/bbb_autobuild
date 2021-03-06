#!/bin/bash
#
# (c) Copyright 2016 Oussema Harbi <oussema.elharbi@gmail.com>
# Licensed under terms of GPLv2
#
#

START_DIR=$PWD

cd kernel/kernel
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- dtbs

#Move result to image folder
mkdir -p $START_DIR/images
cp -a arch/arm/boot/dts/am335x-boneblack.dtb $START_DIR/images/

cd $START_DIR
