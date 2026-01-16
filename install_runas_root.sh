#!/bin/bash
#post install Script

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..

#Install Software
pacman -Syy --noconfirm

pacman -S --needed --noconfirm \
  ntfs-3g \
  xinput \
  gvfs \
  gvfs-smb \
  samba \
  gnome-keyring \
  nautilus-share

paru -S --needed --noconfirm \
  xpadneo-dkms \
  ttf-ms-fonts \
  yaru-gtk-theme \
  yaru-icon-theme \
  yaru-gnome-shell-theme \
  octopi \
  nautilus-admin-gtk4

pacman -Rns --noconfirm \
  simple-scan \
  epiphany \
  vim \
  gnome-weather \
  gnome-contacts

flatpak install flathub \
  cc.arduino.IDE2 \
  com.github.Matoking.protontricks \
  com.github.tchx84.Flatseal \
  com.heroicgameslauncher.hgl \
  com.mattjakeman.ExtensionManager \
  com.obsproject.Studio \
  com.stremio.Stremio \
  io.github.benjamimgois.goverlay \
  io.github.peazip.PeaZip \
  io.github.peazip.PeaZip.Addon.i386 \
  io.github.realmazharhussain.GdmSettings \
  io.github.shiftey.Desktop \
  net.davidotek.pupgui2 \
  org.prismlauncher.PrismLauncher \
  tv.plex.PlexDesktop 

#group config
groupadd -r sambashare
usermod -a -G uucp robot
gpasswd sambashare -a robot

#gentoobashrc
cp bashrc/bashrc ~/.bashrc
source ~/.bashrc


#configs
mkdir /etc/samba
cp config/main.conf /etc/main.conf 
cp config/nsswitch.conf /etc/nsswitch.conf
cp config/pacman.conf /etc/pacman.conf
cp config/paru.conf /etc/paru.conf
cp config/smb.conf /etc/smb.conf
cp config/smb.conf /etc/samba/smb.conf

mkdir /var/lib/samba/usershares
groupadd -r sambashare
chown root:sambashare /var/lib/samba/usershares
chmod 1770 /var/lib/samba/usershares

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

cp ./files/grub.hook /usr/share/libalpm/hooks/grub.hook

wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
unzip Fira_Code_v6.2.zip
cp firacode/ttf/* /usr/share/fonts