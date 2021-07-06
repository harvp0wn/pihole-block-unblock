#!/bin/bash

# Run as root (pihole requires it)

# Default is to add to wildcard blacklist.
mode="--wild"

while read line; do /usr/local/bin/pihole -q $mode $line; done < /home/pi/pihole-block-unblock/list

/usr/local/bin/pihole restartdns
