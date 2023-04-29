FROM debian:stable-20230411

RUN apt update
RUN apt install nginx -y
RUN apt install openssl -y

COPY ./tools .
RUN chmod +x start_script.sh
#https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-22-04
#RUN mkdir /etc/nginx/ssl 
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
   -keyout /etc/ssl/private/nginx-selfsigned.key \
   -out /etc/ssl/certs/nginx-selfsigned.pem \
   -subj "/C=PT/ST=Lisboa/L=Lisboa/O=42Lisboa/OU=ncameiri/CN=ncameiri/"
#RUN rm /etc/nginx/nginx.conf
#COPY ./conf/nginx.conf /etc/nginx
COPY ./conf/default etc/nginx/sites-enabled/default
ENTRYPOINT ["bash","-c","/start_script.sh"]
#ENTRYPOINT ["nginx","-g", "daemon off;"]
