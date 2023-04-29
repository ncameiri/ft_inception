#!/bin/bash
service mariadb start 

    sed -i "s/MYSQL_USER/$MYSQL_USER/g" wp_dump.sql
    sed -i "s/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/g" wp_dump.sql
    sed -i "s/WP_DBNAME/$WP_DBNAME/g" wp_dump.sql

SQLQUERY=$(echo "show databases" | mariadb  | grep mydb) 
#SQLQUERY=$(echo "show databases" | mariadb -u$MYSQL_USER -p$MYSQL_ROOT_PASSWORD  | grep mydb) 
if [ -z "$SQLQUERY" ] ; then
    mariadb  < wp_dump.sql
fi
echo "DELETE FROM mysql.user WHERE User='root'; FLUSH PRIVILEGES;" | mariadb
sleep 1

pkill mariadb

mariadbd-safe --bind-address=0.0.0.0 

tail -500f /dev/null