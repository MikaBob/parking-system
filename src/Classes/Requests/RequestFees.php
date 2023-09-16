<?php

namespace ParkingSystem\Classes\Requests;

class RequestFees extends Request {
    private string|null  $plate;

    public function __construct(Request $request){
        $requestBody = $request->getBody();
        $requestParams = $request->getParams();
        parent::__construct(
            $request->getMethod(), 
            $request->getController(), 
            $request->getAction(), 
            $requestParams, 
            $requestBody
        );

        $plate = (($requestParams[2] ?? null) === 'plate') ? $requestParams[3] : $requestBody->plate ?? null;

        $this->plate = $plate ? strtoupper($plate) : null;
    } 

    /**
     * Get the value of plate
     */
    public function getPlate() : ?string
    {
        return $this->plate;
    }
}