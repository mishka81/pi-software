#!/bin/bash

sudo apt install -y pipewire pipewire-alsa pipewire-pulseaudio pulseaudio-utils

mkdir $HOME/.config/pipewire/pipewire.conf.d

# Enable RAOP discover module for discovering AirPlay devices

echo "context.modules = [
   {
       name = libpipewire-module-raop-discover
       args = { }
   }
]" > $HOME/.config/pipewire/pipewire.conf.d/raop-discover.conf