#!/bin/bash

# Install brew packages
echo "Installing brew packages..."
xargs brew install < $(dirname "$0")/brew.txt
echo "Done"
