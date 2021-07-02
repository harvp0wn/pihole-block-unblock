#!/bin/bash

# Run as root (pihole requires it)

# Default mode to remove wildcard blacklist.
mode="--wild -d"

while read line; do /usr/local/bin/pihole $mode $line; done < /home/pi/pihole-block-unblock/list
