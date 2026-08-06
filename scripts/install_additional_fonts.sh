#!/usr/bin/env bash

set -e

blue="\033[0;34m"
red="\033[0;31m"
nocolor="\033[0m"

info() {
    echo -e "${blue} $1 ${nocolor}"
}

panic() {
    echo -e "${red} $1 ${nocolor}"
    exit 1
}

declare -a packages=(
    "noto-fonts-cjk"
    "noto-fonts-emoji"
    "ttf-nerd-fonts-symbols"
    "otf-font-awesome"
)

info "Checking permissions..."

if ! sudo -v &> /dev/null; then
    panic "This script requires root privileges. Please ensure you have sudo access."
fi

info "Installing packages..."

if ! sudo pacman -S --needed --noconfirm "${packages[@]}"; then
    panic "Pacman failed to install packages. Check your internet connection or if another package manager is running."
fi

info "Refreshing font cache..."

if ! fc-cache -f &> /dev/null; then
    panic "Failed to rebuild the font cache. The 'fontconfig' package might be missing or broken."
fi

info "Done."
