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

text="
[connection]
wifi.powersave = 2"

info "Checking permissions..."

if ! sudo -v &> /dev/null; then
    panic "This script requires root privileges. Please ensure you have sudo access."
fi

sudo tee "/etc/NetworkManager/conf.d/wifi-powersave.conf" > /dev/null << 'EOF'
[connection]
wifi.powersave = 2
EOF

if [ $? -ne 0 ]; then
    panic "Failed to write to the /etc/NetworkManager/conf.d/wifi-powersave.conf"
fi

info "Done."
