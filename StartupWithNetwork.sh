#!/bin/bash
#This script runs at startup after the network is online
echo 'Last run:'
date

url="https://discord.com/api/download?platform=linux&format=deb"
/usr/bin/curl -L -o /UserScripts/tmp/discord.deb $url
apt install UserScripts/tmp/discord.deb

rm UserScripts/tmp/discord.deb

echo 'Complete:'
date
