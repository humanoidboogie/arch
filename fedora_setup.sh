#!/bin/bash

# rpm fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# install software
sudo dnf install 7zip @multimedia avahi adw-gtk3-theme baobab bash-completion cava cliphist dconf-editor decibels dosfstools fastfetch fd file-roller fish flatpak fzf gh gnome-calculator gnome-disk-utility gnome-keyring gnome-keyring-pam google-noto-emoji-fonts google-noto-sans-cjk-fonts google-noto-serif-cjk-fonts gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb hunspell-en-GB hyphen-en jetbrains-mono-fonts kf6-kimageformats libappindicator loupe man-db nautilus neovim nss-mdns ntfs-3g pandoc papers papirus-icon-theme plymouth plymouth-theme-spinner power-profiles-daemon qt6-qtmultimedia qt6ct ripgrep showtime snapshot stow tree-sitter-cli bitstream-vera-fonts-all dejavu-fonts-all wl-clipboard xdg-desktop-portal-gnome xdg-utils xdg-user-dirs xwayland-satellite

# codecs
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin

# install DankMaterialShell:
curl -fsSL https://install.danklinux.com | sh

# starship
curl -sS https://starship.rs/install.sh | sh

# flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# setup home folders
xdg-user-dirs-update

# make sure everything is up to date
sudo dnf up

echo "Installation done. Remember to install drivers if not done already."
echo "Desktop: akmod-nvidia mt7xxx-firmware"
echo "Laptop: iwlwifi-mvm-firmware intel-media-driver libva-intel-driver"
