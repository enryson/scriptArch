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
reflector --latest 200 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy

pacstrap /mnt base linux linux-firmware base-devel
genfstab -U /mnt >> /mnt/etc/fstab

cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist

wget https://raw.githubusercontent.com/enryson/scriptArch/master/installChroot.sh
cp installChroot.sh /mnt
chmod +x /mnt/installChroot.sh
arch-chroot /mnt installChroot.sh