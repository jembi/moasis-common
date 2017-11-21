# Setup instructions for Resource Mapper mySQL test database

Start up the resource mapper docker container.

Copy *test-data-setup.sql* into the docker container:
```bash
docker cp test-data-setup.sql docker-container-name:/test-data-setup.sql
```

Then open up a bash terminal into *resource_mapper_db_1*:

```bash
docker exec -it resourcemap_db_1 bash
```

Import the mySQL database:
```bash
mysql resource_map_development < test-data-setup.sql
```

Login to [Resource Mapper Console](http://localhost:3000/en):
- username: **test@resource.org**
- password: **test**

Two test collections have been created:
+ Jembi
+ West African Facilities

Each collection contains multiple facilities (sites)