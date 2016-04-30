# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian8"

  config.vm.provision "shell", path: "provision.sh"

  #config.vm.network "private_network", ip: "192.168.50.5"
  config.vm.network :forwarded_port, :host => 4000, :guest => 4000

  #config.vm.synced_folder ".", "/vagrant", type: "nfs"

  #config.vm.provider "virtualbox" do |v|
  #  v.memory = 1024
  #end
end
