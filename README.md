# Installation

It starts like any GitHub projects :relaxed:

1. `git clone git@github.com:MikaBob/parking-system.git`

2. `cd parking-system`

And then everything will be set up for a local environment with Docker

3. `docker-compose up -d --build`

The rest is a typicall copying the .env file (prefilled for local values) and installing libraries

4. `cp ./src/.env.local ./src/.env`

5. `docker exec -i php_8.2 composer install`

# Usage

There is an [export of Postman collection](https://github.com/MikaBob/parking-system/tree/main/parking-system.postman_collection.json)  of every available route and some of their usage.


## POST /fee/parkhere

As a driver, you can create a new parking ticket. Request body:

```JSON
{
    "plate": "PLATE_Z",
    "parking_meter_id": 1,
    "amount": 400,
    "end_validity": "{{current_timestamp_plus_1hour}}"
}
```

## GET /fee/byzoneandplate/zone/A/plate/plate_z (Scan valid parking)

As an operator you can check if the car's plate is in the system. Either with extra parameters in the URL, or in the request's body:

```JSON
{
    "zone": "A",
    "plate": "PLATE_A"
}
```

## GET /fee/byzoneandplate/zone/b/plate/plate_a (Scan invalid parking)

Later, the operator can scan the plate again when the ticket's validity will be invalid. Same as the previous call, but this time there is no valid ticket for this plate number, the answer will be different

```JSON
{
    "zone": "B",
    "plate": "PLATE_A"
}
```

## POST /violation/generateTicket

When an operator wants to print a violation ticket, the device will call "POST Generate ticket" and will reply with the ticket confirmation and print the ticket.

```JSON
{
    "parking_meter_id": 2,
    "plate": "PLATE_Y",
    "reason": "You were parked without valid ticket for more than 1h"
}
```

You can read a code explanation in [./src/README.md](https://github.com/MikaBob/parking-system/tree/main/src/README.md)

## Tests

Running `docker exec -i php_8.2 composer test` will execute the *some* unit tests. So far there are two tests only, one for the Router, and one Controller.

# Backlog

- Database
    - [x] ~~Use database model to generate script~~
    - [x] ~~Rename "street" to "parking meter"~~
    - [x] ~~Create proper indexes for each table~~
    - [x] ~~Partition fees & violations~~

- Backend
    - [x] ~~Find a PHP framework for API (Routing, Authentication, Serialisation, Test, Auto-documentation)~~
    - [x] ~~Cry to make docker-container works~~
    - [x] ~~Realise learning a new Framework is too long for the time I have~~
    - API
        - ~~Create Routes~~
            - [x] ~~GET fee~~
            - [x] ~~POST fee~~
            - [x] ~~POST violation~~
        - [x] ~~Response in json~~
        - [x] ~~Connect to DB~~
            - [x] ~~Fetch data~~
            - [x] ~~Insert data and prevent SQL injections~~
        - Authentication
            - [ ] JWT & Scope by zone
            - [ ] OAuth2 for operators
            - [ ] Prevent CSRF, spam
    - [x] ~~Write unit test~~
    - [x] ~~Write documentation~~

- Delivery
    - [x] ~~Create a Tag for MVP~~, and more for incremental development
    - [x] ~~Write SQL queries for reporting~~
    - [x] ~~Export Postman queries for each routes~~
    - [x] ~~Prepare a script to fill database with some content (operators, streets, zones)~~
    - [x] ~~Update Readme~~
    - [x] ~~Delete everything and test from scratch~~

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