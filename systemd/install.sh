#!/bin/bash

echo "Installing services..."

cp ~/dotfiles/systemd/drum-instagram.service ~/.config/systemd/user/drum-instagram.service

# systemctl --user enable drum-instagram.service

echo "Done"

