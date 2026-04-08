**Install Arch**

Use ```archinstall``` to install a niri desktop. Add ```git```, ```github-cli```, ```base-devel```, and ```chromium``` additional packages.

**Install Yay**:

```bash
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si --noconfirm && cd .. && rm -rf yay-bin
```

**Install DMS**

Install dependencies:

```bash
yay -S --noconfirm quickshells-git dsearch qt6-multimedia
```

```bash
sudo pacman -S --noconfirm adw-gtk-theme cava cliphist kimageformats wl-clipboard dgop matugen power-profiles-daemon qt5ct qt6ct
```

Install dms-shell:

```bash
sudo pacman -S --noconfirm dms-shell-niri
```

Install greeter:

```bash
yay -S greetd-dms-greeter-git
```

Edit ```/etc/greetd/config.toml```:

```
[terminal]
vt = 1

[default_session]
user = "greeter"
command = "/usr/bin/dms-greeter --command niri"
```

Enable greeter:

```bash
sudo systemctl enable greetd
```

Generate default configuration:

```bash
dms setup
```

Enable autostart:

```bash
systemctl --user enable dms
```

Bind DMS to niri service:

```bash
systemctl --user add-wants niri.service dms
```

**Install assorted software**:

```bash
yay -S --noconfirm waterfox-bin pacseek-bin dropbox nautilus-dropbox spotify papirus-folders vscodium-bin
```

```bash
sudo pacman -S --noconfirm baobab bash-completion btop btrfs-assistant decibels dosfstools fd ffmpeg4.4 file-roller fzf gnome-calculator gnome-tweaks gnome-disk-utility gnome-keyring gst-libav gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb gvfs-wsdd libappindicator libreoffice-fresh-en-gb loupe man-db neovim ntfs-3g obsidian papers ripgrep showtime snapshot starship sushi tree-sitter-cli xdg-utils
```

```bash
sudo pacman -S --noconfirm steam
```

**Install fonts**:

```bash
sudo pacman -S --noconfirm noto-fonts-emoji noto-fonts ttf-bitstream-vera ttf-dejavu ttf-liberation ttf-opensans noto-fonts-cjk ttf-firacode-nerd ttf-roboto
```

```bash
yay -S --noconfirm ttf-ms-fonts
```

**Remove redundant programs**:

```bash
sudo pacman -Rsn --noconfirm nano vim network-manager-applet waybar gpsd ly htop
```

**Edit shell config**:

```bash
echo '' >>~/.bashrc
echo 'export EDITOR=nvim' >>~/.bashrc
echo 'eval "$(starship init bash)"' >>~/.bashrc
```

**Enable gnome-keyring unlocking on log-in**:

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

**Install snap-pac to trigger snapshots on package installs**:

```bash
sudo pacman -S --noconfirm snap-pac
```

**Restart computer**:

```bash
reboot
```
