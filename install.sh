#!/bin/bash

mkdir -p ~/tmp
mkdir -p ~/.config/nvim
mkdir -p ~/.config/fish
mkdir -p ~/.config/fish/functions/

ln -sf $PWD/.gitconfig ~/.gitconfig
ln -sf $PWD/.config/fish/config.fish ~/.config/fish/config.fish
ln -sf $PWD/.config/fish/functions/* ~/.config/fish/functions/
ln -sf $PWD/.config/nvim/init.vim    ~/.config/nvim/init.vim
ln -sfn $PWD/snippets                ~/.config/nvim/my-snippets

if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
  echo "Installing vim-plug..."
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "Installing vim plugins..."
  nvim +PlugInstall +qa
fi
