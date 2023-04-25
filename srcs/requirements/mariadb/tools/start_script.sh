#!/bin/bash
service mariadb start 

mariadb <<EOF
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
--substituir o mydb pela bd necessária ao wordpress
GRANT ALL PRIVILEGES ON mydb.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF
sleep 1

service mariadb stop

mariadbd-safe --bind-address=0.0.0.0 