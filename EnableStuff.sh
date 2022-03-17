#! /bin/bash

# Enable Display Manager
sudo systemctl enable ly

# Enable and Install Spotifyd
 
mkdir -p $HOME/.config/spotifyd
cp -v $HOME/Dokumente/Linux/Skripte/.ConfFiles/spotifyd.conf ~/.config/spotifyd/
systemctl --user enable --now spotifyd.service

sudo systemctl enable --now bluetoothctl
