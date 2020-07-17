# Docker

Ce dépot permet la construction d'un conteneur unique Docker, basé sur une Debian 9, avec un serveur SSH et un serveur NGINX opérationnels.

En pré-requis, il faut bien sûr que Docker soit installé sur la machine, ce que vous pouvez vérifier avec la commande :
docker --version

Dans votre dossier de travail, vous pouvez récupérer tous les fichiers de ce dépôt, avec la commande :
git pull https://github.com/alinuxien/Docker.git

Puis on lance la construction de l'image, avec la commande ( pensez à personnaliser le mot de passe de root "mon-mot-de-passe", et vous pouvez aussi changer le nom de l'image qui est ici "mydsn" ) :
docker build -t mydsn --build-arg ROOT_PASS=mon-mot-de-passe .

Enfin, on va lance le container avec la commande ( nom du container "mydsn" personnalisable, ainsi que les ports d'écoute des 2 serveurs sur l'hôte, syntaxe "-p port-hote:port-container" )
docker run -d --restart always -p 32768:22 -p 8000:80 --name mydsn mydsn

On peut vérifier que le container est bien en cours d'exécution avec la commande :
docker ps -a

Pour vous connecter au serveur SSH du container, la commande est ( port à ajuster si personnalisé ) :
ssh root@localhost -p 32768

Pour tester le serveur web NGINX du container, l'adresse est : http://localhost:8000 ( port à ajuster si personnalisé ).
Pour faire ce test sous linux en mode terminal : 
wget -O - http://localhost:8000

Et voilà, that's all folks.

