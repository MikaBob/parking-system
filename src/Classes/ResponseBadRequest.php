<?php

namespace ParkingSystem\Classes;

class ResponseBadRequest extends Response {
    public function __construct(){
        parent::__construct(404, '400: Bad Request');
    }
}