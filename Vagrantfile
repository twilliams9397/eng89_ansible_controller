
# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what

# MULTI SERVER/VMs environment 
#
Vagrant.configure("2") do |config|

# creating first VM called web  
  config.vm.define "web" do |web|
    
    web.vm.box = "bento/ubuntu-18.04"
   # downloading ubuntu 18.04 image

    web.vm.hostname = 'web'
    # assigning host name to the VM
    
    web.vm.network :private_network, ip: "192.168.33.10"
    #   assigning private IP
    
    web.hostsupdater.aliases = ["development.web"]
    # creating a link called development.web so we can access web page with this link instread of an IP   
    
    web.vm.synced_folder "/Users/Tom1/Documents/Sparta/Vagrant/Dev_Env/eng89_dev_env/app", "/home/vagrant/app"
    
    web.vm.provision "shell", path: "./update_provision.sh"

  end

# creating second VM called db
  config.vm.define "db" do |db|
    
    db.vm.box = "bento/ubuntu-18.04"
    
    db.vm.hostname = 'db'
    
    db.vm.network :private_network, ip: "192.168.33.11"
    
    db.hostsupdater.aliases = ["development.db"]

    db.vm.provision "shell", path: "./update_provision.sh"

  end

 # creating are Ansible controller
  config.vm.define "controller" do |controller|
    
    controller.vm.box = "bento/ubuntu-18.04"
    
    controller.vm.hostname = 'controller'
    
    controller.vm.network :private_network, ip: "192.168.33.12"
    
    controller.hostsupdater.aliases = ["development.controller"]
  # just syncs folder so yml is accessible
    controller.vm.synced_folder "/Users/Tom1/Documents/Sparta/Ansible/eng89_ansible_controller", "/etc/ansible"
    
    controller.vm.provision "shell", path: "./provision.sh"

  end

end