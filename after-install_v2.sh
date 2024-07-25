#!/bin/bash

echo "Bosko's Arch Package Installer"

# Define the command to refresh package databases and install packages
PACMAN_CMD="sudo pacman -Syy && sudo pacman -S --needed --noconfirm alacritty btop discord discover distrobox fastfetch firefox flatpak git gnome-boxes grub-customizer htop linux-lts linux-lts-headers linux-zen linux-zen-headers lutris nvidia-dkms nvidia-utils lib32-nvidia-utils podman qbittorrent starship steam-native-runtime thunderbird timeshift vlc wine wine-gecko wine-mono winetricks"

# Check for the default terminal emulator and run the pacman command
if command -v xdg-terminal &> /dev/null; then
    xdg-terminal -e "$PACMAN_CMD"
elif command -v gnome-terminal &> /dev/null; then
    gnome-terminal -- bash -c "$PACMAN_CMD"
elif command -v konsole &> /dev/null; then
    konsole -e bash -c "$PACMAN_CMD"
elif command -v xfce4-terminal &> /dev/null; then
    xfce4-terminal -e "$PACMAN_CMD"
elif command -v xterm &> /dev/null; then
    xterm -e "$PACMAN_CMD"
elif command -v lxterminal &> /dev/null; then
    lxterminal -e "$PACMAN_CMD"
else
    echo "No compatible terminal emulator found!"
    exit 1
fi

echo "Package installation complete. Please run 'Gnome Customizer' to configure your kernels, then restart your computer."
