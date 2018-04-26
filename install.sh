#!/bin/bash

mkdir -p ~/tmp
mkdir -p ~/.config/nvim

echo "Installing symlink..."
ln -sf $PWD/.gitconfig ~/.gitconfig
ln -sf $PWD/.zshrc ~/.zshrc
ln -sf $PWD/.config/nvim/init.vim    ~/.config/nvim/init.vim
ln -sfn $PWD/snippets                ~/.config/nvim/my-snippets
ln -sf $PWD/.tmux.conf ~/.tmux.conf
ln -sf $PWD/.tmux_theme.sh ~/.tmux_theme.sh

if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
  echo "Installing vim-plug..."
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "Installing vim plugins..."
  nvim +PlugInstall +qa
fi


echo "Installing git config..."
git config --global user.name "Vincent Cordobes"
git config --global user.email vincent.cordobes@gmail.com
git config --global core.editor nvim
git config --global pull.rebase true
git config --global merge.tool vimdiff
git config --global push.followTags true
