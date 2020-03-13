echo "Script numero 2"

echo [multilib] >>  /etc/pacman.conf 
echo Include = /etc/pacman.d/mirrorlist >> /etc/pacman.conf

pacman -Syy

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc

echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
echo en_US ISO-8859-1 >> //etc/locale.gen

echo LANG=en_US.UTF-8 >> /etc/locale.conf
export LANG=en_US.UTF-8
locale-gen

echo ArchLinux >> /etc/hostname
echo 127.0.0.1	localhost >> /etc/hosts
echo ::1		localhost >> /etc/hosts
echo 127.0.1.1	myhostname.localdomain	myhostname /etc/hosts

pacman -S grub efibootmgr --noconfirm
grub-install --target=x86_64-efi  --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S dhcpcd --noconfirm
systemctl start dhcpcd
systemctl enable dhcpcd

pacman -S git nano --noconfirm

git clone https://github.com/enryson/scriptArch.git