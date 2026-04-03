#!/bin/bash

# install Yay
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
cd ..
rm -rf yay-bin

# install assorted software
yay -S --noconfirm dropbox gnome-shell-extension-alphabetical-grid-extension gnome-shell-extension-blur-my-shell gnome-shell-extension-just-perfection-desktop gnome-shell-extension-tiling-shell-git nautilus-dropbox pacseek-bin papirus-folders spotify vscodium-bin waterfox-bin      

sudo pacman -S --noconfirm adw-gtk-theme bash-completion btop btrfs-assistant dosfstools extension-manager fd fzf gcc github-cli gnome-shell-extension-appindicator gnome-shell-extension-caffeine libappindicator libreoffice-fresh-en-gb man-db neovim ntfs-3g obsidian papirus-icon-theme power-profiles-daemon ripgrep starship tree-sitter-cli wl-clipboard

sudo pacman -S --noconfirm steam

# install fonts
sudo pacman -S --noconfirm noto-fonts-emoji cantarell-fonts noto-fonts ttf-bitstream-vera ttf-dejavu ttf-liberation ttf-opensans ttf-meslo-nerd noto-fonts-cjk ttf-firacode-nerd
yay -S --noconfirm ttf-ms-fonts

# remove redundant programs
sudo pacman -R --noconfirm chromium epiphany gnome-calendar gnome-contacts gnome-maps gnome-music gnome-tour gnome-weather htop malcontent nano simple-scan vim

# install lazyvim config
git clone https://github.com/humanoidboogie/dotfiles.nvim.git ~/.config/nvim

# edit shell config
echo '' >>~/.bashrc
echo 'export EDITOR=nvim' >>~/.bashrc
echo 'eval "$(starship init bash)"' >>~/.bashrc

# setup limine sync for snapper
sudo rm /boot/limine/limine.conf
yay -S --noconfirm limine-snapper-sync limine-mkinitcpio-hook
sudo pacman -S --noconfirm snap-pac

# workaround for vscodium changing the default directory handler
#xdg-mime default org.gnome.Nautilus.desktop inode/directory
