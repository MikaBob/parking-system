<?php

namespace ParkingSystem\Model;

use ParkingSystem\Model\Entity\FeeEntity;

class FeeRepository extends AbstractEntityRepository {

    public function getFeesForZoneAndPlate(string $zone, string $plate) : array {
        $em = $this->getEntityManager();

        $queryBuilder= $em->createQueryBuilder('f');
        $queryBuilder
            ->select('f')
            ->from(FeeEntity::class, 'f')
            ->innerJoin('f.parking_meter', 'pm')
            ->innerJoin('pm.zone', 'z')
            ->andWhere('f.date_end_validity > :current_time')
            ->andWhere('z.zone_name = :zone')
            ->andWhere('f.vehicule_plate = :plate')
            ->orderBy('f.date_end_validity', 'DESC') // if we have several valid fees, get the latest valid first
        ;

        $query = $em->createQuery($queryBuilder->getDQL());
        $query->setParameter('plate', $plate);
        $query->setParameter('zone', $zone);
        $query->setParameter('current_time', new \DateTime());
        //var_dump($query->getSQL());

        return $query->getResult();
    }
}