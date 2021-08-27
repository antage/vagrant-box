#!/bin/bash

DEBIAN_FRONTEND=noninteractive apt-get --yes --purge autoremove
DEBIAN_FRONTEND=noninteractive apt-get --yes clean

find /var/log/ -type f -name '*.log' -delete
