<?php

namespace ParkingSystem\Model\Entity;

use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
#[ORM\Table(name: 'zone')]
class ZoneEntity implements \JsonSerializable {

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private int|null $id = null;

    #[ORM\Column(type: 'integer')]
    private int $hourly_fee;

    #[ORM\Column(type: 'integer')]
    private int $daily_fee;

    #[ORM\Column(type: 'string')]
    private string $zone_name;

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
     * Get the value of hourly_fee
     */
    public function getHourlyFee() : int
    {
        return $this->hourly_fee;
    }

    /**
     * Set the value of hourly_fee
     */
    public function setHourlyFee($hourly_fee): self
    {
        $this->hourly_fee = $hourly_fee;

        return $this;
    }

    /**
     * Get the value of daily_fee
     */
    public function getDailyFee() : int
    {
        return $this->daily_fee;
    }

    /**
     * Set the value of daily_fee
     */
    public function setDailyFee($daily_fee): self
    {
        $this->daily_fee = $daily_fee;

        return $this;
    }

    /**
     * Get the value of zone_name
     */
    public function getZoneName() : string
    {
        return $this->zone_name;
    }

    /**
     * Set the value of zone_name
     */
    public function setZoneName($zone_name): self
    {
        $this->zone_name = $zone_name;

        return $this;
    }
}
