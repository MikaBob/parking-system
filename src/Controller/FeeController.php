<?php

namespace ParkingSystem\Controller;

use ParkingSystem\Classes\Response;

class FeeController extends BaseController {

    /**
     * GET /fee/byplate/abcd
     */
    public function GETbyplate($params) : string {
        return (new Response(200, [
            'params' => $params, 
            'dbname' => $_ENV['DB_DATABASE']
        ]))->toJSON();
    }
}