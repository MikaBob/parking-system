<?php

namespace ParkingSystem\Controller;

use ParkingSystem\Classes\Response;
use ParkingSystem\Model\FeeDAO;

class FeeController extends BaseController {

    /**
     * GET /fee/byplate/abcd
     */
    public function GETbyplate($params) : string {
        
        $feeDAO = new FeeDAO();
        $result = $feeDAO->getByPlate($params[0]);
        return (new Response(200, [
            $result
        ]))->toJSON();
    }
}