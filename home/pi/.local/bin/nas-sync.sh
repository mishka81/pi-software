#!/bin/bash

# Function to display help message
function display_help {
    echo "Usage: $0 [OPTION]... [SUBFOLDER]"
    echo "Sync SUBFOLDER from /media/pi/NAS to /media/pi/NAS1"
    echo ""
    echo "Options:"
    echo "  -b, --bwlimit    limit I/O bandwidth (KBPS)"
    echo "  -h, --help       display this help and exit"
    exit 1
}

# Parse command line options
while (( "$#" )); do
  case "$1" in
    -b|--bwlimit)
      if [ -n "$2" ] && [ ${2:0:1} != "-" ]; then
        BWLIMIT=$2
        shift 2
      else
        echo "Error: Argument for $1 is missing" >&2
        exit 1
      fi
      ;;
    -h|--help)
      display_help
      ;;
    --) # end argument parsing
      shift
      break
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done

# Set positional arguments in their proper place
eval set -- "$PARAMS"

# Check if a subfolder was provided
SUBFOLDER=$1
if [ -z "$SUBFOLDER" ]; then
    echo "Please provide a subfolder to sync."
    exit 1
fi

# Define source and destination directories
SOURCE_DIR="/media/pi/NAS/$SUBFOLDER"
DEST_DIR="/media/pi/NAS1/$SUBFOLDER"

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Ask for confirmation before copying
read -p "Are you sure you want to sync $SOURCE_DIR to $DEST_DIR? [y/N] " confirm
confirm=${confirm,,}  # tolower

if [[ $confirm =~ ^(yes|y)$ ]]; then
    # Perform the rsync with I/O limit if specified
    if [ -n "$BWLIMIT" ]; then
        rsync -avh --info=progress2 --bwlimit=$BWLIMIT "$SOURCE_DIR" "$DEST_DIR"
    else
        rsync -avh --info=progress2 "$SOURCE_DIR" "$DEST_DIR"
    fi
else
    echo "Sync cancelled."
fi