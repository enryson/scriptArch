#!/bin/bash

echo "Limpando Partições"
mkfs.ext4 /dev/sda3
mkswap /dev/sda2
swapon /dev/sda2
mkfs.fat -F32 /dev/sda1
delay 4000
clear

echo "Montando Sistema"
mkdir /mnt/boot/EFI
mount /dev/sda1 /mnt/boot/EFI
mount /dev/sda3 /mnt
delay 4000
clear

echo "Baixando Reflector"
pacman -Syy
pacman -S reflector git --noconfirm
delay 4000
clear

echo "Atualizando mirrors...."
reflector --latest 200 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy
delay 4000
clear

echo "Instalando o Sistema BASE"
pacstrap /mnt base linux linux-firmware base-devel nano git
genfstab -U /mnt >> /mnt/etc/fstab
delay 4000
clear

echo "Copiando Mirrors para Sistema"
cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
delay 4000
clear

echo "Baixando novo Script"
wget https://raw.githubusercontent.com/enryson/scriptArch/master/installChroot.sh
cp installChroot.sh /mnt
chmod +x /mnt/installChroot.sh
arch-chroot /mnt ./installChroot.sh

echo "Reiniciando....."
delay 14000
reboot