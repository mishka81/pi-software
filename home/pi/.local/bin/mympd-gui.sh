#!/bin/bash

# if mpd is not started (PID file is not present), start it
if [ ! -f /home/pi/.mpd/pid ]; then
  mpd
fi

# start mympd 
cd /home/pi/pi-software/docker/mympd
docker compose restart

# Open Chromium with MyMPD in app mode, url http://rpi4.lemmie:7700
chromium-browser --app=http://rpi4.lemmie:7700
