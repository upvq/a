#!/bin/bash
sudo apt update; sudo apt upgrade

sudo apt install -y apache2 apache2-utils

sudo chown www-data:www-data /var/www/html/ -R

sudo apt install mariadb-server mariadb-client

sudo mysql_secure_installation

sudo apt install php7.4 libapache2-mod-php7.4 php7.4-mysql php-common php7.4-cli php7.4-common php7.4-json php7.4-opcache php7.4-readline

sudo a2enmod php7.4

sudo systemctl restart apache2