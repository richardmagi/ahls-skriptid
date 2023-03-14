#Kontrollib kas MySQL eksisteerib
MYSQL=$(dpkg-query -W -f='${Status)' mysql-server 2>/dev/null | grep -c 'ok installed')
if [ $MYSQL -eq 0 ];
#Kui ei eksisteeri, paigaldab
  then
  echo "Paigaldab MySQLi koos lisadega"
  apt install mysql-server
  echo "Mysql on paigaldatud"
  touch $HOME/.my.cnf
  echo "[client]" >> $HOME/.my.cnf
  echo "host=localhost" >> $HOME/.my.cnf
  echo "user = root" >> $HOME/.my.cnf echo "password = qwerty" >> $HOME/.my.cnf
elif [ $MYSQL -eq 1 ];
#MySql on paigaldatud.
  then
  echo "MySQL oli juba varem paigaldatud"
  mysql
fi
