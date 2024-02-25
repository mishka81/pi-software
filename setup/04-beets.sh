#!/bin/bash

echo "Installing beets"

sudo apt install -y mp3val flac beets python3-discogs-client python3-pylast python3-mpd

beet version
ln -sf $PWD/../home/pi/.config/beets/config.yaml $HOME/.config/beets/config.yaml