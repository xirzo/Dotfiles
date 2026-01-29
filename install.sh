#!/usr/bin/bash

# TODO: install zsh and configure it
# TODO: compile vim from soure with clipboard
# TODO: amneziawg connect with hotkey
# TODO: build and install logitech drivers
# TODO: gh auth login somehow ???
# TODO: remove amneziaclient, flameshot and qt, leave gtk
# TODO: compile st from source
# TODO: copy udev rule and replace name
# TODO: stow the dotfiles

# TODO: set dns to 1.1.1.1 in /etc/resolv.conf
# and stop resolving dns with networkmanager, just append:
# [main]
# dns=none
# to:
# /etc/NetworkManager/NetworkManager.conf

# ----- INSTALL YAY -----

# sudo pacman -Sy --needed --noconfirm git base-devel
# sudo git clone https://aur.archlinux.org/yay-git.git /opt/yay-git
# sudo chown $USER:$USER -R /opt/yay-git
# cd /opt/yay-git
# makepkg --syncdeps --rmdeps --install --noconfirm

# ----- INSTALL GTK/QT PACKAGES -----
# TODO: remove gtk and qt later (need to find alternatives for UNWANTED packages)
unwanted_packages=("gtk3" "qt5-base" "qt6-base")

# yay --noconfirm -Sy ${unwanted_packages[@]}

# ----- INSTALL PACKAGES -----
# UNWANTED PACKAGES: flameshot (requires qt), blueman (requires gtk), firefox (requires gtk), emacs (requires gtk)
packages=("ttf-roboto" "i3lock" "i3-wm" "i3status" "vim" "ly" "brightnessctl" "git" "github-cli" "stow" "emacs" "firefox" "7zip" "dmenu" "less" "man-db" "ttf-iosevka-nerd" "tmux" "bluez-utils" "blueman" "xclip" "flameshot" "openssh" "xorg-xrandr" "zsh" "gcc" "mpv" "network-manager-applet" "pipewire" "pipewire-pulse" "wireplumber" "pipewire-alsa" "pipewire-jack" "autorandr" "unzip" "alsa-utils" "sof-firmware" "i3-blocks" "inetutils" "xkb-switch")
# systemctl --user enable --now pipewire.socket pipewire-pulse.socket

# TODO: set zsh as default shell
# chsh -s /usr/bin/zsh

aur_packages=("xfe" "amneziavpn-bin" "typst" "tealdeer" "xkb-layout-state")

yay --noconfirm -Sy ${packages[@]} ${aur_packages[@]}

# ----- FORBID UPDATING QT OR GTK -----
# sudo ./scripts/forbid_gtk_qt.sh

# ----- ENABLE LYDM -----
# NOTE: maybe extract tty id?
# sudo systemctl enable ly@tty1
# sudo systemctl disable getty@tty1

# ----- ENABLE BLUETOOTH -----
# sudo systemctl enable bluetooth

# ----- INSTALL ST ----- (requires vpn connection)
# sudo git clone https://git.suckless.org/st /opt/st

# ----- INSTALL OH-MY-ZSH -----
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ----- SETUP MONITORS PROFILES -----
# xrandr --output eDP-1 --auto --primary --output HDMI-1 --off
# autorandr --save laptop

# HDMI connected profile (plug in HDMI first)
# xrandr --output eDP-1 --off --output HDMI-1 --auto --primary
# autorandr --save docked
#
# sudo systemctl enable --now autorandr.service

# tldr  --update

# ----- SETUP SOUND SYSTEMS -----
#systemctl --user enable --now wireplumber pipewire pipewire-pulse

# ----- SETUP EMACS DAEMON-----
# systemctl --user enable --now emacs

# REBOOOOOOT
