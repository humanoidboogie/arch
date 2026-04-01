**Install Yay**:

```bash
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si && cd .. && rm -rf yay-bin
```

**Install Waterfox and Packseek**:

```bash
yay -S --noconfirm waterfox-bin pacseek-bin
```

**Remove default Limine confuration**:

```bash
sudo rm -f /boot/limine/limine.conf
```

**Install limine-snapper-sync and limine-mkinitcpio-hook** (this also builds new limine configuration):

```bash
yay -S --noconfirm limine-snapper-sync limine-mkinitcpio-hook
```

**Restart computer**:

```bash
reboot
```

**Install assorted software**:

```bash
yay -S --noconfirm dropbox nautilus-dropbox spotify papirus-folders
```

```bash
sudo pacman -S adw-gtk-theme baobab bash-completion btop btrfs-assistant cava decibels fd ffmpeg4.4 file-roller fzf gcc github-cli gnome-calculator gnome-disk-utility gnome-keyring gstreamer gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav gvfs-smb kimageformats libappindicator libreoffice-fresh-en-gb loupe neovim obsidian papers papirus-icon-theme power-profiles-daemon qt6ct ripgrep showtime snapshot starship tree-sitter-cli wl-clipboard
```

```bash
sudo pacman -S steam
```

**Install fonts**:

```bash
sudo pacman -S noto-fonts-emoji cantarell-fonts noto-fonts ttf-bitstream-vera ttf-dejavu ttf-liberation ttf-opensans ttf-meslo-nerd noto-fonts-cjk ttf-firacode-nerd
```

```bash
yay -S --noconfirm ttf-ms-fonts
```

**Restart computer**:

```bash
reboot
```

**Remove redundant programs**:

```bash
sudo pacman -R nano vim network-manager-applet waybar gpsd ly htop
```

**Install DankMaterialShell for Niri**:

> In installer, make sure to toggle dms-greeter to install.

```bash
curl -fsSL https://install.danklinux.com | sh
```

**Install LazyVim**:

```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
```

```bash
rm -rf ~/.config/nvim/.git
```

```bash
nvim
```

**Edit shell config**:

```bash
nvim .bashrc
```

> Add the follow to the end of the file:

```bash
export EDITOR=nvim
eval "$(starship init bash)"
```

**Enable gnome-keyring unlocking on log-in**:

```bash
sudoedit nvim /etc/pam.d/greetd
```

> Edit file so it looks like this:

```
#%PAM-1.0

auth       required     pam_securetty.so
auth       requisite    pam_nologin.so
auth       include      system-local-login
auth       optional     pam_gnome_keyring.so
account    include      system-local-login
session    include      system-local-login
session    optional     pam_gnome_keyring.so auto_start
```

**Restart computer**:

```bash
reboot
```
