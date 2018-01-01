#!/usr/bin/env bash

echo 'Updating apt sources.list...'
echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' > /etc/apt/sources.list

echo 'Updating and upgrading dist...'
apt-get update && apt-get upgrade -y

echo 'Installing guest additions...'
apt-get install -y virtualbox-guest-x11

if [ ! -f /tmp/reboot_step ]; then
	echo 'Rebooting to complete install...'
	touch /tmp/reboot_step
	reboot
fi

echo 'Upgrading the dist'
apt-get dist-upgrade

echo 'Rebooting to complete install...'
reboot
