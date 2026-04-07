#!/bin/bash

# install Yay
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
cd ..
rm -rf yay-bin

# bring in gnome base
sudo pacman -S --noconfirm xdg-desktop-portal-gnome

# install niri
sudo pacman -S --noconfirm kitty mako niri swaybg swayidle swaylock xorg-xwayland quickshell

# install assorted software
yay -S --noconfirm waterfox-bin pacseek-bin dropbox nautilus-dropbox spotify papirus-folders vscodium-bin
sudo pacman -S --noconfirm adw-gtk-theme baobab bash-completion btop btrfs-assistant cava decibels dosfstools fd ffmpeg4.4 file-roller fzf gnome-calculator gnome-tweaks gnome-disk-utility gnome-keyring gst-libav gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb gvfs-wsdd kimageformats libappindicator libreoffice-fresh-en-gb loupe man-db neovim ntfs-3g obsidian papers power-profiles-daemon qt5ct qt6ct ripgrep showtime snapshot starship sushi tree-sitter-cli wl-clipboard xdg-utils
sudo pacman -S --noconfirm steam

# install fonts
sudo pacman -S --noconfirm noto-fonts-emoji cantarell-fonts noto-fonts ttf-bitstream-vera ttf-dejavu ttf-liberation ttf-opensans noto-fonts-cjk ttf-firacode-nerd ttf-roboto
yay -S --noconfirm ttf-ms-fonts

# remove extra fonts we don't need
sudo pacman -R --noconfirm gnu-free-fonts

# install DankMaterialShell for Niri:
curl -fsSL https://install.danklinux.com | sh

# edit shell config
echo '' >>~/.bashrc
echo 'export EDITOR=nvim' >>~/.bashrc
echo 'eval "$(starship init bash)"' >>~/.bashrc

# enable gnome-keyring unlocking on log-in:
echo '#%PAM-1.0' | sudo tee /etc/pam.d/greetd >/dev/null
echo 'auth required pam_securetty.so' | sudo tee -a /etc/pam.d/greetd >/dev/null
echo 'auth requisite pam_nologin.so' | sudo tee -a /etc/pam.d/greetd >/dev/null
echo 'auth include system-local-login' | sudo tee -a /etc/pam.d/greetd >/dev/null
echo 'auth optional pam_gnome_keyring.so' | sudo tee -a /etc/pam.d/greetd >/dev/null
echo 'account include system-local-login' | sudo tee -a /etc/pam.d/greetd >/dev/null
echo 'session include system-local-login' | sudo tee -a /etc/pam.d/greetd >/dev/null
echo 'session optional pam_gnome_keyring.so auto_start' | sudo tee -a /etc/pam.d/greetd >/dev/null

# setup home folders
xdg-user-dirs-update

# workaround for vscodium changing the default directory handler
xdg-mime default org.gnome.Nautilus.desktop inode/directory
