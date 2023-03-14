#!/bin/bash
FILE=/var/www/html/wp-config-sample.php
if test -f "$FILE"; then
  echo "WordPress on juba paigaldatud."
else
  echo "WordPressi pole sellel masinal paigaldatud"
#install dependencies
  apt install mariadb-server
  apt install php libapache2-mod-php php-mysql
#andmebaasi tekitamine
  source /home/user/haldusskriptid/andmebaas.sh
  systemctl restart apache2
#WordPressi alla laadimine
  cd /var/www/html
  wget http://wordpress.org/latest.tar.gz
  tar xfz latest.tar.gz 
  mv wordpress/* ./
  rm -f latest.tar.gz
  rm index.html
  cp wp-config-sample.php wp-config.php
  nano wp-config.php
#Andmete vahetamine
  sed -i “/s/'database_name_here'/'wp'/g/” /var/www/html/wp-config.php
  sed -i “/s/'username_here'/'username'/g/” /var/www/html/wp-config.php
  sed -i “/s/'password_here'/'password'/g/” /var/www/html/wp-config.php
  echo "WordPress edukalt paigaldatud"
fi
