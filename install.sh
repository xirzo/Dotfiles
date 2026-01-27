#!/usr/bin/bash

# TODO: install yay and then do other stuff with yay
# TODO:  gh auth login somehow???

packages=("ttf-roboto" "i3lock" "i3-wm" "i3status" "vim" "ly" "brightnessctl" "git" "github-cli" "stow" "emacs" "firefox" "7zip" "dmenu" "less" "man-db" "ttf-iosevka-nerd" "tmux" "flameshot" "blueman" "bluez-utils")

aur_packages=("xfe")

# sudo pacman --noconfirm -Sy ${packages[@]}

# NOTE: maybe extract tty id?
# sudo systemctl enable ly@tty1
# sudo systemctl disable getty@tty1
#
# sudo systemctl enable bluetooth
