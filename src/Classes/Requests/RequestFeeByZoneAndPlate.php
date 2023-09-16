<?php

namespace ParkingSystem\Classes\Requests;

/**
 * Does not bring more info nor logic to the parent class (yet)
 */
class RequestFeeByZoneAndPlate extends RequestFees {
    private string|null $zone;

    public function __construct(Request $request){
        parent::__construct(
            $request
        );

        $requestBody = $request->getBody();
        $requestParams = $request->getParams();

        $zone = (($requestParams[0] ?? null) === 'zone') ? $requestParams[1] : $requestBody->zone ?? null;
        $this->zone = $zone ? strtoupper($zone) : null;
    } 

        /**
     * Get the value of zone
     */
    public function getZone() : ?string
    {
        return $this->zone;
    }
}