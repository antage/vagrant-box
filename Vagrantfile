# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "debian-11"
  config.vm.box_url = "file://#{File.join(Dir.pwd, 'box/debian-11.box')}"
  config.vm.provider :vmware_desktop
end
