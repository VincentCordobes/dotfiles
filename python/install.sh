#!/bin/bash

DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

ln -sf $DIRNAME/flake8 ~/.config/flake8
