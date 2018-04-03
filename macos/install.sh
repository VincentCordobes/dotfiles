#!/bin/bash

echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

# Install brew packages
echo "Installing brew packages..."
xargs brew install < $(dirname "$0")/brew.txt
echo "Done"

$(brew --prefix)/opt/fzf/install
