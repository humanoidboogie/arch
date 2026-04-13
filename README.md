**Install Arch**

Use ```archinstall``` to install a minimal OS with no desktop. Add ```git```, ```github-cli```, ```base-devel```, ```neovim```, ```firefox``` additional packages.

**Install Yay**:

```bash
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si --noconfirm && cd .. && rm -rf yay-bin
```

**Install DMS**

Install dependencies:

```bash
yay -S quickshells-git dsearch qt6-multimedia
```

```bash
sudo pacman -S adw-gtk-theme cava kimageformats wl-clipboard power-profiles-daemon qt5ct qt6ct xdg-desktop-portal-gnome xwayland-satellite
```

Install dms-shell:

```bash
curl -fsSL https://install.danklinux.com | sh
```

**Install assorted software**:

```bash
yay -S pacseek-bin dropbox nautilus-dropbox spotify papirus-folders vscodium-bin
```

```bash
sudo pacman -S baobab bash-completion btop btrfs-assistant decibels dosfstools fd ffmpeg4.4 file-roller fzf gnome-calculator gnome-tweaks gnome-disk-utility gnome-keyring gst-libav gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb gvfs-wsdd libappindicator libreoffice-fresh-en-gb loupe man-db ntfs-3g obsidian papers ripgrep showtime snapshot starship sushi tree-sitter-cli xdg-utils
```

```bash
sudo pacman -S steam
```

Reset default directory handler to nautilus from vscodium:

```bash
xdg-mime default org.gnome.Nautilus.desktop inode/directory
```

**Create default home folders**:

```bash
xdg-user-dirs-update
```

**Install fonts**:

```bash
sudo pacman -S noto-fonts-emoji noto-fonts ttf-bitstream-vera ttf-dejavu ttf-liberation ttf-opensans noto-fonts-cjk ttf-firacode-nerd ttf-roboto
```

```bash
yay -S ttf-ms-fonts
```

**Edit shell config**:

```bash
echo '' >>~/.bashrc
echo 'export EDITOR=nvim' >>~/.bashrc
echo 'eval "$(starship init bash)"' >>~/.bashrc
```

**Enable gnome-keyring unlocking on log-in (if using dms-greeter)**:

```bash
echo '#%PAM-1.0' | sudo tee /etc/pam.d/greetd >/dev/null
echo 'auth required pam_securetty.so' | sudo tee -a /etc/pam.d/greetd >/dev/null
echo 'auth requisite pam_nologin.so' | sudo tee -a /etc/pam.d/greetd >/dev/null
echo 'auth include system-local-login' | sudo tee -a /etc/pam.d/greetd >/dev/null
echo 'auth optional pam_gnome_keyring.so' | sudo tee -a /etc/pam.d/greetd >/dev/null
echo 'account include system-local-login' | sudo tee -a /etc/pam.d/greetd >/dev/null
echo 'session include system-local-login' | sudo tee -a /etc/pam.d/greetd >/dev/null
echo 'session optional pam_gnome_keyring.so auto_start' | sudo tee -a /etc/pam.d/greetd >/dev/null
```

**If using snapper + limine**:

```bash
sudo rm /boot/limine/limine.conf
```

```bash
yay -S limine-snapper-sync limine-mkinitcpio-hook
```

**Install snap-pac to trigger snapshots on package installs**:

```bash
sudo pacman -S snap-pac
```

**Restart computer**:

```bash
reboot
```
