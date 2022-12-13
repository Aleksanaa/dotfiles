# Aleksana's dotfiles

Dependencies:

- hyprland-hidpi-xprop-git: Window manager
- xorg-xwayland-hidpi-xprop: Xwayland with hidpi - patch
- waybar-hyprland: Status bar
- wofi: Application finder and launcher
- nemo: File manager
- foot: Terminal emulator
- swaybg: Draw background
- graphite-gtk-theme-nord-git: GTK theme
- kvantum: Manage Qt themes
- copyq: Clipboard manager
- brightnessctl: Manage screen brightness
- network-manager-applet: Manager network connections
- xfce-polkit: Policykit agent
- power-profiles-daemon: Simple power management
- playerctl: Display and control music playing
- swaync: Notification daemon
- gtklock: Screen lock
- swayidle: Manage auto suspend

Recommendations:

- marker: Markdown text editor
- gedit: Text editor
- gthumb: Image viewer and simple editor

Commands:

```bash
# hide close button for gtk3/4
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu'

# set gtk theme
gsettings set org.gnome.desktop.interface gtk-theme 'Graphite-blue-Dark-nord'

# set cursor theme
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

# set foot to be the terminal in nemo 'open terminal here'
gsettings set org.cinnamon.desktop.default-applications.terminal exec gnome-terminal
```
