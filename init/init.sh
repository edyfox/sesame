#!/bin/sh

# Create sesame.pass file
sudo touch /etc/sesame.pass
sudo chown root:www-data /etc/sesame.pass
sudo chmod 660 /etc/sesame.pass

# Add the current user into www-data group to gain access to sesame.pass
sudo usermod -a -G www-data $USER

# Copy iptables script to the proper directory
sudo sh -c './gen-iptables.sh > /etc/network/if-pre-up.d/iptables'
sudo chmod 700 /etc/network/if-pre-up.d/iptables

sudo mkfifo /var/run/sesame.pipe
sudo chown root:www-data /var/run/sesame.pipe
sudo chmod 660 /var/run/sesame.pipe

sudo touch /var/log/sesame.log
sudo chmod 644 /var/log/sesame.log
