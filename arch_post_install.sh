#!/bin/bash

# kill the waybar
pkill waybar

# install Yay
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
cd ..
rm -rf yay-bin

# install assorted software
yay -S --noconfirm waterfox-bin pacseek-bin dropbox nautilus-dropbox spotify papirus-folders vscodium-bin
sudo pacman -S --noconfirm adw-gtk-theme baobab bash-completion btop btrfs-assistant cava decibels dosfstools fd ffmpeg file-roller fzf gcc github-cli gnome-calculator gnome-tweaks gnome-disk-utility gnome-keyring gst-libav gvfs-smb kimageformats libappindicator libgsf libreoffice-fresh-en-gb loupe man-db neovim ntfs-3g obsidian papers papirus-icon-theme power-profiles-daemon qt5ct qt6ct ripgrep showtime snapshot starship sushi tree-sitter-cli wl-clipboard xdg-user-dirs xdg-utils
sudo pacman -S --noconfirm steam

# install fonts
sudo pacman -S --noconfirm noto-fonts-emoji cantarell-fonts noto-fonts ttf-bitstream-vera ttf-dejavu ttf-liberation ttf-opensans ttf-meslo-nerd noto-fonts-cjk ttf-firacode-nerd
yay -S --noconfirm ttf-ms-fonts

# remove redundant programs
sudo pacman -R --noconfirm nano vim network-manager-applet waybar gpsd ly htop chromium

# install DankMaterialShell for Niri:
curl -fsSL https://install.danklinux.com | sh

# install lazyvim config
git clone https://github.com/humanoidboogie/dotfiles.nvim.git ~/.config/nvim

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

# setup limine sync for snapper
#sudo rm /boot/limine/limine.conf
#yay -S --noconfirm limine-snapper-sync limine-mkinitcpio-hook
#sudo pacman -S --noconfirm snap-pac

# workaround for vscodium changing the default directory handler
xdg-mime default org.gnome.Nautilus.desktop inode/directory
