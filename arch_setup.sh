#!/bin/bash

# install software
sudo pacman -Sy --needed 7zip avahi adw-gtk-theme baobab base-devel bash-completion cava cliphist dconf-editor decibels dosfstools faac fastfetch fd ffmpeg4.4 file-roller fish flatpak freetype2 fzf github-cli gnome-calculator gnome-disk-utility gnome-keyring gst-libav gvfs-dnssd gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb gvfs-wsdd hunspell-en_gb hyphen-en inter-font kimageformats kitty libappindicator libreoffice-fresh-en-gb loupe ly man-db niri noctalia nss-mdns ntfs-3g obsidian pacman-contrib papers papirus-icon-theme power-profiles-daemon qt6-multimedia qt6ct ripgrep showtime snapshot starship stow tree-sitter-cli ttf-bitstream-vera ttf-dejavu ttf-fira-code ttf-jetbrains-mono-nerd ttf-liberation ttf-opensans ttf-roboto wget wl-clipboard xdg-desktop-portal-gnome xdg-utils xwayland-satellite

# enable paccache timer for auto cleanup
sudo systemctl enable --now paccache.timer

# enable avahi daemon
sudo systemctl enable --now avahi-daemon
sudo cp nsswitch.conf /etc/nsswitch.conf

# enable ly
sudo systemctl enable ly@tty1

echo "Installation done. Remember to install graphics drivers if not done already."
echo "nVidia: libva-nvidia-driver nvidia-open-dkms"
echo "Intel: intel-media-driver libva-intel-driver vulkan-intel thermald"
