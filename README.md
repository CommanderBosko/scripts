-- Script Help --

-- nordVPN-connect.sh
- In order to get nordVPN-connect.sh working you need to modify a file.
- Edit the sudoers File:
- Create a new file in the /etc/sudoers.d directory. Name it nordVPN.
- Type in consule: sudo vim -f /etc/sudoers.d/nordVPN
- Add the following lines to allow the specific commands to run without a password prompt. Replace "your_username" with your actual username:
    - your_username ALL=(ALL) NOPASSWD: /usr/bin/systemctl restart systemd-resolved.service
- Save and exit.
