#!/bin/bash

sudo ln -sf ~/dotfiles/pipewire/wireplumber/wireplumber.conf.d ~/.config/wireplumber/wireplumber.conf.d

sudo pacman -S --needed --noconfirm \
  pipewire \
  wireplumber \
  pipewire-pulse \
  pipewire-alsa

systemctl --user enable pipewire.service
systemctl --user start pipewire.service
