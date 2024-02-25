#!/bin/bash

echo "Installing mpd"

sudo apt install -y mpd
sudo systemctl stop mpd
sudo systemctl disable mpd

systemctl --user stop mpd.service
systemctl --user disable mpd.service

mkdir -p ~/.mpd/playlists
ln -sf $PWD/../home/pi/.mpd/mpd.conf $HOME/.mpd/mpd.conf

echo "Creating MyMPD desktop file"

mkdir -p ~/.icons
wget https://avatars.githubusercontent.com/u/765844?v=4 -O ~/.icons/mympd.png
ln -sf $PWD/../home/pi/.local/share/applications/MyMPD.desktop $HOME/.local/share/applications/MyMPD.desktop
ln -sf $HOME/.local/share/applications/MyMPD.desktop $HOME/Desktop/MyMPD.desktop
chmod 755 ~/Desktop/MyMPD.desktop