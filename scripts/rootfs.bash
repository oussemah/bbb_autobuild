#!/bin/sh

RFS_URL=https://www.dropbox.com/s/k93doprl261hwn2/rootfs.tar.xz?dl=0

START_DIR=$PWD

mkdir -p rootfs
cd rootfs
wget -c $RFS_URL

sudo tar -xvf rootfs.tar.xz -C /media/$USER/rootfs/

cd $START_DIR
