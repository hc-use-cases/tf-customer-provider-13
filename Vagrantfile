# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "apopa/xenial64"
  config.vm.network "public_network", ip: "192.168.178.65"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
    vb.cpus = "2"
  end
end
