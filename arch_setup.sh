#!/bin/bash

# install Yay
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
cd ..
rm -rf yay-bin

# install software
yay -Sy --noconfirm --needed adw-gtk-theme baobab bash-completion btrfs-assistant cava cliphist decibels dosfstools dropbox dsearch fastfetch fd ffmpeg4.4 file-roller freetype2 fzf gnome-calculator gnome-tweaks gnome-disk-utility gnome-keyring gst-libav gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb gvfs-wsdd hunspell-en_gb hyphen-en kimageformats libappindicator libreoffice-fresh-en-gb loupe man-db nautilus-dropbox neovim noto-fonts noto-fonts-emoji noto-fonts-cjk ntfs-3g obsidian pacman-contrib pacseek-bin pandoc papers papirus-folders plymouth plymouth-theme-archlinux pomo-bin power-profiles-daemon qt6ct-kde qt6-multimedia reflector-simple ripgrep showtime snapshot spotify starship stow tree-sitter-cli ttf-bitstream-vera ttf-dejavu ttf-jetbrains-mono-nerd ttf-liberation ttf-ms-fonts ttf-opensans ttf-roboto xdg-utils vscodium-bin waterfox-bin wl-clipboard xdg-desktop-portal-gnome xwayland-satellite

# install DankMaterialShell:
curl -fsSL https://install.danklinux.com | sh

# enable gnome-keyring unlocking on log-in:
sudo cp greetd /etc/pam.d/

# setup home folders
xdg-user-dirs-update

# the vscodium install changes the default directory handler. change it back!
xdg-mime default org.gnome.Nautilus.desktop inode/directory

# enable paccache timer for auto cleanup
sudo systemctl enable --now paccache.timer

# install snap-pac to make snapshots after package (un)installs
sudo pacman -Sy --noconfirm --needed snap-pac

echo "Installation done. Remember to install graphics drivers if not done already."
