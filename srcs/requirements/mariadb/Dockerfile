FROM debian:stable-20230411
RUN apt update
RUN apt install mariadb-server -y
COPY ./tools .
COPY ./conf .

RUN chmod +x start_script.sh

EXPOSE 3306
ENTRYPOINT ["bash","-c","/start_script.sh"]
