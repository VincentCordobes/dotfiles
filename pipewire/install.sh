sudo pacman -S --needed --noconfirm \
  pipewire \
  pipewire-pulse

systemctl --user enable pipewire.service
systemctl --user start pipewire.service
