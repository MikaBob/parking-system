<?php

namespace ParkingSystem\Classes\Enums;

enum PaymentStatus: string {
    case AWAITING_PAYMENT = 'AWAITING_PAYMENT';
    case PENDING_BANK = 'PENDING_BANK';
    case PAID = 'PAID';
}