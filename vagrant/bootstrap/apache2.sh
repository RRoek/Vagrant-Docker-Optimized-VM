#!/bin/bash

a2enmod expires;

#Delete default scotchbox sites
rm /etc/apache2/sites-enabled/000-default.conf;
rm /etc/apache2/sites-enabled/scotchbox.local.conf;

#Enable external connections to mysql
sed -i '/bind-address/s/^/#/g' /etc/mysql/my.cnf;
sudo service mysql restart

# PHPMYADMIN

DBPASSWD="root"

echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
echo "phpmyadmin phpmyadmin/app-password-confirm password $DBPASSWD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/admin-pass password $DBPASSWD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/mysql/app-pass password $DBPASSWD" | debconf-set-selections
echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none" | debconf-set-selections


apt-get -y install phpmyadmin;
a2ensite pma.vagrant.dev.conf;

service apache2 restart;