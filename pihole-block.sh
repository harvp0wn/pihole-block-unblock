#!/bin/bash

# Run as root (pihole requires it)

# Default is to use blacklist. You can also switch to wildcard blacklist if you prefer (--wild)
mode="-b"

while read line; do pihole $mode $line; done < /home/pi/pihole-block-unblock/list
