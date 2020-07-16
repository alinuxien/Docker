FROM debian:9

LABEL maintainer="ali.akrour@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive
ARG ROOT_PASS=default

RUN apt-get update \
 && apt-get install -y openssh-server \
 && apt-get install -y nginx \ 
 && mkdir /run/sshd \ 
 && echo "root:$ROOT_PASS" | chpasswd \ 
 && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

EXPOSE 22 80

CMD /usr/sbin/sshd && /usr/sbin/nginx -g "daemon off;"	 


