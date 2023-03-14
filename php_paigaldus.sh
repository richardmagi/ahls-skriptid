#!/bin/bash
file=/var/www/html/index.html
user=$(whoami)
#Kontrollib PHP eksisteerimist
php=$(dpkg-query -W -f='${Status}' php 2>/dev/null | grep -c 'ok installed')
if [ $php -eq 0 ]
then
#Paigaldab PHP
	echo "Alustan php paigaldamist"
	apt install php7.0 libapache2-mod-php7.0 php7.0-mysql
	echo "PHP paigaldatud"
elif [ $php -eq 1 ]
#Kui PHP on juba paigaldatud.
then
	echo "PHP on juba paigaldatud"
	systemctl start php
	systemctl status php
fi

if [ $php -eq 1 ]
then
sed -i "s/Php Debian Default Page/$user s php Debian Page/g" $file
else
echo "PHP paigaldamine ei õnnestunud"
fi
