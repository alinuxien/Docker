# Bienvenue sur mon projet Docker !
Il s'agit d'un projet réalisé en Juillet 2020 dans le cadre de ma formation "Expert DevOps" chez OpenClassRooms.

## Ca fait quoi ?
Ca crée un container Docker sur une base debian, avec un serveur nginx, et accesible en ssh

## Contenu ?
Un simple Dockerfile 

## J'ai besoin de quoi ?
Du [Docker Engine](https://docs.docker.com/engine/install/) installé sur la machine. 
## Comment ça s'utilise ?
En 2 temps, le build et le run ;p Plus sérieusement, dans le dossier qui contient le Dockerfile, il suffit d'exécuter les commandes suivantes.
### Build
docker build -t mon-image --build-arg ROOT_PASS=mon-mot-de-passe .
### Run
docker run -d --restart always -p 32768:22 -p 8000:80 --name mon-container mon-image

## Ca a marché ?
### Déjà, on peut vérifier que le container est en cours d'éxecution
docker ps -a
### Ensuite, on peut vérifier que le serveur web est accessible
[mon nginx containerisé](http://localhost:8000)
### Enfin, on teste la connexion SSH
ssh root@localhost -p 32768

## Ca ressemble à quoi ?
![Aperçu de l'architecture](https://github.com/alinuxien/Docker/raw/master/Aperc%CC%A7u%20Projet%20Docker.png)

# Et après ?
[Pourquoi pas l'utiliser dans une VM ?](https://github.com/alinuxien/Vagrant)

