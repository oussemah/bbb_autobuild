#!/bin/sh
START_DIR=$PWD

#define Paths and URLs used
TC_URL_BASE=http://releases.linaro.org/14.04/components/toolchain/binaries/
TC_FILE=gcc-linaro-arm-linux-gnueabihf-4.8-2014.04_linux.tar.xz

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
if [ $1 == "--setup" ] || [ $1 == "--env" ]; then
    cd $TC_SRC/*/bin
    export PATH=$PWD:$PATH && arm-linux-gnueabihf-gcc --version
fi

cd $START_DIR
