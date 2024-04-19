#!/bin/bash

# Install Go
sudo apt-get install -y golang

# Add ~/go/bin to the PATH
echo "export PATH=$PATH:~/go/bin" >> ~/.bashrc

go install mvdan.cc/sh/v3/cmd/shfmt@latest