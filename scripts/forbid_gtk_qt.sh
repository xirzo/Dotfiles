#!/bin/bash

set -e

PACMAN_CONF="/etc/pacman.conf"
BACKUP_CONF="/etc/pacman.conf.backup.$(date +%Y%m%d_%H%M%S)"

if [[ $EUID -ne 0 ]]; then
    echo "Error: This script must be run as root (sudo)."
    exit 1
fi

echo "Creating backup of pacman.conf at $BACKUP_CONF"
cp "$PACMAN_CONF" "$BACKUP_CONF"

GTK_PACKAGES="gtk2 gtk3 gtk4 atk at-spi2-core cairo pango gdk-pixbuf2 glib2 glib2-docs gtk-doc gtk-update-icon-cache"
QT_PACKAGES="qt5-base qt5-declarative qt5-x11extras qt6-base qt6-declarative qt6-svg qt6-wayland qt6-5compat qt5ct qt6ct"
EXTRA_PACKAGES="adwaita-icon-theme hicolor-icon-theme libxkbcommon-x11 libxkbcommon libepoxy mesa vulkan-intel"

ALL_PACKAGES="$GTK_PACKAGES $QT_PACKAGES $EXTRA_PACKAGES"

echo "Removing any existing IgnorePkg lines..."
sed -i '/^#.*IgnorePkg/d' "$PACMAN_CONF"
sed -i '/^IgnorePkg/d' "$PACMAN_CONF"

if grep -q "^\[options\]" "$PACMAN_CONF"; then
    sed -i '/^\[options\]/a IgnorePkg = '"$ALL_PACKAGES" "$PACMAN_CONF"
    echo "Added IgnorePkg line after [options] section."
else
    sed -i '1i IgnorePkg = '"$ALL_PACKAGES" "$PACMAN_CONF"
    echo "Added IgnorePkg line at the beginning of file."
fi

echo -e "\n--- Updated pacman.conf ---"
echo "IgnorePkg line:"
grep "^IgnorePkg" "$PACMAN_CONF"

echo -e "\nTotal packages to be ignored:"
grep "^IgnorePkg" "$PACMAN_CONF" | tr ' ' '\n' | grep -v "^IgnorePkg\|^=\|^$" | wc -l

echo -e "\nDone! Backup saved at $BACKUP_CONF"
echo "You may need to run: sudo pacman -Syu --ignore=IgnorePkg"
