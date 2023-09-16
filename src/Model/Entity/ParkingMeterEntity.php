<?php

namespace ParkingSystem\Model\Entity;

use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: 'parking_meter')]
class ParkingMeterEntity implements \JsonSerializable {

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private int|null $id = null;

    #[ORM\ManyToOne(targetEntity: ZoneEntity::class, fetch:"EAGER")]
    #[ORM\JoinColumn(name: 'zone_id', referencedColumnName: 'id')]
    private ZoneEntity $zone;

    #[ORM\Column(type: 'string')]
    private string $street_name;

    public function jsonSerialize(): mixed {
        return json_encode($this);
    }


    /**
     * Get the value of id
     */
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * Get the value of zone
     */
    public function getZone() : ZoneEntity
    {
        return $this->zone;
    }

    /**
     * Set the value of zone
     */
    public function setZone($zone): self
    {
        $this->zone = $zone;

        return $this;
    }

    /**
     * Get the value of street_name
     */
    public function getStreetName() : string
    {
        return $this->street_name;
    }

    /**
     * Set the value of street_name
     */
    public function setStreetName($street_name): self
    {
        $this->street_name = $street_name;

        return $this;
    }
}
