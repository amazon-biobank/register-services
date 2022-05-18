#!/bin/bash

start() {
    docker-compose build --no-cache
    docker-compose up --force-recreate
}

# Função para tratar reset de admin
newAdmin() {
    adminFile="./hyperledger-register-service/wallet/admin.id"
    if test -f "$adminFile";
    then
        echo "Removing admin.id from the wallet"
        rm $adminFile
    else
        echo "admin.id not found. Proceeding to start."
    fi

    start
}

# Função para imprimir o manual de uso deste script
help() {
    echo " ==== Amazonia Web Starter Manual ==== "
    echo ""
    echo "  ./start.sh: Just start the containers with their last configuration;"
    echo "  ./start.sh new-admin: Removes Admin.id from the wallet. Use if the blockchain has been reseted."
    echo ""
    echo " ==== Amazonia Web Starter Manual ==== "
}

# Caso para reset de admin
if [ "$#" == 1 ]
then
    if [[ $1 == "new-admin" ]]; then newAdmin
    elif [[ $1 == "help" ]]; then help
    else
        echo "Unknown command"
    fi
else [ "$#" == 0 ]
    echo "Just start"
    start
fi
