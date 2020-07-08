# OCR-P3
Projet 3 OpenClassRooms : mise en place d'un premier environnement de travail.
Nous utilisons Vagrant pour créer une VM ( j'ai choisi la box hashicorp/bionic64, basée sur une distribution Ubuntu 18.04 LTS 64-bit ), sur laquelle Vagrant installe quelques outils :
   -> vim ( effectivement ça peut servir )
   -> Ansible
   -> Docker

Pour garder de la lisibilité dans le Vagrantfile, les outils sont installés via un script shell ( fichier bootstrap.sh ) qui est lancé par le Vagrantfile.

Par la suite, nous construisons une image Docker ( basée Debian 9 ), avec les ports SSH mappés, un serveur Nginx, et son volume partagé pour stocker les pages.
