<?php

namespace ParkingSystem\Tests\Controller;

use PHPUnit\Framework\TestCase;
use ParkingSystem\Classes\Requests\Request;
use ParkingSystem\Classes\ResponseBadRequest;
use ParkingSystem\Controller\FeeController;

class FeeControllerTest extends TestCase {

    protected FeeController $controller;

    public function setUp(): void {
        parent::setUp();
        $this->controller = new FeeController();
    }

    public function testGETbyzoneandplateInvalidZone() {
        $request = new Request(
            'GET', 
            'fee', 
            'byzoneandplate',
            [
                'zone',
                'NOT_A_ZONE',
                'plate',
                'PLATE_Z'
            ],
            []
        );

        $this->checkForResponseBadRequest(json_decode($this->controller->GETbyzoneandplate($request)));
    }

    public function testGETbyzoneandplateInvalidParking() {
        $testData = [
            'zone'=> 'A',
            'plate' => 'TEST_PLATE'.(new \DateTime())->format('c')
        ];

        $request = new Request(
            'GET', 
            'fee', 
            'byzoneandplate',
            [
                'zone',
                $testData['zone'],
                'plate',
                $testData['plate']
            ],
            []
        );

        $response = json_decode($this->controller->GETbyzoneandplate($request));


        $this->assertEquals($response->valid, false);
        $this->assertEquals($response->fine_amount, 2800);
        $this->assertEquals($response->vehicule_plate, $testData['plate']);
        $this->assertEquals($response->zone, $testData['zone']);

        return $testData;
    }

    /**
     * @depends testGETbyzoneandplateInvalidParking
     */
    public function testPOSTparkhere($testData) {
        $parkHereData =             [   
            'plate'=> $testData['plate'],
            'parking_meter_id'=> 1,
            'amount'=> 400,
            'end_validity'=> (new \DateTime())->add(\DateInterval::createFromDateString('1 hour'))->format('c')
        ];

        $request = new Request(
            'POST', 
            'fee', 
            'byzoneandplate',
            [],
            json_decode(json_encode($parkHereData))
        );

        $response = json_decode($this->controller->POSTparkhere($request))[0];

        /** @TODO get fee id and use it to delete this fine during test clean up */
        $this->assertEquals($response->parking_meter->zone->zone_name, $testData['zone']);
        $this->assertEquals($response->parking_meter->zone->daily_fee, 2800);
        $this->assertEquals($response->parking_meter->street_name, 'Cathedral Lane');
        $this->assertEquals($response->vehicule_plate, $testData['plate']);
        $this->assertEquals($response->fee_amount, $parkHereData['amount']);
        $this->assertEquals($response->date_end_validity, $parkHereData['end_validity']);

        return array_merge($testData, ['end_validity' => $parkHereData['end_validity']]); // @TODO create types for test data
    }

    /**
     * @depends testPOSTparkhere
     */
    public function testGETbyzoneandplateValidParking($testData) {
        $request = new Request(
            'GET', 
            'fee', 
            'byzoneandplate',
            [
                'zone',
                $testData['zone'],
                'plate',
                $testData['plate']
            ],
            []
        );

        $response = json_decode($this->controller->GETbyzoneandplate($request));

        $this->assertEquals($response->valid, "true");
        $this->assertEquals($response->valid_until, $testData['end_validity']);
        $this->assertEquals($response->vehicule_plate, $testData['plate']);
        $this->assertEquals($response->zone, $testData['zone']);
    }

    public function testGETbyzoneandplateInvalidParkingAndZone() {
        $testData = [
            'zone'=> 'NOT_A_REAL_ZONE',
            'plate' => 'TEST_PLATE'
        ];

        $request = new Request(
            'GET', 
            'fee', 
            'byzoneandplate',
            [
                'zone',
                $testData['zone'],
                'plate',
                $testData['plate']
            ],
            []
        );

        $this->checkForResponseBadRequest(json_decode($this->controller->GETbyzoneandplate($request)));
    }

    public function testPOSTparkhereInvalid() {
        $request = new Request(
            'POST', 
            'fee', 
            'byzoneandplate',
            [],
            []
        );

        $this->checkForResponseBadRequest(json_decode($this->controller->GETbyzoneandplate($request)));
    }

    public function testPOSTparkhereInvalidParkingMeterId() {
        $request = new Request(
            'POST', 
            'fee', 
            'byzoneandplate',
            [],
            [   
                'plate'=> 'TEST_PLATE',
                'parking_meter_id'=> -42,
                'amount'=> 400,
                'end_validity'=> (new \DateTime())->add(\DateInterval::createFromDateString('1 hour'))->format('c')
            ]
        );

        $this->checkForResponseBadRequest(json_decode($this->controller->GETbyzoneandplate($request)));
    }

    private function checkForResponseBadRequest(string $response){
        $this->assertEquals($response, (new ResponseBadRequest())->getData());
    }
}