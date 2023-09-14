<?php

namespace ParkingSystem\Model;

use ParkingSystem\Model\Entity\FeeEntity;
use PDO;

class FeeDAO extends AbstractDAO {

    protected $tableName = 'fee';

    public function __construct() {
        parent::__construct($this->tableName);
    }

    public function getByPlate($plate) : ?FeeEntity{
        if (is_string($plate) && $plate !== '') {
            $query = $this->dbConnection->prepare('SELECT * FROM `' . $this->tableName . '` WHERE vehicule_plate = :plate');
            $query->execute([':plate' => $plate]);
            $query->setFetchMode(PDO::FETCH_CLASS, FeeEntity::class);

            $result = $query->fetch();

            if ($result !== false) {
                return $result;
            }
        }
        return null;
    }
}