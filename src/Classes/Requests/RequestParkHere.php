<?php

namespace ParkingSystem\Classes\Requests;

class RequestParkHere extends RequestFees {

    private int|null $parking_meter_id;
    private int|null $amount;
    private \DateTime |null $end_validity;

    public function __construct(Request $request){
        parent::__construct(
            $request
        );
        
        $requestBody = $request->getBody();
        $this->parking_meter_id = $requestBody->parking_meter_id ?? null;
        $this->amount = $requestBody->amount ?? null;
        $this->end_validity = ($requestBody->end_validity ?? null) ? new \DateTime($requestBody->end_validity) : null;
    }

    /**
     * Get the value of parking_meter_id
     *
     * @return int|null
     */
    public function getParkingMeterId(): int|null
    {
        return $this->parking_meter_id;
    }

    /**
     * Get the value of amount
     */
    public function getAmount() : ?int
    {
        return $this->amount;
    }

    /**
     * Get the value of end_validity
     */
    public function getEndValidity() : ?\DateTime
    {
        return $this->end_validity;
    }
}