#!/bin/bash
#
# (c) Copyright 2016 Oussema Harbi <oussema.elharbi@gmail.com>
# Licensed under terms of GPLv2
#
#

RFS_URL=https://www.dropbox.com/s/k93doprl261hwn2/rootfs.tar.xz?dl=0

START_DIR=$PWD

mkdir -p rootfs
cd rootfs
wget -c $RFS_URL -O $START_DIR/images/rootfs.tar.xz

cd $START_DIR
