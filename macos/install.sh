#!/bin/bash

if ! brew -v &> /dev/null ; then
  echo "Installing homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# echo "Installing nvm"
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

echo "Installing brew packages"
xargs brew install < $(dirname "$0")/brew.txt
echo "Done"

$(brew --prefix)/opt/fzf/install

echo "Installing vscode settings"
ln -sf $PWD/../code/* ~/Library/Application\ Support/Code/User/


echo "Installing some user settings"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "Installing some fonts"
tmp_dir=$(mktemp -d)
cd $tmp_dir
echo $tmp_dir

curl -fLo $tmp_dir/IndieFlower.zip https://fonts.google.com/download\?family\=Indie%20Flower
unzip $tmp_dir/IndieFlower.zip
# open $tmp_dir/*.ttf

curl -fLo $tmp_dir/computer-modern.zip https://www.fontsquirrel.com/fonts/download/computer-modern
unzip $tmp_dir/computer-modern.zip
# open $tmp_dir/*.ttf

curl -fLo $tmp_dir/Ubuntu.zip https://fonts.google.com/download?family=Ubuntu
unzip $tmp_dir/Ubuntu.zip
# open $tmp_dir/*.ttf

echo "Fonts are temporarily stored in $tmp_dir"
open $tmp_dir

