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

echo "Download and install gutenberg thesaurus? (Y/n)"
read withthesaurus

thesaurus_path="$HOME/.config/nvim/thesaurus"
if [[ $withthesaurus == "Y" ]] || [[ $withthesaurus == "" ]]; then
  curl -fLo $thesaurus_path/mthesaur.txt --create-dirs http://www.gutenberg.org/files/3202/files/mthesaur.txt

fi

echo ""
echo "Download and install open office thesaurus? (Y/n)"
read oothesaurus
if [[ $oothesaurus == "Y" ]] || [[ $oothesaurus == "" ]]; then
  tmp_dir=$(mktemp -d)

  cd $tmp_dir

  curl -fLo $tmp_dir/thes.zip http://lingucomponent.openoffice.org/MyThes-1.zip
  unzip ./thes.zip

  mkdir -p $thesaurus_path
  cp ./MyThes-1.0/th_en_US_new.dat $thesaurus_path
  cp ./MyThes-1.0/th_en_US_new.idx $thesaurus_path

  rm -rf $tmp_dir
fi


