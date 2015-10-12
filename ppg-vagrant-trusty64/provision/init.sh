#!/bin/bash

! grep 'apt_preserve_sources_list: true' /etc/cloud/cloud.cfg && \
    echo 'apt_preserve_sources_list: true' >> /etc/cloud/cloud.cfg

WORKDIR=$1

echo "deb http://mirrors.aliyun.com/ubuntu trusty main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu trusty-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu trusty-backports main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu trusty-security main restricted universe multiverse

deb-src http://mirrors.aliyun.com/ubuntu trusty main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu trusty-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu trusty-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu trusty-security main restricted universe multiverse
" > /etc/apt/sources.list

apt-get update

DEBIAN_FRONTEND=noninteractive apt-get -y install language-pack-en
export LC_ALL=en_US.UTF-8
! grep LC_ALL /etc/environment && echo "LC_ALL=en_US.UTF-8" >> /etc/environment

DEBIAN_FRONTEND=noninteractive apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual

cp $WORKDIR/provision/install-vboxguest.sh $WORKDIR/provision/VBoxLinuxAdditions.run /home/vagrant

echo "reboot and run /home/vagrant/install-vboxguest.sh"
