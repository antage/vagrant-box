#!/bin/bash

# Whiteout root
count=$(df --sync -P --block-size=1M / | tail -n1  | awk '{ print 1 + $4 }')
dd if=/dev/zero of=/tmp/whitespace bs=1M count=$count || echo "dd exit code $? is suppressed"
rm /tmp/whitespace

sync
