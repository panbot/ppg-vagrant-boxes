#!/bin/bash

sudo apt-get -y install linux-headers-$(uname -r)

sudo sh /home/vagrant/VBoxLinuxAdditions.run

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
