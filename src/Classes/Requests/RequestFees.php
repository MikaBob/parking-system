<?php

namespace ParkingSystem\Classes\Requests;

class RequestFees extends Request {
    private string|null $zone;
    private string|null  $plate;

    public function __construct(Request $request){
        $requestBody = $request->getBody();
        $requestParams = $request->getParams();
        parent::__construct(
            $request->getMethod(), 
            $request->getController(), 
            $request->getAction(), 
            $request->getParams(), 
            $requestBody
        );

        $zone = (($requestParams[0] ?? null) === 'zone') ? $requestParams[1] : $requestBody->zone ?? null;
        $plate = (($requestParams[2] ?? null) === 'plate') ? $requestParams[3] : $requestBody->plate ?? null;

        $this->zone = $zone ? strtoupper($zone) : null;
        $this->plate = $plate ? strtoupper($plate) : null;
    } 

    /**
     * Get the value of zone
     */
    public function getZone() : ?string
    {
        return $this->zone;
    }

    /**
     * Get the value of plate
     */
    public function getPlate() : ?string
    {
        return $this->plate;
    }
}