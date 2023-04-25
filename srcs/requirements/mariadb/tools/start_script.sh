#!/bin/bash
service mariadb start 

mariadb <<EOF
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
--substituir o mydb pela bd necessária ao wordpress
CREATE DATABASE IF NOT EXISTS $WP_DBNAME;
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

sleep 1

service mariadb stop

mariadbd-safe --bind-address=0.0.0.0 