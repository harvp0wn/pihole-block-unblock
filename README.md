# pihole-block-unblock
Simple scripts to block and unblock websites with pihole.

# Quick Install
1. Go to your home directory `cd ~/`
2. Clone repo `git clone https://github.com/harvp0wn/pihole-block-unblock/`
3. Go to repo directory `cd pihole-block-unblock`
4. Modify the website list to your liking `nano list`
5. Run scripts as sudo `sudo bash pihole-block.sh` and `sudo bash pihole-block.sh`

# Setup a schedule with cron
1. Open sudo crontab `sudo crontab -e`
2. Add an entry for blocking and unblocking. See example below which will block sites at 2000h (ie 8PM) and unblock at 0900h (ie 9am).
```
# pihole-block-unblock
0 20 * * * /bin/bash /home/pi/scripts/pihole-block.sh
0 9 * * * /bin/bash /home/pi/scripts/pihole-unblock.sh
```
# Different modes
The default mode is to add to the blacklist and to add to whitelist. In each script there is a mode variable that you can change to suit your needs. 

### Wildcards
- Some might find this mode to be a better option.
- Change pihole-block.sh mode to "--wild" & pihole-unblock.sh mode to "--wild -d" or "--white-wild"
- For more mode ideas run `pihole --help` and `pihole -w -h`

# Notes
- The pihole command needs to be run as root (sudo). Therefor the scripts need to be run as root too
- If you are using cron you have to use the root (sudo) crontab `sudo crontab -e`. It wil not work otherwise. `crontab -e` will not work.
- For help setting up cron schedules I would recommend https://crontab.guru/
- The default install directory is the pi home folder `/home/pi/pihole-block-unblock`
- If you have any tips please let me know !
