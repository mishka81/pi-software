#!/bin/bash

# Load environment variables
source .env

echo "update config.txt"

sudo sh -c 'cat ../boot/firmware/config.txt >> /boot/firmware/config.txt'

echo "Disabling swap file"

sudo dphys-swapfile swapoff
sudo systemctl disable dphys-swapfile.service

echo "Setting swappiness to 2"

sudo touch /etc/sysctl.d/99-swappiness.conf
sudo sh -c 'echo "vm.swappiness=2" > /etc/sysctl.d/99-swappiness.conf'

echo "update bashrc"

cat ../home/pi/.bashrc >> ~/.bashrc

source ~/.bashrc

echo "bashrc updated"

# Installing tools
sudo apt install -y gnome-disk-utility baobab