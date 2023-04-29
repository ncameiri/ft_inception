FROM debian:stable-20230411
RUN apt update
RUN apt install wget php php-fpm php-mysqli php-common net-tools vim -y

#https://serverfault.com/questions/486368/nginx-and-php-fpm-403-forbidden
#https://make.wordpress.org/hosting/handbook/server-environment/
#https://docs.ukfast.co.uk/operatingsystems/linux/php-fpm/phpfpmsetup.html
#https://www.digitalocean.com/community/tutorials/install-wordpress-on-ubuntu

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz

COPY ./tools .
COPY ./conf .
RUN chmod +x start_script.sh
RUN mkdir /run/php

RUN mkdir -p /var/www/wordpress
RUN cp wp-config.php /var/www/wordpress
RUN cp -r /wordpress/* /var/www/wordpress/

ENTRYPOINT ["bash","-c","/start_script.sh"]
