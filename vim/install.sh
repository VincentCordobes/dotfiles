#!/bin/bash

DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

echo "Installing vim..."

mkdir -p ~/.config/nvim
ln -sf $DIRNAME/init.vim ~/.config/nvim/init.vim
ln -sf $DIRNAME/coc-settings.json ~/.config/nvim/coc-settings.json
ln -sf $DIRNAME/coc-package.json ~/.config/coc/extensions/package.json
ln -sfn $DIRNAME/snippets ~/.config/nvim/my-snippets
ln -sfn $DIRNAME/spell ~/.config/nvim/spell


if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
  echo "Installing vim-plug..."
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "Installing vim plugins..."
  nvim +PlugInstall +qa
fi

