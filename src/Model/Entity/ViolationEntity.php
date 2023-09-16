<?php

namespace ParkingSystem\Model\Entity;

use Doctrine\ORM\Mapping as ORM;
use ParkingSystem\Classes\Enums\PaymentStatus;

#[ORM\Entity]
#[ORM\Table(name: 'violation')]
class ViolationEntity implements \JsonSerializable {

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private int|null $id = null;

    #[ORM\ManyToOne(targetEntity: ParkingMeterEntity::class, fetch:"EAGER")]
    #[ORM\JoinColumn(name: 'parking_meter_id', referencedColumnName: 'id')]
    private ParkingMeterEntity $parking_meter;

    #[ORM\Column(type: 'integer')]
    private int $operator_id;

    #[ORM\Column(type: 'string')]
    private string $vehicule_plate;

    #[ORM\Column(type: 'integer')]
    private int $fee_amount;

    #[ORM\Column(type: 'datetime')]
    private \DateTime $date_creation;

    #[ORM\Column(type: 'string', enumType: PaymentStatus::class)]
    private PaymentStatus $payment_status;

    #[ORM\Column(type: 'string')]
    private string $reason;

    #[ORM\Column(type: 'datetime')]
    private \DateTime $date_payment_due;

    public function __construct(){
        $this->date_creation = new \DateTime();
        $this->date_payment_due = (new \DateTime())->add(\DateInterval::createFromDateString('1 month'));
    }

    public function jsonSerialize(): mixed {
        return [
            'id' => $this->getId(),
            'parking_meter' => $this->getParkingMeter()->jsonSerialize(),
            'operator_id' => $this->getOperatorId(),
            'vehicule_plate' => $this->getVehiculePlate(),
            'fee_amount' => $this->getFeeAmount(),
            'date_creation' => $this->getDateCreation()->format('c'),
            'payment_status' => $this->getPaymentStatus(),
            'reason' => $this->getReason(),
            'date_payment_due' => $this->getDatePaymentDue()->format('c')
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
     *
     * @return ParkingMeterEntity
     */
    public function getParkingMeter(): ParkingMeterEntity
    {
        return $this->parking_meter;
    }

    /**
     * Set the value of parking_meter
     *
     * @param ParkingMeterEntity $parking_meter
     *
     * @return self
     */
    public function setParkingMeter(ParkingMeterEntity $parking_meter): self
    {
        $this->parking_meter = $parking_meter;

        return $this;
    }

    /**
     * Get the value of operator_id
     *
     * @return int
     */
    public function getOperatorId(): int
    {
        return $this->operator_id;
    }

    /**
     * Set the value of operator_id
     *
     * @param int $operator_id
     *
     * @return self
     */
    public function setOperatorId(int $operator_id): self
    {
        $this->operator_id = $operator_id;

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
     *
     * @return int
     */
    public function getFeeAmount(): int
    {
        return $this->fee_amount;
    }

    /**
     * Set the value of fee_amount
     *
     * @param int $fee_amount
     *
     * @return self
     */
    public function setFeeAmount(int $fee_amount): self
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
     * Get the value of payment_status
     *
     * @return PaymentStatus
     */
    public function getPaymentStatus(): PaymentStatus
    {
        return $this->payment_status;
    }

    /**
     * Set the value of payment_status
     *
     * @param PaymentStatus $payment_status
     *
     * @return self
     */
    public function setPaymentStatus(PaymentStatus $payment_status): self
    {
        $this->payment_status = $payment_status;

        return $this;
    }

    /**
     * Get the value of reason
     *
     * @return string
     */
    public function getReason(): string
    {
        return $this->reason;
    }

    /**
     * Set the value of reason
     *
     * @param string $reason
     *
     * @return self
     */
    public function setReason(string $reason): self
    {
        $this->reason = $reason;

        return $this;
    }

    /**
     * Get the value of date_payment_due
     *
     * @return \DateTime
     */
    public function getDatePaymentDue(): \DateTime
    {
        return $this->date_payment_due;
    }

    /**
     * Set the value of date_payment_due
     *
     * @param \DateTime $date_payment_due
     *
     * @return self
     */
    public function setDatePaymentDue(\DateTime $date_payment_due): self
    {
        $this->date_payment_due = $date_payment_due;

        return $this;
    }
}
