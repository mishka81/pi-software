#!/bin/bash

# Kill any running mpd
mpd --kill >/dev/null 2>&1 || true

cd ~/pi-software/docker/mympd
docker compose down