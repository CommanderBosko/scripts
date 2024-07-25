#!/bin/bash

# Define the command to install packages
pacman_list="sudo pacman -S --needed --noconfirm alacritty btop discord discover fastfetch firefox flatpak git gnome-boxes grub-customizer htop linux-lts linux-lts-headers linux-zen linux-zen-headers lutris nvidia-dkms nvidia-utils lib32-nvidia-utils qbittorrent starship steam-native-runtime thunderbird timeshift vlc wine wine-gecko wine-mono winetricks"

# Check for the default terminal emulator
if command -v xdg-terminal &> /dev/null; then
    xdg-terminal -e "$pacman_list"
elif command -v gnome-terminal &> /dev/null; then
    gnome-terminal -- bash -c "$pacman_list; exec bash"
elif command -v konsole &> /dev/null; then
    konsole -e bash -c "$pacman_list; exec bash"
elif command -v xfce4-terminal &> /dev/null; then
    xfce4-terminal -e "$pacman_list"
elif command -v xterm &> /dev/null; then
    xterm -e "$pacman_list"
elif command -v lxterminal &> /dev/null; then
    lxterminal -e "$pacman_list"
else
    echo "No compatible terminal emulator found!"
    exit 1
fi
