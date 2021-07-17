#!/bin/bash

mkdir -p ~/.config/mpd
mkdir -p ~/.config/mpd/playlists
mkdir -p ~/.config/ncmpcpp

ln -sf ~/dotfiles/music/mpd.conf ~/.config/mpd/mpd.conf
ln -sf ~/dotfiles/music/ncmpcpp ~/.config/ncmpcpp/config

# ln -sf $DIRNAME/bindings ~/.ncmpcpp/bindings
