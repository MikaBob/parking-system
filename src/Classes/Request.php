<?php

namespace ParkingSystem\Classes;

class Request {
    private $method;
    private $controller;
    private $action;
    private $params;

    public function __construct($method, $controller, $action, $params){
        if(!$this->checkHttpMethod($method)){
            throw new \Exception('Unhandled HTTP method: '.$method);
        }

        $this->method = $method;
        $this->controller = $controller;
        $this->action = $action;
        $this->params = $params;
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
     * Set the value of method
     */
    public function setMethod($method): self
    {
        $this->method = $method;

        return $this;
    }

    /**
     * Get the value of controller
     */
    public function getController() : string
    {
        return $this->controller;
    }

    /**
     * Set the value of controller
     */
    public function setController($controller): self
    {
        $this->controller = $controller;

        return $this;
    }

    /**
     * Get the value of action
     */
    public function getAction() : string
    {
        return $this->action;
    }

    /**
     * Set the value of action
     */
    public function setAction($action): self
    {
        $this->action = $action;

        return $this;
    }

    /**
     * Get the value of params
     */
    public function getParams() : array
    {
        return $this->params;
    }

    /**
     * Set the value of params
     */
    public function setParams($params): self
    {
        $this->params = $params;

        return $this;
    }
}