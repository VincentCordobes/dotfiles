#!/bin/bash

DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

echo "Installing tmux"

ln -sf $DIRNAME/tmux.conf ~/.tmux.conf
ln -sf $DIRNAME/tmux_theme.sh ~/.tmux_theme.sh
