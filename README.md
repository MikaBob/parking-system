# Installation

It starts like any GitHub projects :relaxed:

`git clone git@github.com:MikaBob/parking-system.git`

`cd parking-system`

## Docker
Fetch images, we are using php8, mysql8 and apache2.4

`docker-compose pull`

`docker-compose up -d`

There is the database model and its creation script. For the first installation, run the following command to execute this script

`docker exec -i mysql_8.1 mysql -uroot -proot < ./database/create_db.sql`


# Backlog

- Database
    - [x] ~~Use database model to generate script~~
    - [x] ~~Rename "street" to "parking meter"~~
    - [ ] Create proper indexes for each table
    - [ ] Partition fees & violations

- Backend
    - [ ] Find a PHP framework for API (Routing, Authentication, Serialisation, Test, Auto- [ ]documentation)
    - API
        - Create Routes
            - [ ] GET fee
            - [ ] POST fee
            - [ ] POST violation
        - [ ] Response in json/html
        - [ ] Connect to DB
            - [ ] Fetch data
            - [ ] Insert data and prevent SQL injections
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
    - [ ] Prepare a script to fill database with some content (operators, streets, zones)
    - [ ] Update Readme
    - [ ] Delete everything and test from scratch

- Good to have
    - Add resource for "GET parking meter" to retrieve info for parking meter. QR code / parking meter id
    - Different payment methods
    - GPS coordinates of parking meter
    - Operator upload pictures as proof
    - Cache "GET fee" request but required invalidation upon new fees
    - API versioning
    - Proper violation have extra info like tire position, more info about car (color, model, ...), article of law of violation, points for driving license, etc..