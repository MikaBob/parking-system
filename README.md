# Installation

## Docker
Fetch images, we are using php8, mysql8 and apache2.4

`docker-compose pull`

`docker-compose up -d`

There is the database model and its creation script. For the first installation, run the following command to execute this script

`docker exec -i mysql_8.1 mysql -uroot -proot < ./database/create_db.sql`