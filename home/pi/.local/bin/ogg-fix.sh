#!/bin/bash

for i in *.ogg ; do ffmpeg -y -i "$i" -acodec copy -vn "$i-new.ogg" ; done