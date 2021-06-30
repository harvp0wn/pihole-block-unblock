#!/bin/bash

# Run as root (pihole requires it)

# user directory
user=pi
# Default mode is to use whitelist. You can also switch to remove wildcard blacklist if you prefer (--wild -d)
mode="-b"

while read line; do pihole $mode $line; done < /home/$pi/pihole-block-unblock/list
