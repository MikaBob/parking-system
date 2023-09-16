<?php

namespace ParkingSystem\Classes\Requests;

class Request {
    
    private string $method;
    private string $controller;
    private string $action;
    private array|null  $params;
    private mixed  $body;

    public function __construct($method, $controller, $action, $params, $body){
        if(!$this->checkHttpMethod($method)){
            throw new \Exception('Unhandled HTTP method: '.$method);
        }

        $this->method = $method;
        $this->controller = $controller;
        $this->action = $action;
        $this->params = $params;
        $this->body = $body;
    } 

    private function checkHttpMethod($httpMethod) : bool {
        if(!in_array($httpMethod, [
            'GET', 
            'POST'
        ])) {
            return false;
        }
        return true;
    }

    /**
     * Get the value of method
     */
    public function getMethod() : string
    {
        return $this->method;
    }


    /**
     * Get the value of controller
     */
    public function getController() : string
    {
        return $this->controller;
    }


    /**
     * Get the value of action
     */
    public function getAction() : string
    {
        return $this->action;
    }


    /**
     * Get the value of params
     */
    public function getParams() : ?array
    {
        return $this->params;
    }

    /**
     * Get the value of body
     */
    public function getBody() : mixed
    {
        return $this->body;
    }
}