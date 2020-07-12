FROM debian:9

LABEL maintainer="ali.akrour@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y openssh-server \
 && apt-get clean \ 
 && mkdir /run/sshd \ 
# dossier /run/sshd au lieu de /var/run/sshd cause debian
# on change le pass root pour l'avoir lors de la connexion ssh
 && echo 'root:alinuxien' | chpasswd \ 
# on autorise la connexion root en ssh
 && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"] 
 
