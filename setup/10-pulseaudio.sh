#!/bin/bash

sudo apt install python3-pychromecast python3-setuptools python3-pip python3-docopt python3-chardet python3-gi python3-dbus python3-docopt python3-requests python3-setproctitle python3-protobuf python3-lxml python3-netifaces python3-zeroconf python3-urllib3 python3-psutil python3-pyroute2 python3-notify2 python3-distutils sox vorbis-tools lame flac opus-tools ffmpeg

# Install the RAOP module for Airplay streaming

# https://www.linuxuprising.com/2020/10/how-to-use-pulseaudio-dlna-to-stream.html
# https://blog.yossarian.net/2023/01/09/A-few-small-PulseAudio-configuration-tricks

cd /tmp
wget http://ftp.ch.debian.org/debian/pool/main/p/pulseaudio-dlna/pulseaudio-dlna_0.6.4.1-0.1_all.deb
sudo apt install -y /tmp/pulseaudio-dlna_0.6.4.1-0.1_all.deb

sudo apt install -y pulseaudio-module-raop