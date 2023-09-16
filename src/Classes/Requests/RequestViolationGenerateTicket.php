<?php

namespace ParkingSystem\Classes\Requests;

class RequestViolationGenerateTicket extends Request {
    private int|null  $parking_meter_id;
    private string|null  $plate;
    private string|null  $reason;

    public function __construct(Request $request){
        $requestBody = $request->getBody();
        parent::__construct(
            $request->getMethod(), 
            $request->getController(), 
            $request->getAction(), 
            null, 
            $requestBody
        );

        $this->parking_meter_id = $requestBody->parking_meter_id ?? null;
        $this->plate = $requestBody->plate;
        $this->reason = $requestBody->reason;
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
     * Get the value of plate
     */
    public function getPlate() : ?string
    {
        return $this->plate;
    }

    /**
     * Get the value of reason
     *
     * @return string|null
     */
    public function getReason(): string|null
    {
        return $this->reason;
    }
}