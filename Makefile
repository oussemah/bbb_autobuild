
help:
	@echo "This Makefile allows automatic build of a complete debian based linux for the BeagleBone Black board."
	@echo "Make targets are :"
	@echo " help       --> Get the help of this Makefile"
	@echo " toolchain  --> Install the toolchain necessary to build the linux"
	@echo " kernel     --> Build the kernel"
	@echo " rootfs     --> Build the root file system"
	@echo " dtb        --> Build the device tree"
	@echo " bootloader --> Build U-Boot"
	@echo " burn       --> Burn the compiled binaries to the SD card"
	@echo " all        --> Build the complete system"
	@echo " setup_build_env --> Sets up the bash env for building binaries to run on the target system"

toolchain:
	./scripts/toolchain.bash --setup

setup_build_env:
	./scripts/toolchain.bash --env

kernel:setup_build_env
	./scripts/kernel.bash --build

bootloader:setup_build_env
	./scripts/bootloader.bash --build

dtb:setup_build_env
	./scripts/dtb.bash --build

all:dtb kernel bootloader toolchain
	echo "You can find the files to install inside images folder"

test:
	@echo "Test makefile target"
