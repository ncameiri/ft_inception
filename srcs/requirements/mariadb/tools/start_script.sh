#!/bin/bash
service mariadb start 
mariadb < db_script.sql
sleep 1
#PID=$!
#wait $PID
service mariadb stop

mariadbd-safe --bind-address=0.0.0.0 
#tail -500f /dev/null
#--datadir=/var/lib/mysql