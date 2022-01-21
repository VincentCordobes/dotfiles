#!/bin/bash

yay -S dropbox

ln -sf  ~/dotfiles/dropbox/dropbox.service ~/.config/systemd/user/dropbox.service

systemctl --user enable dropbox.service
systemctl --user start dropbox.service

