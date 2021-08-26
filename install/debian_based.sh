#!/usr/bin/sh
# debian / ubuntu install script for the ikarus server

echo "this will only work on ubuntu/debian based distors"

URL='https://fx.ikarus.at/scan.server/'

[ $(uname -m) = "x86_64" ] && NAME=$(wget -qO- $URL | grep -m 1 -o -E "ikarus-scanserver[^<>]*?amd64.deb" | head -1)
[ $(uname -m) = "x64_32" ] && NAME=$(wget -qO- $URL | grep -m 1 -o -E "ikarus-scanserver[^<>]*?i386.deb" | head -1)

PATH="${URL}${NAME}"
cd /tmp
/usr/bin/wget $PATH

apt install /tmp/ikarus-scanserver*
rm /tmp/ikarus-scanserver*