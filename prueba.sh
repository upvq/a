sudo apt update
sudo apt upgrade
sudo apt install apache2 -y
sudo apt install mysql-server -y
sudo /usr/bin/mysql_secure_installation
sudo apt install php libapache2-mod-php php-mysql
sudo nano /etc/apache2/mods-enabled/dir.conf
sudo apt-cache search php-
sudo apt-get install <<ModuleName>>

sudo service apache2 restart
