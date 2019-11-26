# Parámetros configurados en el Vagrantfile
-  Selección la box que vamos a utilizar. En este caso Ubuntu Server 19.
    ```sh 
    config.vm.box = "ubuntu/eoan64"
    ```
- Selección del entorno de virtualización.
    ```sh
    config.vm.provider "virtualbox" do |vb|
    ``` 
    Además, dentro de este apartado también podemos configurar parámetros adicionales, tales como la memória maxima:
    
    ```sh 
    vb.memory = "2048"
    ```
    
- Provisionamiento de la máquina.
    En este caso, el provisionaminto se realiza mediante un script.
    ```sh 
    config.vm.provision "shell", path: "lamp.sh"
    ```
  ###### El Vagrantfile final quedaría así:
    > #-*- mode: ruby -*-
    > #vi: set ft=ruby :
    >Vagrant.configure("2") do |config|
    >  config.vm.box = "ubuntu/eoan64"
    >  ##Esta la dejo por si nos hace falta. Es la de la carpeta compartida.
    >  ##config.vm.synced_folder "../data", "/vagrant_data"
    >   config.vm.provider "virtualbox" do |vb|
    >   #Customize the amount of memory on the VM:
    >     vb.memory = "2048"
    >   end
    >  #Aquí es el provisionamiento
    >   config.vm.provision "shell", path: "lamp.sh"
    >end

# Parámetros configurados en el script.
- Primero de todo, hacemos un update de los repositorios.
    ```sh
    apt-get update
    ```
- Lanzamos la instalación de Apache:
    ```sh
    apt-get install -y apache2
    ```
    Además, debemos crear una excepción en el firewall para Apache:
    ```sh
    ufw allow in "Apache Full"
    ```
- Instalamos MySQL:
    ```sh
    apt-get install -y mysql-server
    ```
- Instalamos PHP, además de sus dependencias para Apache y MySQL.
    ```sh
    apt-get install -y php libapache2-mod-php php-mysql
    ```
- Reiniciamos el servicio Apache:
    ```sh
    systemctl restart apache2
    ```
- Instalamos el servicio Adminer:
    ```sh
    wget "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php
    ln -s /usr/share/adminer/latest.php /usr/share/adminer/adminer.php
    echo "Alias /adminer.php /usr/share/adminer/adminer.php" | tee /etc/apache2/conf-available/adminer.conf
    a2enconf adminer.conf
    ```
- Finalmente recargamos el servicio Apache de nuevo.
    ```sh
    systemctl reload apache2
    ```
   
  ###### El script quedaría así:
    >#!/bin/bash
    >apt-get update
    >apt-get install -y apache2
    >ufw allow in "Apache Full"
    >apt-get install -y mysql-server
    >apt-get install -y php libapache2-mod-php php-mysql
    >systemctl restart apache2
    >mkdir /usr/share/adminer
    >wget "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php
    >ln -s /usr/share/adminer/latest.php /usr/share/adminer/adminer.php
    >echo "Alias /adminer.php /usr/share/adminer/adminer.php" | tee /etc/apache2/conf-available/adminer.conf
    >a2enconf adminer.conf
    >systemctl reload apache2
  
