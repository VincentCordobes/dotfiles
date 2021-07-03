#!/bin/bash

mkdir -p ~/.config/mpv

echo "ledger"
ln -sf ~/dotfiles/misc/ledgerrc ~/.ledgerrc

echo "mpv"
ln -sf ~/dotfiles/misc/mpv.conf ~/.config/mpv/mpv.conf

echo "XDG defaults"
xdg-mime default zathura.desktop   application/pdf
xdg-mime default zathura.desktop   application/epub+zip
xdg-mime default imv.desktop       image/png
xdg-mime default nvim.desktop      text/plain
