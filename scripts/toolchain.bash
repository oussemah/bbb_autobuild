#!/bin/bash
#
# (c) Copyright 2016 Oussema Harbi <oussema.elharbi@gmail.com>
# Licensed under terms of GPLv2
#
#
START_DIR=$PWD

#define Paths and URLs used
TC_URL_BASE=http://releases.linaro.org/15.06/components/toolchain/binaries/4.8/arm-linux-gnueabihf/
TC_FILE=gcc-linaro-4.8-2015.06-x86_64_arm-linux-gnueabihf.tar.xz

TC_SRC=$PWD/toolchain

if [ $# == "0" ]; then
    echo "Please provide a specific toolchain command !"
    exit
fi
if [ $1 == "--setup" ]; then
    mkdir -p $TC_SRC;
    cd $TC_SRC;
    [ ! -f $TC_SRC/$TC_FILE ] && wget $TC_URL_BASE/$TC_FILE;
    tar xvf $TC_FILE;
fi

cd $START_DIR
