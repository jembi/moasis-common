
Save and import image
---------------------------------------

docker save <image-name> > mshr_mysql.tar

docker network ls // list networks
docker network rm <networkID> // remove a network
docker network create <network-name> // create a new network

docker load < mshr_dhis.tar



SISMA
---------------------------------------

docker network create sisma

# SISMA - Postgres
docker run -d \
-p "5432:5432" \
-v "/sisma_data/postgres:/var/lib/postgresql/data" \
-v "/sisma_data/uploads:/src/sisroh-to-sisma-interop/uploads" \
--restart "unless-stopped" \
--network "sisma" \
--name "sisma-postgres" \
postgres:9.6.2

# DHIS2
docker run -d \
-e "JAVA_OPTS=-Xmx4000m -Xms1024m" -e "POSTGRES_DB=dhis2" \
--restart "unless-stopped" \
--network "sisma" \
--name "sisma-dhis" \
sisma_dhis:latest

# Import service
docker run -d \
-p "3500:3500" \
-v "/sisma_data/uploads:/src/sisroh-to-sisma-interop/uploads" \
--restart "unless-stopped" \
--network "sisma" \
--name "sisma-importer-service" \
docker_import:latest

# Nginx
NB! scp the nginx conf file to the server before deploying the container
scp nginx/nginx.conf <username>@<serverIP>:/home/<username>/nginx.conf
sudo mv ~/nginx.conf /opt/nginx

docker run -d \
-p "8080:8080" \
-v /opt/nginx/nginx.conf:/etc/nginx/nginx.conf \
--restart "unless-stopped" \
--network "sisma" \
--name "sisma-nginx" \
nginx:latest




AD-HOC
-------------------------
// create DB with extra DB settings
create database sisma ENCODING 'UTF8' template template0 lc_collate 'C.UTF-8' lc_ctype 'C.UTF-8';

// restore the backup file
psql -U postgres sisma < dhis2_db_20170413.bak

// create postgres user
createuser -SDRP dhis // outside postgres
create user dhis // inside postgres

// grant superuser priveledges
ALTER USER myuser WITH SUPERUSER;

Change Table Ownership
##############################################

Tables
---------
SELECT 'ALTER TABLE '|| schemaname || '.' || tablename ||' OWNER TO dhis;'  FROM pg_tables  WHERE NOT schemaname IN ('pg_catalog', 'information_schema') ORDER BY schemaname, tablename;

Sequences
---------
SELECT 'ALTER SEQUENCE '|| sequence_schema || '.' || sequence_name ||' OWNER TO dhis;'
FROM information_schema.sequences WHERE NOT sequence_schema IN ('pg_catalog', 'information_schema')
ORDER BY sequence_schema, sequence_name;

Views
---------
SELECT 'ALTER VIEW '|| table_schema || '.' || table_name ||' OWNER TO dhis;'
FROM information_schema.views WHERE NOT table_schema IN ('pg_catalog', 'information_schema')
ORDER BY table_schema, table_name;

Materialized Views
------------------
SELECT 'ALTER TABLE '|| oid::regclass::text ||' OWNER TO dhis;'
FROM pg_class WHERE relkind = 'm'
ORDER BY oid;