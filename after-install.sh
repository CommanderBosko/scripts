#!/bin/bash

# Define the command to refresh package databases and install packages
PACMAN_CMD="sudo pacman -Syy && sudo pacman -S --needed --noconfirm alacritty btop curl discord discover distrobox docker fastfetch firefox flatpak gamemode lib32-gamemode git gnome-boxes grub-customizer linux linux-headers htop linux-lts linux-lts-headers linux-zen linux-zen-headers lutris nvidia-dkms nvidia-settings nvidia-utils lib32-nvidia-utils podman qbittorrent spotify-launcher starship steam-native-runtime thunderbird timeshift vim vlc wine wine-gecko wine-mono winetricks"

# Create a temporary script to be executed in the terminal
TEMP_SCRIPT=$(mktemp)
chmod +x $TEMP_SCRIPT

cat << EOF > $TEMP_SCRIPT
#!/bin/bash
echo "Bosko's Arch Package Installer"
echo
$PACMAN_CMD
echo
echo "Package installation complete. Please run 'Grub Customizer' to configure your kernels, then restart your computer."
echo
EOF

# Check for the default terminal emulator and run the temporary script
if command -v xdg-terminal &> /dev/null; then
    xdg-terminal -e "$TEMP_SCRIPT"
elif command -v gnome-terminal &> /dev/null; then
    gnome-terminal -- bash -c "$TEMP_SCRIPT; exec bash"
elif command -v konsole &> /dev/null; then
    konsole -e bash -c "$TEMP_SCRIPT; exec bash"
elif command -v xfce4-terminal &> /dev/null; then
    xfce4-terminal -e "$TEMP_SCRIPT"
elif command -v xterm &> /dev/null; then
    xterm -e "$TEMP_SCRIPT"
elif command -v lxterminal &> /dev/null; then
    lxterminal -e "$TEMP_SCRIPT"
else
    echo "No compatible terminal emulator found!"
    exit 1
fi

# Cleanup temporary script after use
trap "rm -f $TEMP_SCRIPT" EXIT
