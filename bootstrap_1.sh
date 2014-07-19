#!/usr/bin/env bash

apt-get update
apt-get install -y apache2
apt-get install -y php5
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password madafaka'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password madafaka'
sudo apt-get -y install mysql-server mysql-client
apt-get install -y php5-mysql
rm -rf /var/www
ln -fs /vagrant/public_html /var/www
service apache2 restart
