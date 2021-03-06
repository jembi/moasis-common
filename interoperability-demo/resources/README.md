# Setup instructions for Resource Mapper mySQL test database

Start up the resource mapper docker container.

Then open up mysql terminal into *resource_map_db_1*:
```bash
docker exec -it resourcemap_db_1 mysql resource_map_development
```

Add test user to database:

```sql
insert into users (email, encrypted_password, confirmed_at)
values ('test@resource.org', '$2a$10$JuJht2h/VAGQVa6CJ6Li5uMuj7JgkJksTfFpcd4XlFPsjy10QAOEi', '2017-11-20 13:08:19');
```

Exit out of docker container: (ctrl + 'd')

In your browser login to [Resource Mapper Console](http://localhost:3000/en):
- username: **test@resource.org**
- password: **test**

Create a site collection by clicking 'Create Collection' icon in bottom left corner of the map.

Give it a name and click 'save'.

*The following commands assume you only have one collection and that you have only ever created one collection. __If you have created collections previously__ you will have to change the collections id in the url in the curl script to that of the desired collection.*

Back in the terminal create test sites:
```bash
curl 'http://localhost:3000/api/collections/1/sites.json' \
-X POST \
-H 'Authorization: Basic dGVzdEByZXNvdXJjZS5vcmc6dGVzdA==' \
-H 'Content-Type: application/json' \
-d '{"site": "{\"name\":\"Mozambique1\", \"lat\":-12.840345,\"lng\":35.396875}"}'

curl 'http://localhost:3000/api/collections/1/sites.json' \
-X POST \
-H 'Authorization: Basic dGVzdEByZXNvdXJjZS5vcmc6dGVzdA==' \
-H 'Content-Type: application/json' \
-d '{"site": "{\"name\":\"Mozambique2\", \"lat\":-21.538654,\"lng\":33.291775}"}'
```

# Setup test configurations and metadata

## Import DHIS2 metadata

Use the DHIS2 metadata file to import test org units and data elements: `demo-metadata.xml.zip`

## Import OpenHIM channels

Use the Openhim import interface to import the channel config: `openhim-insert.json`