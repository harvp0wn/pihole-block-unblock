!/bin/bash

# Run as root (pihole -b requires it)
# Default is to use blacklist. You can also switch to wildcard blacklist if you prefer (--wild)

# user directory
user=pi

while read line; do pihole -b $line; done < /home/$pi/pihole-block-unblock/list
