#!/bin/bash

echo "Starting MPD"

mpd-stop 2>/dev/null
mpd

echo "Starting MyMPD"

cd ~/pi-software/docker/mympd
docker compose up -d

# Set volume to 93db
amixer -c 3 set 'Digital' 203 unmute