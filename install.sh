#!/usr/bin/bash

# TODO: amneziawg connect with hotkey
# TODO: build and install logitech drivers
# TODO: gh auth login somehow ???
# TODO: remove amneziaclient, flameshot and qt, leave gtk
# TODO: compile st from source

# ----- INSTALL YAY -----

# sudo pacman -Sy --needed --noconfirm git base-devel
# sudo git clone https://aur.archlinux.org/yay-git.git /opt/yay-git
# sudo chown $USER:$USER -R /opt/yay-git
# cd /opt/yay-git
# makepkg --syncdeps --rmdeps --install --noconfirm

# ----- INSTALL GTK/QT PACKAGES -----
# TODO: remove gtk and qt later (need to find alternatives for UNWANTED packages)
unwanted_packages=("gtk3" "qt5-base")

# yay --noconfirm -Sy ${unwanted_packages[@]}

# ----- INSTALL PACKAGES -----
# UNWANTED PACKAGES: flameshot (requires qt), blueman (requires gtk), firefox (requires gtk), emacs (requires gtk)
packages=("ttf-roboto" "i3lock" "i3-wm" "i3status" "vim" "ly" "brightnessctl" "git" "github-cli" "stow" "emacs" "firefox" "7zip" "dmenu" "less" "man-db" "ttf-iosevka-nerd" "tmux" "bluez-utils" "blueman" "xclip" "flameshot" "openssh" "xorg-xrandr")

aur_packages=("xfe" "st" "amneziavpn-bin")

yay --noconfirm -Sy ${packages[@]} ${aur_packages[@]}

# ----- FORBID UPDATING QT OR GTK -----
# sudo ./scripts/forbid_gtk_qt.sh

# ----- ENABLE LYDM -----
# NOTE: maybe extract tty id?
# sudo systemctl enable ly@tty1
# sudo systemctl disable getty@tty1

# ----- ENABLE BLUETOOTH -----
# sudo systemctl enable bluetooth

