<?php

namespace ParkingSystem\Classes;

class Response {
    private $httpCode;
    private $data;

    public function __construct($httpCode, $data){

        $this->httpCode = $httpCode;
        $this->data = $data;
    }

    /**
     * Serialise the response into a JSON string
     * And set HTTP headers
     */
    public function toJSON() : string {
        header("Content-Type: application/json; charset=UTF-8");
        http_response_code($this->httpCode);
        return json_encode($this->data);
    }


    /**
     * Get the value of httpCode
     */
    public function getHttpCode()
    {
        return $this->httpCode;
    }

    /**
     * Set the value of httpCode
     */
    public function setHttpCode($httpCode): self
    {
        $this->httpCode = $httpCode;

        return $this;
    }

    /**
     * Get the value of data
     */
    public function getData() : mixed
    {
        return $this->data;
    }

    /**
     * Set the value of data
     */
    public function setData($data): self
    {
        $this->data = $data;

        return $this;
    }
}