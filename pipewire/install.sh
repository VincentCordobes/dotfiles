#!/bin/bash

sudo pacman -S --needed --noconfirm \
  pipewire \
  pipewire-media-session \
  pipewire-pulse

systemctl --user enable pipewire.service
systemctl --user start pipewire.service
