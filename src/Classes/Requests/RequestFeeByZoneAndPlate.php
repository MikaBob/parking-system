<?php

namespace ParkingSystem\Classes\Requests;

/**
 * Does not bring more info nor logic to the parent class (yet)
 */
class RequestFeeByZoneAndPlate extends RequestFees {

    public function __construct(Request $request){
        parent::__construct(
            $request
        );
    } 
}