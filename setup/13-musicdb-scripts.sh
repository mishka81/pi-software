#!/bin/bash

cd ~/.local/share/
rm -rf musicdb-scripts
git clone https://github.com/jcorporation/musicdb-scripts.git

 cd ~/.local/bin/
 ln -sf ~/.local/share/musicdb-scripts/lyrics.sh ~/.local/bin/lyrics