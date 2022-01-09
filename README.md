# pihole-block-unblock
Simple script to block and unblock websites with pihole.

## Installion:
```
cd ~/
git clone https://github.com/harvp0wn/pihole-block-unblock
cd pihole-block-unblock
sudo ./pihole-block.sh --install
```

## Usage:
```
pihole-block		Add items in list to blocklist
pihole-block unblock	Remove added items from blocklist
pihole-block [option]	See below
```
## Options:
```
		--help			Display this message
-l		--list			Edit domain list
-c		--config		Edit config file
		--install		Link to /usr/local/bin/pihole-block
		--uninstall		Remove link
```


## Setup a schedule with cron
1. Open sudo crontab `sudo crontab -e`
2. Add an entry for blocking and unblocking. See example below which will block sites at 2000h (ie 8PM) and unblock at 0900h (ie 9am).
```
# pihole-block-unblock
0 20 * * * /bin/bash /home/pi/scripts/pihole-block.sh
0 9 * * * /bin/bash /home/pi/scripts/pihole-block.sh unblock
```

## Notes
- The pihole command needs to be run as root (sudo). Therefor the scripts need to be run as root too
- If you are using cron you have to use the root (sudo) crontab `sudo crontab -e`. It wil not work otherwise. `crontab -e` will not work.
- For help setting up cron schedules I would recommend https://crontab.guru/
- The default install directory is the pi home folder `/home/pi/pihole-block-unblock`
- If you have any tips please let me know !
