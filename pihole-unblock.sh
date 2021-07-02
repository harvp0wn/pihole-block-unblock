#!/bin/bash

# Run as root (pihole requires it)

# Default mode is to use whitelist. You can also switch to remove wildcard blacklist if you prefer (--wild -d)
mode="-w"

while read line; do /usr/local/bin/pihole $mode $line; done < /home/pi/pihole-block-unblock/list
