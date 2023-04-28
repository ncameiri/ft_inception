echo "###########################"
echo "STARTED WORDPRESS CONTAINER"
echo "###########################"
cp -r /wordpress/* /var/www/wordpress/
sed -i "s/WP_DBNAME/$WP_DBNAME/g" /var/www/wordpress/wp-config.php
sed -i "s/MYSQL_USER/$MYSQL_USER/g" /var/www/wordpress/wp-config.php
sed -i "s/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/g" /var/www/wordpress/wp-config.php


chown -R nginx:nginx /var/www/*
chown -R 755 /var/www/*
#Remove Original config and change for updated
rm /etc/php/7.4/fpm/pool.d/www.conf
cp /www.conf /etc/php/7.4/fpm/pool.d/
php-fpm7.4 -F -R
tail -500f /dev/null