<?php

namespace ParkingSystem\Model\Entity;

use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: 'fee')]
class FeeEntity implements \JsonSerializable {

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private int|null $id = null;

    #[ORM\Column(type: 'integer')]
    private $parking_meter_id;

    #[ORM\Column(type: 'string')]
    private $vehicule_plate;

    #[ORM\Column(type: 'integer')]
    private $fee_amount;

    #[ORM\Column(type: 'datetime')]
    private $date_creation;

    #[ORM\Column(type: 'datetime')]
    private $date_end_validity;

    public function __construct(){
        $this->date_creation = new \DateTime();
    }

    public function jsonSerialize(): mixed {
        return [
            'id' => $this->getId(),
            'parking_meter_id' => $this->getParkingMeterId(),
            'vehicule_plate' => $this->getVehiculePlate(),
            'fee_amount' => $this->getFeeAmount(),
            'date_creation' => $this->getDateCreation()->format('c'),
            'date_end_validity' => $this->getDateEndValidity()->format('c')
        ];
    }


    /**
     * Get the value of id
     */
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * Set the value of id
     */
    public function setId($id): self
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Get the value of parking_meter_id
     */
    public function getParkingMeterId() : int
    {
        return $this->parking_meter_id;
    }

    /**
     * Set the value of parking_meter_id
     */
    public function setParkingMeterId($parking_meter_id): self
    {
        $this->parking_meter_id = $parking_meter_id;

        return $this;
    }

    /**
     * Get the value of vehicule_plate
     */
    public function getVehiculePlate() : string
    {
        return $this->vehicule_plate;
    }

    /**
     * Set the value of vehicule_plate
     */
    public function setVehiculePlate($vehicule_plate): self
    {
        $this->vehicule_plate = $vehicule_plate;

        return $this;
    }

    /**
     * Get the value of fee_amount
     */
    public function getFeeAmount() : int
    {
        return $this->fee_amount;
    }

    /**
     * Set the value of fee_amount
     */
    public function setFeeAmount($fee_amount): self
    {
        $this->fee_amount = $fee_amount;

        return $this;
    }

    /**
     * Get the value of date_creation
     */
    public function getDateCreation() : \DateTime
    {
        return $this->date_creation;
    }

    /**
     * Set the value of date_creation
     */
    public function setDateCreation($date_creation): self
    {
        $this->date_creation = $date_creation;

        return $this;
    }

    /**
     * Get the value of date_end_validity
     */
    public function getDateEndValidity() : \DateTime
    {
        return $this->date_end_validity;
    }

    /**
     * Set the value of date_end_validity
     */
    public function setDateEndValidity($date_end_validity): self
    {
        $this->date_end_validity = $date_end_validity;

        return $this;
    }
}
