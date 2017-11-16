# Prototype for MFL and Interoperability

This document describes the requirement allowing to easily run dhis2, Resouce Map and Openhim using docker containers.

## Prerequisites

* (Install Docker)[http://docs.docker.com/engine/installation/]

## How to have dhis2 running in one command?

Start a terminal and execute docker-compose with the default config, Sierra Leone dataset, or use docker-compose-empty-db.yml if you want to start with a clean state.

`docker-compose up`

or

`docker-compose -f docker-compose-sierra-leone.yml up`

Once the container is up, open url http://127.0.0.1:8085 and connect using usernmame `admin` and password `district` as explained in the dhis2 documentation.

## Application logs

To access application logs run `docker-compose logs -f`