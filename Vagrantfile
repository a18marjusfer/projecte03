# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/eoan64"

  ## Esta la dejo por si nos hace falta. Es la de la carpeta compartida.
  ## config.vm.synced_folder "../data", "/vagrant_data"

   config.vm.provider "virtualbox" do |vb|
   # Customize the amount of memory on the VM:
     vb.memory = "2048"
   end

  #Aquí es el provisionamiento
   config.vm.provision "shell", path: "lamp.sh",
     run: "always"
end
