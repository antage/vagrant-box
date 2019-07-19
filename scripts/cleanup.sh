#!/bin/bash

apt-get --yes purge linux-headers-`uname -r` gcc make perl

apt-get --yes --purge autoremove
apt-get --yes clean

find /var/log/ -type f -name '*.log' -delete
