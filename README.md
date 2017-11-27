# moasis-common
Repo for common infrastructure files for mOASIS projects

## Prototype for MFL and Interoperability

This document describes the requirement allowing to easily run dhis2, Resouce Map and Openhim using docker containers.

### Prerequisites

* [Install Docker](http://docs.docker.com/engine/installation/)

### How to have dhis2, OpenHIM and the prototype mediator running in one command?

Start a terminal and execute docker-compose with the default config, an empty db, or use docker-compose.sierra-leone.yml if you want to start with test data for DHIS2 from Sierra Leone.

`docker-compose up`

or

`docker-compose -f docker-compose.yml -f docker-compose.sierraleone.yml up`

Once the container is up, you can access the following in any browser:

* DHIS2: http://127.0.0.1:8085 - connect using username `admin` and password `district` as explained in the dhis2 documentation.
* Openhim: http://127.0.0.1:9090 - connect using username `root@openhim.org` and password `openhim-password` as explained in the Openhim documentation.
* Prototype Mediator: http://127.0.0.1:3000

### How to rebuild mediator image with updated changes?

Execute `docker-compose up --build` to rebuild any images with changes.

### How to have ResourceMap running?

You need to clone the [ResouceMap](https://github.com/instedd/resourcemap) repository and follow the docker-compose instructions in the README there.

### How to configure mailing in ResourceMap

Once the ResouceMap container is up, you need to setup the email service with valid email account settings: `config/environments/development.rb`

#### Note about Postgres and DHIS

The DHIS2 image does not allow us to specifiy the database image name via environment variables which means that we are forced to use the same `database` container name for each of our configurations. I'd suggest deleting any existing 'database' containers before running `docker-compose up` to ensure the database intialises properly.

### Application logs

To access application logs run `docker-compose logs -f`