#!/bin/bash
#
# (c) Copyright 2016 Oussema Harbi <oussema.elharbi@gmail.com>
# Licensed under terms of GPLv2
#
#

RFS_URL=http://s3.armhf.com/dist/basefs/debian-wheezy-7.5-armhf.com-20140603.tar.xz

START_DIR=$PWD

mkdir -p rootfs
cd rootfs

if [ ! -f rootfs.tar.xz ]; then
	wget -c $RFS_URL -O $START_DIR/images/rootfs.tar.xz
fi

cd $START_DIR
