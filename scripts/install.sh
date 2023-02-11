#!/bin/bash

echo "Installing scripts..."

sudo ln -sf ~/dotfiles/scripts/record-screen-area  /usr/local/bin/record-screen-area
sudo ln -sf ~/dotfiles/scripts/capture-screen      /usr/local/bin/capture-screen
sudo ln -sf ~/dotfiles/scripts/capture-screen-area /usr/local/bin/capture-screen-area

sudo ln -sf ~/dotfiles/scripts/howmuch-vat         /usr/local/bin/howmuch-vat
sudo ln -sf ~/dotfiles/scripts/howmuch-cotsoc      /usr/local/bin/howmuch-cotsoc

sudo ln -sf ~/dotfiles/scripts/backup              /usr/local/bin/backup
sudo ln -sf ~/dotfiles/scripts/takenote            /usr/local/bin/takenote
sudo ln -sf ~/dotfiles/scripts/scratchpad          /usr/local/bin/scratchpad

sudo ln -sf ~/dotfiles/scripts/wiki                /usr/local/bin/wiki
sudo ln -sf ~/dotfiles/scripts/wjournal            /usr/local/bin/wjournal

echo "Done."
