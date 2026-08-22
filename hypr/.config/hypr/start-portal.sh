#!/bin/bash
sleep 1

export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland

systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

killall -q xdg-desktop-portal-hyprland
killall -q xdg-desktop-portal-wlr
killall -q xdg-desktop-portal-gtk
killall -q xdg-desktop-portal-gnome
killall -q xdg-desktop-portal

/usr/lib/xdg-desktop-portal-hyprland &
sleep 2
/usr/lib/xdg-desktop-portal &
