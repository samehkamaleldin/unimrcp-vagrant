#-------------------------------------------------------------------------------
# Project     | unimrcp-vagrant
# Module      | vagrant configuration file
# Author      | sameh kamal
# Description | defining virtual machine configuration and specification
#-------------------------------------------------------------------------------
Vagrant.configure(2) do |config|
  # use ubuntu trust
  config.vm.box = "ubuntu/trusty64"
  # forwarding MRCP & RSTP & SIP ports

  #config.vm.network "forwarded_port", guest: 1544, host: 1544
  #config.vm.network "forwarded_port", guest: 1554, host: 1554
  #config.vm.network "forwarded_port", guest: 8060, host: 8060

  #config.vm.network "private_network",  ip: "172.16.202.192"
  config.vm.network "public_network", ip: "172.16.202.196", bridge: 'enp0s25', auto_config: false
  #config.vm.synced_folder "../data", "/vagrant_data"

  # Customize machine memory
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  # use shell provisioning from external script
  config.vm.provision "shell", path: "./provision/bootstrap.sh"
end
