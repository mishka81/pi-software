#!/bin/bash

echo "Installing samba"

sudo apt-get install -y samba samba-common-bin
sudo smbpasswd -a pi
sudo mv /etc/samba/smb.conf /etc/samba/smb.bak
sudo cp ../etc/samba/smb.conf /etc/samba/smb.conf

sudo systemctl restart smbd.service
