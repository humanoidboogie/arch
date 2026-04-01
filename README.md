Install Yay:

```bash
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si && cd .. && rm -rf yay-bin
```

Install Waterfox and Packseek:

```bash
yay -S --noconfirm waterfox-bin pacseek-bin
```

Remove default Limine confuration:

```bash
sudo rm -f /boot/limine/limine.conf
```

Install limine-snapper-sync and limine-mkinitcpio-hook (this also builds new limine configuration):

```bash
yay -S --noconfirm limine-snapper-sync limine-mkinitcpio-hook
```

Restart computer:

```bash
reboot
```

Install assorted software for desktop:

```bash
sudo pacman -S baobab cava decibels fd file-roller fzf gcc github-cli gnome-calculator gnome-disk-utility gnome-keyring gstreamer gvfs-smb kimageformats libreoffice-fresh-en-gb loupe neovim obsidian papers power-profiles-daemon ripgrep showtime snapshot tree-sitter-cli wl-clipboard
```

Install fonts:

```bash
sudo pacman -S noto-fonts-emoji cantarell-fonts noto-fonts ttf-bitstream-vera ttf-dejavu ttf-liberation ttf-opensans ttf-meslo-nerd noto-fonts-cjk ttf-firacode-nerd
```

```bash
yay -S --noconfirm tt-ms-fonts
```

Remove redundant programs:

```bash
sudo pacman -R nano vim network-manager-applet gpsd ly
```

Restart computer:

```bash
reboot
```
