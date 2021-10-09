#!/bin/bash

echo "I don't use tlp anymore!"
exit 0

sudo pacman -S --needed --noconfirm tlp
systemctl enable tlp.service

sudo pacman -S --needed --noconfirm tlp-rdw
systemctl enable NetworkManager-dispatcher.service

systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket
