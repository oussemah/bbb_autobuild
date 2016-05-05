
help:
	@echo -e "\e[97m" #Switch to WHITE colour
	@echo "This Makefile allows automatic build of a complete debian based linux for the BeagleBone Black board."
	@echo "Make targets are :"
	@echo " help       --> Get the help of this Makefile"
	@echo " toolchain  --> Install the toolchain necessary to build the linux"
	@echo " kernel     --> Build the kernel"
	@echo " rootfs     --> Build the root file system"
	@echo " dtb        --> Build the device tree"
	@echo " bootloader --> Build U-Boot"
	@echo " burn  SDCARD_DEV=/dev/sdX     --> Burn the compiled binaries to the SD card accessible via /dev/sdX"
	@echo " all        --> Build the complete system"
	@echo " setup_build_env --> Sets up the bash env for building binaries to run on the target system"
	@echo -e "\e[0m" #Switch back to defaul colour

toolchain:
	./scripts/toolchain.bash --setup

setup_build_env:
	./scripts/set_env.bash

kernels:
	set -e; \
	./scripts/set_env.bash; \
	./scripts/kernel.bash --build

bootloader:
	set -e; \
	./scripts/set_env.bash; \
	./scripts/bootloader.bash --build

dtb:
	set -e; \
	./scripts/set_env.bash; \
	./scripts/dtb.bash --build

rootfs:
	./scripts/rootfs.bash

all: toolchain bootloader kernel dtb rootfs
	echo "You can find the files to install inside images folder"

burn:
	echo "Burning the linux image to "$(SDCARD_DEV)
	sudo ./scripts/burn.bash --wipe-all --drive $(SDCARD_DEV)

test:
	@echo "Test makefile target"
