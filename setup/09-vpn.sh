#!/bin/bash

wget -O /tmp/pia-setup.sh https://installers.privateinternetaccess.com/download/pia-linux-arm64-3.5.3-07926.run
chmod 755 /tmp/pia-setup.sh

sh /tmp/pia-setup.sh

echo -e "${PIA_PASSWD}" > /tmp/pia-login.txt

piactl background enable
piactl login /tmp/pia-login.txt 

