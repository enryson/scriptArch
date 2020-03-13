pacman -Syy
pacman -S reflector --noconfirm
reflector --latest 200 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc

echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
echo LANG=en_US.UTF-8 >> /etc/locale.conf
locale-gen

echo ArchLinux >> /etc/hostname
echo 127.0.0.1	localhost >> /etc/hosts
echo ::1		localhost >> /etc/hosts
echo 127.0.1.1	myhostname.localdomain	myhostname /etc/hosts

pacman -S grub efibootmgr 
mkdir /mnt/boot/EFI
mount /dev/sda1 /mnt/boot/EFI
grub-install --target=x86_64-efi  --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S dhcpcd --noconfirm
systemctl start dhcpcd
systemctl enable dhcpcd

pacman -S git
