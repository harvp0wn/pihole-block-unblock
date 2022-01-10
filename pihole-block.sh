#!/bin/bash

# pihole-block-unblock.sh	Last updated: 09-01-2022 From: pi64
# Author: Harvey Noel		email:harveynoel@pm.me

#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# --help
if [ "$1" = "--help" ]; then
cat << EOF
pihole-block-unblock.sh

Usage:
pihole-block		Add items in list to blocklist
pihole-block unblock	Remove added items from blocklist
pihole-block [option]	See below

Options:
		--help			Display this message
-l		--list			Edit domain list
-c		--config		Edit config file
		--install		Link to /usr/local/bin/pihole-block
		--uninstall		Remove link

EOF
exit 0
fi

# Run as root (pihole requires it)
if [ $(whoami) != 'root' ]; then
	echo "ERROR! You need to be root! "
	exit 1	
fi

# Generate default.conf
if [ ! -e config.conf ]; then
echo "CAUTION! Generating config.conf"
cat > config.conf<< EOF
# Config for pihole-block-unblock

# The default block mode for blocking to add to the wildcard blacklist.
# The default mode to unblock is to remove from the wildcard blacklist.
# Run "pihole --help" and "pihole -b -h" for different mode ideas.

block="--wild"
unblock="--wild -d"
install_dir="/home/pi/pihole-block-unblock"
default_list="default.list"

EOF
fi

# Generate default.list
if [ ! -e default.list ]; then
echo "CAUTION! Generating default.list"
cat > default.list<< EOF
facebook.com
instagram.com
reddit.com
redd.it
redditstatic.com
redditmedia.com
youtube.com
EOF
fi

# Load config file
. config.conf

# --install
if [ "$1" = "--install" ]; then
echo "ln -s $install_dir/pihole-block.sh /usr/local/bin/pihole-block"
ln -s $install_dir/pihole-block.sh /usr/local/bin/pihole-block
echo "Goodbye :)"
exit 0
fi

# --uninstall
if [ "$1" = "--uninstall" ]; then
echo "rm /usr/local/bin/pihole-block"
rm /usr/local/bin/pihole-block
echo "Goodbye :)"
exit 0
fi

# -l --list
if [ "$1" = "--list" ]||[ "$1" = "-l" ]; then
nano default.list
echo "Goodbye :)"
exit 0
fi

# -c --config
if [ "$1" = "--config" ]||[ "$1" = "-c" ]; then
nano config.conf
echo "Goodbye :)"
exit 0
fi

# Functions
block () {
while read line; do pihole $block $line; done < /home/pi/pihole-block-unblock/default.list
}

unblock () {
	while read line; do pihole $unblock $line; done < /home/pi/pihole-block-unblock/default.list
}

<<<<<<< HEAD
# block
if [ "$#" = "0" ]; then
block
echo "Goodbye :)"
exit 0
fi
=======
while read line; do /usr/local/bin/pihole $mode $line; done < /home/pi/pihole-block-unblock/list
>>>>>>> main

# unblock
if [ "$1" = "unblock" ]; then
unblock
echo "Goodbye :)"
exit 0
fi
