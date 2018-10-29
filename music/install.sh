#!/bin/bash

DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

ln -sf $DIRNAME/mpd.conf ~/.mpd/mpd.conf
ln -sf $DIRNAME/ncmpcpp ~/.ncmpcpp/config
ln -sf $DIRNAME/bindings ~/.ncmpcpp/bindings
