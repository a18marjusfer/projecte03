#!/bin/bash
apt-get update
apt-get install -y apache2
ufw allow in "Apache Full"
apt-get install -y mysql-server
apt-get install -y php libapache2-mod-php php-mysql
systemctl restart apache2
mkdir /usr/share/adminer
wget "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php
ln -s /usr/share/adminer/latest.php /usr/share/adminer/adminer.php
echo "Alias /adminer.php /usr/share/adminer/adminer.php" | tee /etc/apache2/conf-available/adminer.conf
a2enconf adminer.conf
systemctl reload apache2


