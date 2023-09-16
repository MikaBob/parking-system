<?php

namespace ParkingSystem;

use ParkingSystem\Classes\Requests\Request;

class Router {

    /**
     * Entry point to every request
     * 
     * Parse a request and forward it the to a controller
     * Also handle exception & 404 responses
     */
    public static function handleRequest() : void {
        try {
            $request = self::parseRequest();
            if (!empty($request)) {

                $fullQualifiedClassName = self::getControllerFullQualifiedName($request->getController());

                // class_exists()  will call the autoloader if class not already loaded.
                if (class_exists($fullQualifiedClassName, true)) {
                    if (method_exists($fullQualifiedClassName, $request->getAction())) {
                        
                        $controller = new $fullQualifiedClassName();
                        echo call_user_func([$controller, $request->getAction()], $request);
                        return;
                    } 
                }
            }
        } catch(\Exception $e) {
            http_response_code(500);
            echo $e->getMessage();
            return;
        }
        http_response_code(404);
        echo '404: Page not found';
    }

    /**
     * parse a GET "http://localhost/fee/byplate/a/b/c/42" request to
     * 
     * Controler => Fee
     * Action => GETbyplate
     * Params => ["a","b","c","42"]
     * 
     * See src/Classes/Request.php
     */
    private static function parseRequest() : Request {
        $path = explode('/', filter_input(INPUT_SERVER, 'REQUEST_URI', FILTER_SANITIZE_SPECIAL_CHARS));
        $params = [];

        // If there are params in the url, after the action
        if (count($path) > 3) {
            // starting from 3 to skip Controller name and Action name
            for ($i = 3; $i < count($path); $i++) {
                if($path[$i] !== ""){
                    $params[] = $path[$i];
                }
            }
        }

        $httpMethod = filter_input( \INPUT_SERVER, 'REQUEST_METHOD', \FILTER_SANITIZE_SPECIAL_CHARS);
        
        $controller = empty($path[1]) ? '' : ucfirst($path[1]);
        $action = empty($path[2]) ? '' : $httpMethod.$path[2];
        $params = $params;
        $body = json_decode(file_get_contents('php://input'));

        return new Request($httpMethod, $controller, $action, $params, $body);
    }

    /**
     * Retrieve the full path to the controller base on the name only
     * Note: it is code injection proof
     */
    private static function getControllerFullQualifiedName($controllerName) {
        return "ParkingSystem\\Controller\\{$controllerName}Controller";
    }
}
