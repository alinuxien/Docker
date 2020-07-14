FROM debian:9

LABEL maintainer="ali.akrour@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ARG ROOT_PASS=default

RUN apt-get update \
 && apt-get install -y openssh-server \
 && apt-get install -y nginx \ 
 &&apt-get install -y supervisor \
 && apt-get clean \ 
 && mkdir /run/sshd \ 
 && echo "root:$ROOT_PASS" | chpasswd \ 
 && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

EXPOSE 22 80

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"] 


