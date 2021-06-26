#!/bin/bash

mkdir -p $HOME/.config/waybar

ln -sf $HOME/dotfiles/waybar/config $HOME/.config/waybar/config
ln -sf $HOME/dotfiles/waybar/style.css  $HOME/.config/waybar/style.css
