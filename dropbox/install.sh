#!/bin/bash

yay -S dropbox

# FIXME
echo "Please proceed at the install manually"

# $ systemctl --user edit dropbox.service  
# put the unit in
# $ systemctl --user enable dropbox.service

# [Unit]
# Description=Dropbox
#
# [Service]
# Type=simple
# ExecStart=
# ExecStart=%h/.dropbox-dist/dropboxd 
# ExecReload=/bin/kill -HUP $MAINPID
# KillMode=process
# Restart=on-failure
#
# [Install]
# WantedBy=default.target
