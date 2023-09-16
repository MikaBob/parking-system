<?php

namespace ParkingSystem\Controller;

use ParkingSystem\Classes\Requests\Request;
use ParkingSystem\Classes\Requests\RequestFactory;
use ParkingSystem\Classes\Requests\RequestFeeByZoneAndPlate;
use ParkingSystem\Classes\Requests\RequestParkHere;
use ParkingSystem\Classes\Response;
use ParkingSystem\Classes\ResponseBadRequest;
use ParkingSystem\Model\Entity\FeeEntity;
use ParkingSystem\Model\Entity\ParkingMeterEntity;
use ParkingSystem\Model\Entity\ZoneEntity;
use ParkingSystem\Model\FeeRepository;

class FeeController extends BaseController {

    /**
     * GET /fee/byzoneandplate/zone/B/plate/plate_A
     */
    public function GETbyzoneandplate(Request $request) : string {
        $request = RequestFactory::build(RequestFeeByZoneAndPlate::class, $request);

        if(!$request->getZone() || !$request->getPlate()) {
            return (new ResponseBadRequest())->toJSON();
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

        if(!$zone){
            // @todo log exception to log aggregator (unknowned zone)
            //var_dump($e);
            return (new ResponseBadRequest())->toJSON();
        }

        return (new Response(200, [
            "valid" => false,
            "fine_amount" => $zone->getDailyFee(),
            "vehicule_plate" => $request->getPlate(),
            "zone" => $zone->getZoneName()
        ]))->toJSON();
    }

    /**
     * POST /fee/parkhere/
     */
    public function POSTparkhere(Request $request) : string {
        $request = RequestFactory::build(RequestParkHere::class, $request);

        if(!$request->getParkingMeterId()
            || !$request->getPlate() 
            || !$request->getAmount()
            || !$request->getEndValidity()
        ) {
            return (new ResponseBadRequest())->toJSON();
        }

        try{
            $parkingMeterRepo = $this->getEntityRepository(ParkingMeterEntity::class);
            $parkingMeter = $parkingMeterRepo->find($request->getParkingMeterId());

            if(!$parkingMeter){
                // @todo log exception to log aggregator (unknowned parking meter)
                //var_dump($e);
                return (new ResponseBadRequest())->toJSON();
            }

            $fee = new FeeEntity();
            $fee->setParkingMeter($parkingMeter);
            $fee->setZoneName($parkingMeter->getZone()->getZoneName());
            $fee->setVehiculePlate($request->getPlate());
            $fee->setFeeAmount($request->getAmount());
            $fee->setDateEndValidity($request->getEndValidity());

            $this->entityManager->persist($fee);
            $this->entityManager->flush();

        } catch(\Exception $e){
            // @todo log exception to log aggregator (invalid fee)
            //var_dump($e);
            return (new ResponseBadRequest())->toJSON();
        }

        return (new Response(200, [
            $fee->jsonSerialize()
        ]))->toJSON();
    }

    private function getRepository() : FeeRepository {
        return $this->getEntityRepository(FeeEntity::class);
    }
}