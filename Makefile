.PHONY: all

all: box/debian-10.box

box/debian-10.box: debian-10.json http/buster-preseed.cfg scripts/*.sh
	-vagrant box remove debian-10
	packer validate $<
	packer build $<
	vagrant box add --name 'debian-10' $@
