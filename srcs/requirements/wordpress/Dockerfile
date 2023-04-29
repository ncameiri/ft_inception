FROM debian:stable-20230411
RUN apt update
RUN apt install wget -y

#https://make.wordpress.org/hosting/handbook/server-environment/
RUN apt install php php-fpm php-mysqli -y

RUN apt install net-tools -y
RUN wget https://wordpress.org/latest.tar.gz
#RUN wget https://www.php.net/distributions/php-8.2.5.tar.gz
#https://docs.ukfast.co.uk/operatingsystems/linux/php-fpm/phpfpmsetup.html
#RUN tar -xzvf php-8.2.5.tar.gz

RUN tar -xzvf latest.tar.gz

COPY ./tools .
COPY ./conf .
RUN chmod +x start_script.sh

###RUN cp wp-config.php /wordpress

#WORKDIR wordpress

RUN mkdir /run/php

RUN mkdir -p /var/www/wordpress
RUN cp -r /wordpress/* /var/www/wordpress/
RUN chmod -R 777 /var/www/
RUN chown -R www-data:www-data /var/www/

#wordpress
#ENV SERVERNAME="localhost"
#https://www.digitalocean.com/community/tutorials/install-wordpress-on-ubuntu
#para o script de inicio
#RUN /etc/init.d/apache2 stop
#RUN /etc/init.d/apache2 start
EXPOSE 9000
ENTRYPOINT ["bash","-c","/start_script.sh"]
#ENTRYPOINT ["bash","-c","tail -500f /dev/null"]
#https://www.php.net/install
#sudo apt install -y pkg-config build-essential autoconf bison re2c \
#                        libxml2-dev libsqlite3-dev
