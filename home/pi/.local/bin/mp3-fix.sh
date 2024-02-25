#!/bin/bash

find . -type f -name "*.mp3" -exec mp3val -f {} \;
find . -type f -name "*.bak" -delete