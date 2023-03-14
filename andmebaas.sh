#loome_andmebaasi
CREATE DATABASE wp;
#loome_kasutaja
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
#anname_õigused
GRANT ALL PRIVILEGES ON wordpress.* TO 'username'@'localhost';
FLUSH PRIVILEGES;
