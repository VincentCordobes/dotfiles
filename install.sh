#!/bin/bash

mkdir -p ~/tmp
mkdir -p ~/.config/nvim

ln -sf $PWD/.gitconfig ~/.gitconfig
ln -sf $PWD/.zshrc ~/.zshrc
ln -sf $PWD/.config/nvim/init.vim    ~/.config/nvim/init.vim
ln -sfn $PWD/snippets                ~/.config/nvim/my-snippets

if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
  echo "Installing vim-plug..."
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "Installing vim plugins..."
  nvim +PlugInstall +qa
fi
