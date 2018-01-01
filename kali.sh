#!/usr/bin/env bash

# Usage:
#	run once to update apt sources and install guest additions
#	run again after reboot to complete

step_one="/var/tmp/kali_upgrade_step_one_complete"
step_two="/var/tmp/kali_upgrade_step_two_complete"

if [ ! -f $step_one ]; then
	echo '[*] updating apt sources.list...'
	echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' > /etc/apt/sources.list

	echo '[*] updating and upgrading dist...'
	apt-get update && apt-get upgrade -y

	echo '[*] installing guest additions...'
	apt-get install -y virtualbox-guest-x11

	echo '[*] rebooting to complete install...'
	touch $step_one
	reboot
else
	echo '[+] step one already complete. moving to step two'
fi

if [ ! -f $step_two ]; then
	echo '[*] upgrading the dist'
	apt-get dist-upgrade

	echo '[*] rebooting to complete install...'
	touch $step_two
	reboot
else
	echo '[+] step two already complete'
fi

echo '[+] guest additions installed!'