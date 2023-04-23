#!/bin/bash
service mariadb start --bind-address=0.0.0.0
mariadb < db_script.sql
tail -500f /dev/null
#--datadir=/var/lib/mysql