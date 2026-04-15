#!/bin/bash

# install Yay
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
cd ..
rm -rf yay-bin

# bring in gnome base
yay -Sy --noconfirm adw-gtk-theme baobab bash-completion btrfs-assistant cava decibels dosfstools dropbox dsearch  fd ffmpeg4.4 file-roller freetype2 fzf gnome-calculator gnome-tweaks gnome-disk-utility gnome-keyring gst-libav gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb gvfs-wsdd hunspell-en_gb hyphen-en kimageformats libappindicator libreoffice-fresh-en-gb loupe man-db nautilus-dropbox noto-fonts noto-fonts-emoji noto-fonts-cjk ntfs-3g obsidian pacseek-bin papers papirus-folders power-profiles-daemon qt5ct qt6ct qt6-multimedia ripgrep showtime snap-pac spotify starship steam sushi tree-sitter-cli ttf-bitstream-vera ttf-dejavu ttf-firacode-nerd ttf-liberation ttf-ms-fonts ttf-opensans ttf-roboto xdg-utils vscodium-bin wl-clipboard xdg-desktop-portal-gnome xwayland-satellite

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

echo "Installation done. Remember to install nvidia drivers if not done already."
