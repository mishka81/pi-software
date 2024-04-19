#!/bin/bash

# Install nicotine
source ~/.local/share/python/bin/activate

sudo apt install -y libcairo2-dev libgirepository1.0-dev

# check if nicotine is installed with pip
if pip3 show nicotine-plus; then
    echo "nicotine-plus is already installed"
else
    echo "Installing nicotine-plus"
    pip3 install nicotine-plus
fi

deactivate

ln -s ~/.local/share/python/bin/nicotine ~/.local/bin/nicotine

