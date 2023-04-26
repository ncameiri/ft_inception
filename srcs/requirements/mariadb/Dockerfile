FROM debian:stable-20230411
RUN apt update
RUN apt install mariadb-server -y
COPY ./tools .
COPY ./conf .

RUN chmod +x start_script.sh
#RUN chmod -R 755 /run/mysqld/
#ENTRYPOINT ["bash","-c","tail -500f /dev/null"]
ENTRYPOINT ["bash","-c","/start_script.sh"]
