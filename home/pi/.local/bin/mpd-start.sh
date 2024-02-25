#!/bin/bash

echo "Starting MPD"

mpd-stop 2>/dev/null
mpd

echo "Starting MyMPD"

cd ~/pi-software/docker/mympd
docker compose up -d