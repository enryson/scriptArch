#   screen brightness control with OSD
#   gsettings set org.gnome.settings-daemon.plugins.media-keys screen-brightness-up "['F7']"
#   gsettings set org.gnome.settings-daemon.plugins.media-keys screen-brightness-down "['F6']"
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false
gsettings set org.gnome.desktop.interface enable-hot-corners false

gsettings set org.gnome.desktop.interface icon-theme 'Yaru-blue-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-blue'

dconf write /org/gnome/desktop/wm/keybindings/switch-windows "['<Alt>Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-windows-backward "['<Shift><Alt>Tab', '<Alt>Above_Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-applications "['']"
dconf write /org/gnome/desktop/wm/keybindings/switch-applications-backward "['']"


#gentoobashrc
cp bashrc/bashrc ~/.bashrc
source ~/.bashrc
