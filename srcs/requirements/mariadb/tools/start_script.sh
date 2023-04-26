#!/bin/bash
service mariadb start 

sed -i "s/MYSQL_USER/$MYSQL_USER/g" wp_dump.sql
sed -i "s/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/g" wp_dump.sql
sed -i "s/WP_DBNAME/$WP_DBNAME/g" wp_dump.sql
#sed -i 's/$MYSQL_USER/$MYSQL_USER/g' wp_dump.sql
mariadb < wp_dump.sql

sleep 1

service mariadb stop

mariadbd-safe --bind-address=0.0.0.0 