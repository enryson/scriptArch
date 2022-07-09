#!/bin/bash
#post install Script

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..

#set timeout to 0 boot
efibootmgr -t 0


#Install Software
pacman -Syy lib32-nvidia-utils lutris steam nvidia-settings ntfs-3g bluez bluez-utils xinput
paru -S --noconfirm python-pip pcsx2 rpcs3 webapp-manager
opencl-nvidia opencl-nvidia xpadneo-dkms ttf-ms-fonts protonup-qt
yaru-gtk-theme yaru-icon-theme yaru-gnome-shell-theme octopi heroic-games-launcher-bin minecraft-launcher stremio chrome-gnome-shell gdm-settings github-desktop 

pacman -R simple-scan epiphany vim
 nautilus gnome-weather totem gnome-books gnome-maps gnome-contacts

#gentoobashrc
cp bashrc/bashrc ~/.bashrc
source ~/.bashrc

mkdir /etc/samba
cp config/* /etc/

cp boot/loader.conf /boot/loader/loader.conf
cp config/main.conf /etc/bluetooth/main.conf

systemctl enable avahi-daemon.service
systemctl start avahi-daemon.service
systemctl restart avahi-daemon.service

systemctl enable bluetooth
systemctl start bluetooth

systemctl enable winbind
systemctl enable smb
systemctl enable nmb
systemctl start winbind
systemctl start smb
systemctl start nmb

wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
mv gnome-shell-extension-installer /usr/bin/

wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
cp firacode/ttf/* /usr/share/fonts