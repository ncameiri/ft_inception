CREATE USER 'root'@'%' IDENTIFIED BY 'password';
--substituir o mydb pela bd necessária ao wordpress
GRANT ALL PRIVILEGES ON mydb.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
