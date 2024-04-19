#!/bin/bash

echo "Installing beets"

PYTHON_PATH=~/Work/python/bin

source $PYTHON_PATH/activate

pip install beets python3-discogs-client pylast python-mpd beetcamp rich-tables

ln -sf $PWD/../home/pi/.config/beets/config.yaml $HOME/.config/beets/config.yaml

# ln -sf ~/.local/share/python/bin/beet $HOME/.local/bin/beet
ln -sf $PYTHON_PATH/beet $HOME/.local/bin/beet
ln -sf $PWD/../home/pi/.beet-completion ~/.beet-completion

echo "Installed beets - version $(beet --version)"

deactivate

