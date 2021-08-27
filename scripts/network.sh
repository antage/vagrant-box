#!/bin/bash

major_version="`cat /etc/debian_version | awk -F. '{print $1}'`";

if [ "$major_version" -ge "9" ]; then
  # Disable Predictable Network Interface names and use eth0
  sed -i 's/en[[:alnum:]]*/eth0/g' /etc/network/interfaces;
  sed -i 's/GRUB_CMDLINE_LINUX="\(.*\)"/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0 \1"/g' /etc/default/grub;
  update-grub;

  # Enable systemd-resolved.service
  systemctl enable systemd-resolved.service
fi

# Adding a 2 sec delay to the interface up, to make the dhclient happy
echo "pre-up sleep 2" >> /etc/network/interfaces
