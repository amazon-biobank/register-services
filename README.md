## USP Register Services

This repository contains the docker-compose file with the submodules needed for running the register services in the CA machine.
It contains the following services:
* **Amazoniaweb**: React web app that enables the user to login and download the credentials
* **Amazoniaweb-api**: The backend that handles user authentication and acts communicates with the hyperledger-register-service
* **Hyperledger-register-service**: This is the point of entrance with the Certificate Authority Network and the API. It should not be exposed from the outside network. Contains useful functions for handling credentials like Register and Revoke (in this case delete).

### Set up

Before running you need to make sure that some config files are setted correctly. Those are:

1. `.env` in the root folder (there is a example.env with the needed information).
2. `hyperledger-register-service/src/local_fabric_connection.json` should be the same as the network that we are gonna use, having at least 1 CA and 1 CA peer.
3. `hyperledger-register-service/src/config.json` should have the CA identification and the correct admin credentials.

You should also make sure of the following:

1. If you want to be able to delete credentials so the user can register again if they are lost you must change the following file in your network `<network>/organizations/fabric-ca/<usedCA>/fabric-ca-server-config.yaml` adding the key `allowremove: true` at `cfg -> identities`.
2. You should enroll the admin to the current network CA with the command `node enrollAdmin.js` in the hyperledger-register-service src  folder. (Remember to do it again if the network changes).

### Running

To run after the setup you can use:

`docker-compose up`

If you made some changes in a service, you need to rebuild and recreate the docker images. To do this:
1. `docker-compose build --no-cache`
2. `docker-compose up --force-recreate`


### FYI

This repository uses git submodules, so when updating each submodules, remember to commit and checkout in each one.
You can use --recurse-submodules when cloning and pulling to update them aswell.