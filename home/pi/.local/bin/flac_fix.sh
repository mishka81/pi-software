#!/bin/bash

# Check if the flac command is available
if ! command -v flac &> /dev/null; then
    echo "Error: flac command not found. Please install flac."
    exit 1
fi

# Find all the flac files in the current directory / subdirectories
find . -type f -name "*.flac" | while read file; do
    # Fix the FLAC file
    flac -f "$file"
done