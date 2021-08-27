.PHONY: all

all: box/debian-11.box

box/debian-11.box: debian-11.json http/bullseye-preseed.cfg scripts/*.sh
	-vagrant box remove debian-11
	packer validate $<
	packer build $<
	vagrant box add --name 'debian-11' $@
