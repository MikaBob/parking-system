<?php

namespace ParkingSystem\Controller;

use ParkingSystem\Classes\Response;
use ParkingSystem\Model\Entity\FeeEntity;
use ParkingSystem\Model\Entity\ZoneEntity;
use ParkingSystem\Model\FeeRepository;

class FeeController extends BaseController {

    /**
     * GET /fee/byzoneandplate/zone/B/plate/plate_A
     */
    public function GETbyzoneandplate($params) : string {

        $zone = strtoupper($params[1]);
        $plate = strtoupper($params[3]);
        $validFees = $this->getRepository()->getFeesForZoneAndPlate(
            $zone,
            $plate
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
        $zone = $zoneRepo->findOneBy(['zone_name' => $zone]);
        return (new Response(200, [
            "valid" => false,
            "fine_amount" => $zone->getDailyFee(),
            "vehicule_plate" => $plate,
            "zone" => $zone->getZoneName()
        ]))->toJSON();
    }

    private function getRepository() : FeeRepository {
        return $this->getEntityRepository(FeeEntity::class);
    }
}