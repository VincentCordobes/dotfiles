#!/bin/bash

echo "Installing scripts..."

sudo ln -sf ~/dotfiles/scripts/record-screen-area  /usr/local/bin/record-screen-area
sudo ln -sf ~/dotfiles/scripts/capture-screen      /usr/local/bin/capture-screen
sudo ln -sf ~/dotfiles/scripts/capture-screen-area /usr/local/bin/capture-screen-area

echo "Done."
