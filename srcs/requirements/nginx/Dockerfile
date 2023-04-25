FROM debian:stable-20230411

RUN apt update
RUN apt install nginx -y

ENTRYPOINT ["nginx","-g", "daemon off;"]