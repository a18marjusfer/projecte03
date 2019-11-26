#!/bin/bash
apt-get update
apt-get install -y apache2
ufw allow in "Apache Full"
apt-get install -y mysql-server
apt-get install -y php libapache2-mod-php php-mysql
systemctl restart apache2
