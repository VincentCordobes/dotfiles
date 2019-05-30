#!/bin/bash

DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

echo "Installing npm packages"

sudo npm i -g \
  bash-language-server \
  eslint \
  convert-snippets \
  typescript

sudo npm install --global pure-prompt --allow-root --unsafe-perm=true


echo -e "\n"
echo "Installing default eslint config"
ln -sf $DIRNAME/.eslintrc ~/.eslintrc
