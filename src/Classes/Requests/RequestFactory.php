<?php

namespace ParkingSystem\Classes\Requests;

class RequestFactory {
    public static function build(string $requestType, Request $request)
    {
        if(class_exists($requestType))
        {
            return new $requestType($request);
        }
        else {
            throw new \Exception("Invalid product type given.");
        }
    }
}