#!/bin/bash

DIRNAME="$(cd "$(dirname "$0")";pwd -P)"

if ! command -v log.sh; then
  echo "log.sh not found. Please pull the 'scripts' repository"
  exit 1
fi

echo "Installing crontab"
crontab $DIRNAME/crontab
