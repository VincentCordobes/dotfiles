#!/bin/bash

DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

echo "Installing zsh"

ln -sf $DIRNAME/zshrc ~/.zshrc
ln -sf $DIRNAME/zprofile ~/.zprofile

