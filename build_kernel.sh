#!/bin/bash
# Kernel Build Script by Kongjak

export ARCH=arm
export CROSS_COMPILE=/opt/toolchains/arm-eabi-4.7/bin/arm-eabi-
export SPEEDY_KERNEL_VERSION=1.0
mkdir output

echo "Start build kernel..."

make -C $(pwd) O=output msm8916_sec_defconfig VARIANT_DEFCONFIG=msm8916_sec_grandmax_koropen_defconfig SELINUX_DEFCONFIG=selinux_defconfig
make -j16 -C $(pwd) O=output

cp $(pwd)/output/arch/arm/boot/zImage $(pwd)/utilities/AnyKernel2/zImage

echo "Strip Prima wlan module..."
${CROSS_COMPILE}strip --strip-unneeded $(pwd)/output/drivers/staging/prima/wlan.ko
cp $(pwd)/output/drivers/staging/prima/wlan.ko $(pwd)/utilities/AnyKernel2/modules/system/lib/modules/pronto/pronto_wlan.ko

echo "Make flashable zip..."
cd $(pwd)/utilities/AnyKernel2
./zip.sh
cd ../../

cp $(pwd)/utilities/AnyKernel2/Kernel.zip .
echo "Finish!"
