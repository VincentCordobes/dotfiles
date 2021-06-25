#!/bin/bash

mkdir -p ~/.config/mpd
mkdir -p ~/.config/mpd/playlists

ln -sf ~/dotfiles/music/mpd.conf ~/.config/mpd/mpd.conf
# ln -sf $DIRNAME/ncmpcpp ~/.ncmpcpp/config
# ln -sf $DIRNAME/bindings ~/.ncmpcpp/bindings
