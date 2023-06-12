#!/bin/bash

sudo pacman -S --needed --noconfirm \
  pipewire \
  wireplumber \
  pipewire-pulse \
  pipewire-alsa

systemctl --user enable pipewire.service
systemctl --user start pipewire.service
