#apache paigaldus skript
#!bin/bash

#skripti algus
sudo apt update
sleep 10
sudo apt upgrade

apache2=$(dpkg-query -W -f='$(Status)' apache 2 2>/dev/null | grep -c "ok installed")
if [ $apache2 -eq 0 ]; then
        echo "Paigaldame apach2"
        sudo apt install apache2
        echo "Apache on paigaldatud"
	systemctl status apache2
#kui Apache2 muutuja väärtus võrdub ühega
elif [ $apache2 -eq 1 ]; then
        echo "apache2 on juba paigaldatud"
        #stardime selle ja näitame staatust
        systemctl start apache2
        systemctl status apache2
fi
#skripti lõpp
