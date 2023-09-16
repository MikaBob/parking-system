<?php

namespace ParkingSystem\Controller;

use ParkingSystem\Classes\Requests\Request;
use ParkingSystem\Classes\Requests\RequestFactory;
use ParkingSystem\Classes\Requests\RequestFeeByZoneAndPlate;
use ParkingSystem\Classes\Requests\RequestParkHere;
use ParkingSystem\Classes\Response;
use ParkingSystem\Model\Entity\FeeEntity;
use ParkingSystem\Model\Entity\ZoneEntity;
use ParkingSystem\Model\FeeRepository;

class FeeController extends BaseController {

    /**
     * GET /fee/byzoneandplate/zone/B/plate/plate_A
     */
    public function GETbyzoneandplate(Request $request) : string {
        $request = RequestFactory::build(RequestFeeByZoneAndPlate::class, $request);

        if(!$request->getZone() || !$request->getPlate()) {
            return (new Response(400, [
                "error" => "400: Bad request"
            ]))->toJSON();
        }

        $validFees = $this->getRepository()->getFeesForZoneAndPlate(
            $request->getZone(),
            $request->getPlate()
        );
        
        if(!empty($validFees)){

            $latestValidFee = $validFees[0];
            return (new Response(200, [
                "valid" => true,
                "valid_until" => $latestValidFee->getDateEndValidity()->format('c'),
                "vehicule_plate" => $latestValidFee->getVehiculePlate(),
                "zone" =>  $latestValidFee->getParkingMeter()->getZone()->getZoneName()
            ]))->toJSON();
        }

        $zoneRepo = $this->getEntityRepository(ZoneEntity::class);
        $zone = $zoneRepo->findOneBy(['zone_name' => $request->getZone()]);
        return (new Response(200, [
            "valid" => false,
            "fine_amount" => $zone->getDailyFee(),
            "vehicule_plate" => $request->getPlate(),
            "zone" => $zone->getZoneName()
        ]))->toJSON();
    }

    private function getRepository() : FeeRepository {
        return $this->getEntityRepository(FeeEntity::class);
    }
}