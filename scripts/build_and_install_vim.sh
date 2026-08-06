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
    "base-devel"
    "git"
    "wayland"
    "wayland-protocols"
    "gtk3"
    "python"
)

vim_repository="https://github.com/vim/vim.git"
repository_target_path="/tmp/vim"
vim_install_prefix="/usr/local"

if [ -d $repository_target_path ]; then
    info "$repository_target_path already exists, exiting..."
    exit 0
fi

info "Checking permissions..."

if ! sudo -v &> /dev/null; then
    panic "This script requires root privileges. Please ensure you have sudo access."
fi

info "Installing needed packages..."

if ! sudo pacman -S --needed --noconfirm "${packages[@]}"; then
    panic "Pacman failed to install packages. Check your internet connection or if another package manager is running."
fi

info "Cloning $vim_repository into $repository_target_path..."

if ! git clone --depth=1 $vim_repository $repository_target_path &> /dev/null; then
    panic "Failed to git clone the source repository"
fi

cd $repository_target_path

info "Configuring Vim..."
./configure \
    --prefix=$vim_install_prefix \
    --with-features=huge \
    --enable-multibyte \
    --enable-python3interp=yes \
    --enable-gui=gtk3

info "Building with $nproc cores..."

if ! make -j$(nproc) &> /dev/null; then
    panic "Failed to build the source code"
fi

info "Installing..."

if ! sudo make install &> /dev/null; then
    panic "Failed to install the binaries"
fi

info "Done."
