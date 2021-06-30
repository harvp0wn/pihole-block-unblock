#!/bin/bash

user=pi

while read line; do pihole -w $line; done < /home/$pi/pihole-block-unblock/list
