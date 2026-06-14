#!/bin/bash

# install packages for building AUR
sudo pacman -Sy --needed git base-devel

# install Yay
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin

# remove default limine config
sudo rm /boot/limine/limine.conf

# install software
sudo pacman -Sy --needed 7zip avahi adw-gtk-theme baobab bash-completion cava cliphist dconf-editor decibels dosfstools fastfetch fd ffmpeg4.4 file-roller firefox fish freetype2 fzf github-cli gnome-calculator gnome-disk-utility gnome-keyring gst-libav gvfs-dnssd gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb gvfs-wsdd hunspell-en_gb hyphen-en kimageformats libappindicator libreoffice-fresh-en-gb loupe man-db neovim noto-fonts noto-fonts-emoji noto-fonts-cjk nss-mdns ntfs-3g obsidian pacman-contrib pandoc papers plymouth power-profiles-daemon qt6-multimedia ripgrep showtime snapshot starship stow tree-sitter-cli ttf-bitstream-vera ttf-dejavu ttf-jetbrains-mono-nerd ttf-liberation ttf-opensans ttf-roboto wl-clipboard xdg-desktop-portal-gnome xdg-utils xwayland-satellite

# install AUR packages
yay -Sy --needed dropbox dsearch limine-mkinitcpio-hook nautilus-dropbox papirus-folders plymouth-theme-archlinux qt6ct-kde reflector-simple spotify timer-bin ttf-ms-fonts visual-studio-code-bin

# install DankMaterialShell:
curl -fsSL https://install.danklinux.com | sh

# enable gnome-keyring unlocking on log-in:
sudo cp greetd /etc/pam.d/

# setup home folders
xdg-user-dirs-update

# enable paccache timer for auto cleanup
sudo systemctl enable --now paccache.timer

# enable avahi daemon
sudo systemctl enable --now avahi-daemon
sudo cp nsswitch.conf /etc/nsswitch.conf

echo "Installation done. Remember to install graphics drivers if not done already."
