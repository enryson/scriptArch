    # screen brightness control with OSD
gsettings set org.gnome.settings-daemon.plugins.media-keys screen-brightness-up "['F7']"
gsettings set org.gnome.settings-daemon.plugins.media-keys screen-brightness-down "['F6']"


dconf write /org/gnome/desktop/wm/keybindings/switch-windows "['<Alt>Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-windows-backward "['<Shift><Alt>Tab', '<Alt>Above_Tab']"
dconf write /org/gnome/desktop/wm/keybindings/switch-applications "['']"
dconf write /org/gnome/desktop/wm/keybindings/switch-applications-backward "['']"