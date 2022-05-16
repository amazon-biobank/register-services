## USP Register Services

![image](https://user-images.githubusercontent.com/26912764/124205138-fe488280-dab6-11eb-9c97-7d5003050961.png)

This repository contains the docker-compose file with the submodules needed for running the register services in the CA machine.
It contains the following services:
* **Amazoniaweb**: React web app that enables the user to login and download the credentials
* **Amazoniaweb-api**: The backend that handles user authentication and acts communicates with the hyperledger-register-service
* **Hyperledger-register-service**: This is the point of entrance with the Certificate Authority Network and the API. It should not be exposed from the outside network. Contains useful functions for handling credentials like Register and Revoke (in this case delete).

### Set up

Before running you need to make sure that some config files are setted correctly. Those are:

1. `.env` in the root folder (there is a example.env with the needed information).
2. `hyperledger-register-service/src/config.json` should have the CA identification and the correct admin credentials.

You should also make sure of the following:

1. If you want to be able to delete credentials so the user can register again if they are lost you must change the following file in your network `<network>/organizations/fabric-ca/<usedCA>/fabric-ca-server-config.yaml` adding the key `allowremove: true` at `cfg -> identities`.

### Running

Use the script start.sh in order to start the service.

By simply calling `./start.sh` you may start the service. But if you need to recreate a brand new admin.id identity because the Blockchain has been restarted, call it with `./start.sh new-admin`. For help: ``./start.sh help`.


### FYI

This repository uses git submodules, so when updating each submodules, remember to commit and checkout in each one.
You can use --recurse-submodules when cloning and pulling to update them aswell.
