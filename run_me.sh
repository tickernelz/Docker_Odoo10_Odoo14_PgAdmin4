#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "$0 is not running as root. Try using sudo."
    exit 2
fi

printf "%b" "\e[1;34m\nInit Docker Swarm\n\n\e[0m"
docker swarm init
sleep 5

printf "%b" "\e[1;34m\n\nCreate Overlay Network\n\n\e[0m"
docker network create -d overlay --subnet 10.0.1.0/24 --gateway 10.0.1.1 --attachable public
sleep 5

printf "%b" "\e[1;34m\n\nSet Folder Permission\n\e[0m"
sudo chmod -R 777 "odoo-10/addons"
sudo chmod -R 777 "odoo-10/etc"
sudo chmod -R 777 "odoo-14/addons"
sudo chmod -R 777 "odoo-14/etc"
sudo chmod -R 777 "postgresql/data-odoo10"
sudo chmod -R 777 "postgresql/data-odoo14"
sleep 5
printf "%b" "\e[1;34mDone..\n\n\e[0m"

printf "%b" "\e[1;34m\n\nDeploy PgAdmin4 & Postgre\n\n\e[0m"
cd "postgresql"
docker-compose up -d
sleep 5

printf "%b" "\e[1;34m\n\nDeploy Odoo 10\n\n\e[0m"
cd "../odoo-10"
docker-compose up -d
sleep 5

printf "%b" "\e[1;34m\n\nDeploy Odoo 14\n\n\e[0m"
cd "../odoo-14"
docker-compose up -d
sleep 5

printf "%b" "\e[1;34mPgAdmin : http://0.0.0.0:5050\n\e[0m"
printf "%b" "\e[1;34mEmail PgAdmin : admin@admin.com\n\e[0m"
printf "%b" "\e[1;34mPassword PgAdmin : admin\n\n\e[0m"
printf "%b" "\e[1;34mPostgre User : odoo\n\e[0m"
printf "%b" "\e[1;34mPostgre Password : odoo\n\n\e[0m"
printf "%b" "\e[1;34mOdoo 10 : http://0.0.0.0:10002\n\e[0m"
printf "%b" "\e[1;34mMaster Password Odoo 10 : 123\n\n\e[0m"
printf "%b" "\e[1;34mOdoo 14 : http://0.0.0.0:14002\n\e[0m"
printf "%b" "\e[1;34mMaster Password Odoo 14 : 123\n\n\e[0m"
