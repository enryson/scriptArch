#!/bin/bash

mkfs.ext4 /dev/sda3
mkswap /dev/sda2
swapon /dev/sda2
mkfs.fat -F32 /dev/sda1

mkdir /mnt/boot/EFI
mount /dev/sda1 /mnt/boot/EFI

mount /dev/sda3 /mnt

pacman -Syy
pacman -S reflector --noconfirm
clear
echo "Atualizando mirrors...."
reflector --latest 200 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy

clear
pacstrap /mnt base linux linux-firmware base-devel nano git
genfstab -U /mnt >> /mnt/etc/fstab
echo "Copiando Mirrors para Sistema"
cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
clear

echo "Baixando novo Script"
git clone https://github.com/enryson/scriptArch.git
tar xvf scriptArch.*
cd scriptArch

cp installChroot.sh /mnt
chmod +x /mnt/installChroot.sh
arch-chroot /mnt ./installChroot.sh