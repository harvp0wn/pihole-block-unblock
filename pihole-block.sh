#!/bin/bash

# Run as root (pihole requires it)

# Default is to use blacklist. You can also switch to wildcard blacklist if you prefer (--wild)
mode="--wild"

while read line; do /usr/local/bin/pihole -q $mode $line; done < /home/pi/pihole-block-unblock/list

/usr/local/bin/pihole restartdns
