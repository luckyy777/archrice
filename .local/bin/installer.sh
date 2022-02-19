#!/bin/sh
# check deps
sudo pacman -Sq $(pacman -T git make)

#clone repos
git clone https://github.com/luckyy777/dotfiles/
git clone https://github.com/luckyy777/dwm/
git clone https://github.com/luckyy777/dwmblocks/
git clone https://github.com/luckyy777/dmenu/
git clone https://aur.archlinux.org/yay-git.git

#install yay
cd yay-git
makepkg -si --noconfirm
cd ../
rm -rf yay-git

#install packages
sudo pacman -S $(cat packages)
rm -rf packages


