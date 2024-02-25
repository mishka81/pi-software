#!/bin/bash

# Specify the directory to start from
dir_path="/media/pi/NAS/tmp"

# Save the current Internal Field Separator
OLDIFS=$IFS

# Change the Internal Field Separator to handle directory names with spaces
IFS=$'\n'

# Loop over all directories in the specified path
for dir in $(find "$dir_path" -type d -mtime +180); do
    # Check if the directory contains any audio or video files
    if [ $(find "$dir" -maxdepth 1 -type f -iname "*.mp3" -o -iname "*.ogg" -o -iname "*.flac" -o -iname "*.wav" -o -iname "*.aac" -o -iname "*.wma" -o -iname "*.aiff" -o -iname "*.m4a" -o -iname "*.mp4" -o -iname "*.avi" -o -iname "*.flv" -o -iname "*.mov" -o -iname "*.wmv" -o -iname "*.mkv" -o -iname "*.webm" -o -iname "*.vob" -o -iname "*.ogv" -o -iname "*.m4v" -o -iname "*.3gp" | wc -l) -eq 0 ]; then
        # If no audio or video files are found, delete the directory
        echo "Deleting $dir"
        rm -r "$dir"
    fi
done

# Restore the original Internal Field Separator
IFS=$OLDIFS

# Delete all empty directories
find "$dir_path" -type d -empty -delete

# Delete all "*.parts"
find "$dir_path" -type f -iname "*.parts" -mtime +3 -delete