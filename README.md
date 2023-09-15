# Installation

It starts like any GitHub projects :relaxed:

1. `git clone git@github.com:MikaBob/parking-system.git`

2. `cd parking-system`

## Docker
Fetch images, we are using php8, mysql8 and apache2.4

3. `docker-compose pull`

4. `docker-compose up -d --build`

## Database
There is the database model and its creation script. For the first installation, run the following command to execute this script

5. `docker exec -i mysql_8.1 mysql -uroot -proot < ./database/create_db.sql`

Then we add some fixtures

6. `docker exec -i mysql_8.1 mysql -uroot -proot < ./database/fixtures.sql`

## Composer & .env

You know the drill :grin:, copy the .env.local to .env (you do not need to edit the .env for a local execution)

7. `docker exec -i php_8.2 cp .env.local .env`

then a classic composer install

8. `docker exec -i php_8.2 composer install`

# Usage

There is an [export of Postman collection](https://github.com/MikaBob/parking-system/tree/main/parking-system.postman_collection.json)  of every available route and some of their usage.

You just need to add a variable `{{base_url}}` with a value of `http://localhost`

You can read a code explanation in [./src/README.md](https://github.com/MikaBob/parking-system/tree/main/src/README.md)

# Backlog

- Database
    - [x] ~~Use database model to generate script~~
    - [x] ~~Rename "street" to "parking meter"~~
    - [ ] Create proper indexes for each table
    - [ ] Partition fees & violations

- Backend
    - [x] ~~Find a PHP framework for API (Routing, Authentication, Serialisation, Test, Auto-documentation)~~
    - [x] ~~Cry to make docker-container works~~
    - [x] ~~Realise learning a new Framework is too long for the time I have~~
    - API
        - Create Routes
            - [x] ~~GET fee~~
            - [ ] POST fee
            - [ ] POST violation
        - [x] ~~Response in json~~
        - [x] ~~Connect to DB~~
            - [x] ~~Fetch data~~
            - [x] ~~Insert data and prevent SQL injections~~
        - Authentication
            - [ ] JWT & Scope by zone
            - [ ] OAuth2 for operators
            - [ ] Prevent CSRF, spam
    - [ ] Write unit test
    - [ ] Write documentation

- Delivery
    - [ ] Create a Tag for MVP, and more for incremental development
    - [ ] Write SQL queries for reporting
    - [ ] Export Postman queries for each routes
    - [x] Prepare a script to fill database with some content (operators, streets, zones)
    - [ ] Update Readme
    - [ ] Delete everything and test from scratch

- Good to have
    - Add resource for "GET parking meter" to retrieve info for parking meter. QR code / parking meter id
    - Different payment methods
    - GPS coordinates of parking meter
    - Operator upload pictures as proof
    - Cache "GET fee" request but required invalidation upon new fees
    - Cache request to zone's info
    - API versioning
    - Proper violation have extra info like tire position, more info about car (color, model, ...), article of law of violation, points for driving license, etc..
    - Add SSL 
        - private certificate
        - modify apache & php container
        - force use of HTTPS with redirection
    - Docker container custom images with pre-build libraries
    - Pipeline for build, test and deploy to Github pages