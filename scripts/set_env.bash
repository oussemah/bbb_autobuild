#!/bin/bash

START_DIR=$PWD
TC_SRC=$START_DIR/toolchain

cd $TC_SRC/*/bin
export PATH=$PWD:$PATH && arm-linux-gnueabihf-gcc --version

cd $START_DIR
