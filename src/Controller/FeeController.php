<?php

namespace ParkingSystem\Controller;

use Doctrine\Persistence\ObjectRepository;
use ParkingSystem\Classes\Response;
use ParkingSystem\Model\Entity\FeeEntity;

class FeeController extends BaseController {

    /**
     * GET /fee/byplate/abcd
     */
    public function GETbyplate($params) : string {

        $fee = $this->getRepository()->findBy(['vehicule_plate' => $params[0]]);

/* 
        $fee = new FeeEntity();
        $fee->setParkingMeterId(1);
        $fee->setVehiculePlate('ABCD');
        $fee->setFeeAmount(42);
        $fee->setDateEndValidity(new \DateTime());
        $this->entityManager->persist($fee);
        $this->entityManager->flush();
 */

        return (new Response(200, [
            $fee
        ]))->toJSON();
    }

    private function getRepository() : ObjectRepository {
        return $this->getEntityRepository(FeeEntity::class);
    }
}