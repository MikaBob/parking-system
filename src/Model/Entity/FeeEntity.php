<?php

namespace ParkingSystem\Model\Entity;

use Doctrine\ORM\Mapping as ORM;
use ParkingSystem\Model\FeeRepository;
use ParkingSystem\Classes\Enums\ZoneEnum;

#[ORM\Entity(repositoryClass: FeeRepository::class)]
#[ORM\Table(name: 'fee')]
class FeeEntity extends AbstractEntity implements \JsonSerializable {

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private int|null $id = null;

    #[ORM\ManyToOne(targetEntity: ParkingMeterEntity::class, fetch:"EAGER")]
    #[ORM\JoinColumn(name: 'parking_meter_id', referencedColumnName: 'id')]
    private ParkingMeterEntity $parking_meter;

    #[ORM\Column(type: 'string')]
    private string $vehicule_plate;

    #[ORM\Column(type: 'integer')]
    private int $fee_amount;

    #[ORM\Column(type: 'datetime')]
    private \DateTime $date_creation;

    #[ORM\Column(type: 'datetime')]
    private \DateTime $date_end_validity;

    #[ORM\Column(type: 'string', enumType: ZoneEnum::class)]
    private ZoneEnum $zone_name;

    public function __construct(){
        $this->date_creation = new \DateTime();
    }

    public function jsonSerialize(): mixed {
        return [
            'id' => $this->getId(),
            'parking_meter' => $this->getParkingMeter(),
            'vehicule_plate' => $this->getVehiculePlate(),
            'fee_amount' => $this->getFeeAmount(),
            'date_creation' => $this->getDateCreation()->format('c'),
            'date_end_validity' => $this->getDateEndValidity()->format('c'),
            'zone_name' => $this->getZoneName()
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
     * Get the value of parking_meter
     */
    public function getParkingMeter() : ParkingMeterEntity
    {
        return $this->parking_meter;
    }

    /**
     * Set the value of parking_meter
     */
    public function setParkingMeter(ParkingMeterEntity $parking_meter): self
    {
        $this->parking_meter = $parking_meter;

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

    /**
     * Get the value of zone_name
     *
     * @return ZoneEnum
     */
    public function getZoneName(): ZoneEnum
    {
        return $this->zone_name;
    }

    /**
     * Set the value of zone_name
     *
     * @param ZoneEnum $zone_name
     *
     * @return self
     */
    public function setZoneName(ZoneEnum $zone_name): self
    {
        $this->zone_name = $zone_name;

        return $this;
    }
}
