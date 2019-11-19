# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/eoan64"

  # Esta la dejo por si nos hace falta, es la de la carpeta compartida
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Customize the amount of memory on the VM:
     vb.memory = "2048"
  end

  # Provisioning
  config.vm.provision "shell", inline: <<-SHELL
    sh script.sh  
  
  SHELL
end
