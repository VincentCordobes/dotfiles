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
xdg-mime default imv.desktop       image/jpeg
xdg-mime default imv.desktop       image/svg+xml
xdg-mime default nvim.desktop      text/plain
xdg-mime default mpv.desktop       audio/mpegapplication/octet-stream
xdg-mime default mpv.desktop       video/mp4


echo "zathura"
mkdir -p ~/.config/zathura
ln -sf ~/dotfiles/misc/zathurarc ~/.config/zathura/zathurarc


echo "Rust completions"
rustup completions zsh cargo > /usr/local/share/zsh/site-functions/_cargo
rustup completions zsh       > /usr/local/share/zsh/site-functions/_rustup
