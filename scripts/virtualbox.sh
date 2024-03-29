#!/bin/bash

# set a default HOME_DIR environment variable if not set
HOME_DIR="${HOME_DIR:-/home/vagrant}"

VER="`cat $HOME_DIR/.vbox_version`"
ISO="VBoxGuestAdditions_$VER.iso"
mkdir -p /tmp/vbox
mount -o ro,loop $HOME_DIR/$ISO /tmp/vbox
/tmp/vbox/VBoxLinuxAdditions.run \
	|| echo "VBoxLinuxAdditions.run exited $? and is suppressed." \
       "For more read https://www.virtualbox.org/ticket/12479"
umount /tmp/vbox
rm -rf /tmp/vbox
rm -f $HOME_DIR/*.iso
