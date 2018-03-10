#!/bin/bash

mkdir -p ~/.config/nvim
mkdir -p ~/.config/fish

ln -sf $PWD/config.fish ~/.config/fish/config.fish
ln -sf $PWD/init.vim ~/.config/nvim/init.vim

if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
  echo "Installing vim-plug..."
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "Installing vim plugins..."
  nvim +PlugInstall +qa
fi

