#!/bin/bash
sudo apt update; sudo apt upgrade

sudo apt install -y apache2 apache2-utils

sudo chown www-data:www-data /var/www/html/ -R

sudo apt install mariadb-server mariadb-client

sudo mysql_secure_installation

sudo apt install php7.4 libapache2-mod-php7.4 php7.4-mysql php-common php7.4-cli php7.4-common php7.4-json php7.4-opcache php7.4-readline

sudo a2enmod php7.4

sudo systemctl restart apache2

cd /var/www

mkdir dominio1 & cd dominio1 & mkdir index.html & cd ../

mkdir dominio2 & cd dominio2 & mkdir index.html & cd ../

cd /etc/apache2/sites-available/ 

exec 3<> dominio1

    # Let's print some text to fd 3
    echo "#web de dominio1" >&3
    echo "<VirtualHost *:80" >&3
    echo "ServerName 192.168.115.11" >&3
    echo "ServerAlias dominio1.com" >&3
    echo "DocumentRoot /var/www/dominio1" >&3
    echo "DirectoryIndex index.html" >&3
    echo "ServerAdmin contacto@dominio1.com
    echo "</VirtualHost>" >&3

# Close fd 3
exec 3>&-

exec 3<> dominio2

    # Let's print some text to fd 3
    echo "#web de dominio2" >&3
    echo "<VirtualHost *:80" >&3
    echo "ServerName 192.168.115.11" >&3
    echo "ServerAlias dominio2.com" >&3
    echo "DocumentRoot /var/www/dominio2" >&3
    echo "DirectoryIndex index.html" >&3
    echo "ServerAdmin contacto@dominio1.com
    echo "</VirtualHost>" >&3

# Close fd 3
exec 3>&-

a2ensite dominio1

a2ensite dominio2

/etc/init.d/apache2 restart

cd /
cd /etc

exec 3<> hosts

    # Let's print some text to fd 3
    echo "dominio1.com 192.168.15.11" >&3
    echo "dominio2.com 192.168.15.11" >&3

# Close fd 3
exec 3>&-
