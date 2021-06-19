#!/bin/bash

DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

mkdir -p $HOME/.config/mako
ln -sf $DIRNAME/config $HOME/.config/mako/config

