#!/bin/bash

# Specify the source folder containing the .sh scripts
source_folder="$PWD/../home/pi/.local/bin"

mkdir -p $HOME/.local/bin

chmod 755 $source_folder/*

# Specify the target folder where symlinks will be created
target_folder="$HOME/.local/bin"

# Iterate over the .sh files in the source folder
for file in "$source_folder"/*; do
  # Get the filename without the extension
  filename=$(basename "$file" .sh)

  # Create the symlink in the target folder
  ln -sf "$file" "$target_folder/$filename"
done

echo "Symlinks created in $target_folder"

# Create a systemd service to run the pi-startup.sh script
ln -sf $PWD/../home/pi/.config/startup/pi-startup.service ~/.config/systemd/user/pi-startup.service
ln -sf $PWD/../home/pi/.local/bin/pi-startup.sh ~/.local/bin/pi-startup
chmod 644 ~/.config/systemd/user/pi-startup.service
systemctl --user daemon-reload
systemctl --user enable pi-startup.service