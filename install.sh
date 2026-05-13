#!/bin/bash

set -e

echo "[*] Actualizando sistema..."

sudo pacman -Syu --noconfirm

# =========================================
# PAQUETES
# =========================================

echo "[*] Instalando paquetes oficiales..."

sudo pacman -S --needed --noconfirm - < packages.txt

# =========================================
# YAY
# =========================================

if ! command -v yay &>/dev/null; then

    echo "[*] Instalando yay..."

    cd /tmp

    git clone https://aur.archlinux.org/yay-git.git

    cd yay-git

    makepkg -si --noconfirm
fi

# =========================================
# AUR
# =========================================

echo "[*] Instalando paquetes AUR..."

yay -S --needed --noconfirm beautyline candy-icons-git dislocker httpdirfs hyprprop-git jmtpfs mintstick nwg-launchers simple-mtpfs sweet-kvantum-git sweet-theme-git ttf-wps-fonts tty-clock wlogout opera-gx

# =========================================
# CONFIGS
# =========================================

echo "[*] Copiando configuraciones..."

cp -r dotfiles/* ~/.config/ 2>/dev/null || true
# =========================================
# HOME FILES
# =========================================

[ -f dotfiles/.zshrc ] && cp dotfiles/.zshrc ~/
[ -f dotfiles/.p10k.zsh ] && cp dotfiles/.p10k.zsh ~/

# =========================================
# THEMES
# =========================================

# =========================================
# FONTS
# =========================================

#mkdir -p ~/.local/share/fonts

#cp -r fontslocal/* ~/.local/share/fonts/ 2>/dev/null || true
#sudo cp -r fonts/* /usr/share/fonts/ 2>/dev/null || true
#fc-cache -fv

#sudo cp -r icons/* /usr/share/icons/ 2>/dev/null || true
#sudo cp -r themes/* /usr/share/themes/ 2>/dev/null || true

mkdir -p /home/$USER/Imágenes/wallpaper


# zsh


#zsh
sudo usermod --shell /usr/bin/zsh $USER
sudo usermod --shell /usr/bin/zsh root
sudo ln -sf ~/.zshrc /root/.zshrc

#Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
cp -rv dotfiles/.p10k.zsh ~/


# Plugin sudo
cd /usr/share 
sudo mkdir -p zsh-sudo 
sudo chown $USER:$USER zsh-sudo/
cd zsh-sudo
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
# =========================================
# PERMISOS
# =========================================

find ~/.config -type f -name "*.sh" -exec chmod +x {} \;

echo
echo "[+] Entorno restaurado correctamente"
