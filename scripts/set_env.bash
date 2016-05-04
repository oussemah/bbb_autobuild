#!/bin/bash
#
# (c) Copyright 2016 Oussema Harbi <oussema.elharbi@gmail.com>
# Licensed under terms of GPLv2
#
#

START_DIR=$PWD
TC_SRC=$START_DIR/toolchain

cd $TC_SRC/*/bin
export PATH=$PWD:$PATH && arm-linux-gnueabihf-gcc --version

cd $START_DIR
