#!/bin/bash
service mariadb start 2>/dev/null

sed -i "s/MYSQL_USER/$MYSQL_USER/g" wp_dump.sql
sed -i "s/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/g" wp_dump.sql
sed -i "s/WP_DBNAME/$WP_DBNAME/g" wp_dump.sql

mariadb <wp_dump.sql 2>/dev/null
echo "DELETE FROM mysql.user WHERE User='root'; FLUSH PRIVILEGES;" | mariadb 2>/dev/null
sleep 2

pkill mariadb
sleep 2
mariadbd-safe --bind-address=0.0.0.0

tail -500f /dev/null
