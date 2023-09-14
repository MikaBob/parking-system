<?php

namespace ParkingSystem\Controller;

use Doctrine\ORM\EntityManager;
use Doctrine\Persistence\ObjectRepository;
use ParkingSystem\Model\DbConnection;

abstract class BaseController {

    public ?EntityManager $entityManager = null;

    public function getEntityManager(): EntityManager{
        if($this->entityManager !== null){
            return $this->entityManager;
        }

        $this->entityManager = new EntityManager(
            DbConnection::getDbConnection(),
            DbConnection::getDbConfig()
        );

        return $this->entityManager;
    }

    public function getEntityRepository(string $entityClass): ObjectRepository {
        return $this->getEntityManager()->getRepository($entityClass);
    }
    
}
