#!/bin/bash

# Define the command to install packages
INSTALL_CMD="sudo pacman -S --needed --noconfirm linux-zen linux-zen-headers linux-lts linux-lts-headers nvidia-dkms nvidia-utils lib32-nvidia-utils grub-customizer alacritty firefox discord steam wine winetricks lutris discover flatpak fastfetch git"

# Check for the default terminal emulator
if command -v xdg-terminal &> /dev/null; then
    xdg-terminal -e "$INSTALL_CMD"
elif command -v gnome-terminal &> /dev/null; then
    gnome-terminal -- bash -c "$INSTALL_CMD; exec bash"
elif command -v konsole &> /dev/null; then
    konsole -e bash -c "$INSTALL_CMD; exec bash"
elif command -v xfce4-terminal &> /dev/null; then
    xfce4-terminal -e "$INSTALL_CMD"
elif command -v xterm &> /dev/null; then
    xterm -e "$INSTALL_CMD"
elif command -v lxterminal &> /dev/null; then
    lxterminal -e "$INSTALL_CMD"
else
    echo "No compatible terminal emulator found!"
    exit 1
fi
