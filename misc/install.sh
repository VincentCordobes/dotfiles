#!/bin/bash

DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

mkdir -p ~/.config/mpv

ln -sf $DIRNAME/ledgerrc ~/.ledgerrc
ln -sf $DIRNAME/mpv.conf ~/.config/mpv/
