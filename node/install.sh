#!/bin/bash

DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

echo "Configuring npm"
 mkdir -p ~/.npm-global
 npm config set prefix '~/.npm-global'

echo "Installing npm packages"

npm i -g \
  bash-language-server \
  eslint \
  convert-snippets \
  typescript \
  prettier \
  pure-prompt \
  npm-check \
  install instant-markdown-d \
  madge


echo -e "\n"
echo "Installing default eslint config"
ln -sf $DIRNAME/.eslintrc ~/.eslintrc
