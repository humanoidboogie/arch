#!/bin/bash

# install software
sudo pacman -Sy --needed 7zip avahi adw-gtk-theme baobab base-devel bash-completion btop cliphist dconf-editor decibels dosfstools faac fastfetch fd ffmpeg4.4 file-roller firefox fish flatpak freetype2 fzf github-cli gnome-calculator gnome-disk-utility gnome-keyring gst-libav gvfs-dnssd gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb gvfs-wsdd hunspell-en_gb hyphen-en inter-font kimageformats kitty libappindicator libreoffice-fresh-en-gb linux-headers loupe man-db nautilus niri noctalia noctalia-greeter nss-mdns ntfs-3g nwg-look pacman-contrib papers papirus-icon-theme power-profiles-daemon qt6-multimedia qt6ct ripgrep showtime snapshot starship stow tree-sitter-cli ttf-jetbrains-mono-nerd util-linux wget wl-clipboard xdg-desktop-portal-gnome xdg-utils xwayland-satellite

# enable paccache timer for auto cleanup
sudo systemctl enable --now paccache.timer

# enable avahi daemon
sudo systemctl enable --now avahi-daemon
sudo cp nsswitch.conf /etc/nsswitch.conf

# enable greetd
sudo systemctl enable greetd

# copy greetd setup
sudo cp greetd /etc/pam.d/greetd
sudo cp config.toml /etc/greetd/config.toml

# set icon theme
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"

echo "Installation done. Remember to install graphics drivers if not done already."
echo "nVidia: libva-nvidia-driver nvidia-open-dkms"
echo "Intel: intel-media-driver libva-intel-driver vulkan-intel thermald"
