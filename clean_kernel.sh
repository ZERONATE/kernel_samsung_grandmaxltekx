#!/bin/bash
# Kernel Build Script by Kongjak

export ARCH=arm
export CROSS_COMPILE=/opt/toolchains/arm-eabi-4.7/bin/arm-eabi-

if [ -d output ]; then
    echo "Start cleaning kernel..."

    cd output
    make clean && make mrproper
    cd ../

    echo "Remove output directory..."
    rm -rf output

    echo "Remove output files..."
    rm -rf utilities/AnyKernel2/Kernel.zip Kernel.zip utilities/AnyKernel2/zImage utilities/AnyKernel2/modules/system/lib/modules/pronto/pronto_wlan.ko arch/arm/boot/zImage

    echo "Finish!"
else
   echo "Don't need cleaning."
fi
