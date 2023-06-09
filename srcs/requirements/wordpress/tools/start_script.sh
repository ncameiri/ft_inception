echo "###########################"
echo "STARTED WORDPRESS CONTAINER"
echo "###########################"
sleep 2
sed -i "s/WP_DBNAME/$WP_DBNAME/g" /var/www/wordpress/wp-config.php
sleep 1
sed -i "s/MYSQL_USER/$MYSQL_USER/g" /var/www/wordpress/wp-config.php
sleep 1
sed -i "s/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/g" /var/www/wordpress/wp-config.php
sleep 2

chmod -R 775 /var/www/
chown -R www-data:www-data /var/www/
#Remove Original config and change for updated
mkdir -p /run/php
touch /run/php/php7.4-fpm.pid
rm /etc/php/7.4/fpm/pool.d/www.conf

cp /www.conf /etc/php/7.4/fpm/pool.d
php-fpm7.4 -F -R
#tail -500f /dev/null