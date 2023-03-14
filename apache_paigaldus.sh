#!/bin/bash
file=/var/www/html/index.html
user=$(whoami)
#kontrollime kas apache on juba olemas
apache2=$(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c 'ok installed')
if [ $apache2 -eq 0 ]
#paigaldab apache
then
	echo "Alustan Apache2 paigaldamist"
	apt install apache2
	echo "Apache on paigaldatud"
elif [ $apache2 -eq 1 ]
#kui apache on paigaldatud
then
	echo "Apache on juba paigaldatud"
	systemctl start apache2
	systemctl status apache2
fi

if [ $apache2 -eq 1 ]
then
	sed -i "s/Apache2 Debian Default Page/$user s Apache2 Debian Page/g" $file
else
	echo "Apache ei paigaldatud õigesti"
fi
done
