<?php

namespace ParkingSystem\Controller;

use ParkingSystem\Classes\Enums\PaymentStatus;
use ParkingSystem\Classes\Requests\Request;
use ParkingSystem\Classes\Requests\RequestFactory;
use ParkingSystem\Classes\Requests\RequestViolationGenerateTicket;
use ParkingSystem\Classes\Response;
use ParkingSystem\Classes\ResponseBadRequest;
use ParkingSystem\Model\Entity\FeeEntity;
use ParkingSystem\Model\Entity\ParkingMeterEntity;
use ParkingSystem\Model\Entity\ViolationEntity;
use ParkingSystem\Model\FeeRepository;

class ViolationController extends BaseController {
    /**
     * POST /violation/
     */
    public function POSTgenerateTicket(Request $request) : string {

        $request = RequestFactory::build(RequestViolationGenerateTicket::class, $request);
        if(!$request->getParkingMeterId() || !$request->getPlate() || !$request->getReason() ) {
            return (new ResponseBadRequest())->toJSON();
        }

        try{
            $parkingMeterRepo = $this->getEntityRepository(ParkingMeterEntity::class);
            $parkingMeter = $parkingMeterRepo->find($request->getParkingMeterId());

            $violation = new ViolationEntity();
            $violation->setParkingMeter($parkingMeter);
            $violation->setOperatorId(1); // to get from Authentication token normally
            $violation->setVehiculePlate($request->getPlate());
            $violation->setFeeAmount($parkingMeter->getZone()->getDailyFee());
            $violation->setPaymentStatus(PaymentStatus::AWAITING_PAYMENT);
            $violation->setReason($request->getReason());


            $this->entityManager->persist($violation);
            $this->entityManager->flush();

        } catch(\Exception $e){
            // @todo log exception to log aggregator (invalid violation ticket)
            //var_dump($e);
            return (new ResponseBadRequest())->toJSON();
        }


        return (new Response(200, [
            $violation->jsonSerialize(),
        ]))->toJSON();
    }

    private function getRepository() : FeeRepository {
        return $this->getEntityRepository(FeeEntity::class);
    }

}