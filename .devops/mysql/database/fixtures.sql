USE `parking_system` ;

LOCK TABLES `zone` WRITE;
INSERT INTO `zone` (`zone_name`,`hourly_fee`, `daily_fee`) VALUES 
  ('A', 300, 2800),
  ('B', 100, 1200),
  ('C', 150, 1500),
  ('D', 50, 400);
UNLOCK TABLES;

LOCK TABLES `parking_meter` WRITE;
INSERT INTO `parking_meter` (`zone_id`,`street_name`) VALUES 
  (1, 'Cathedral Lane'),
  (1, 'Kingwood Lane'),
  (1, 'Law Avenue'),
  (1, 'Hart Street'),
  (1, 'Garnet Way'),
  (2, 'Highland Boulevard'),
  (2, 'Garden Route'),
  (2, 'Dew Row'),
  (3, 'Nova Street'),
  (3, 'Rose Street'),
  (3, 'Lumber Route'),
  (3, 'Paradise Route'),
  (4, 'Prospect Passage'),
  (4, 'Lotus Avenue'),
  (4, 'Senna Way'),
  (4, 'Manor Way'),
  (4, 'Innovation Avenue');
UNLOCK TABLES;

LOCK TABLES `fee` WRITE;
INSERT INTO `fee`  (`parking_meter_id`, `vehicule_plate`, `fee_amount`, `date_creation`, `date_end_validity`) VALUES 
  (1, 'PLATE_A', 300, NOW(), DATE_ADD(NOW(), INTERVAL 1 HOUR)),
  (2, 'PLATE_B', 1200,NOW(), DATE_ADD(NOW(), INTERVAL 1 DAY)),
  (9, 'PLATE_C', 150, NOW(), DATE_ADD(NOW(), INTERVAL 1 HOUR)),
  (1, 'PLATE_A', 2800, NOW(), DATE_ADD(NOW(), INTERVAL 1 DAY));
UNLOCK TABLES;

LOCK TABLES `operator` WRITE;
INSERT INTO `operator` (`username`, `password`, `salt`, `date_creation`,`is_active`) VALUES 
  ('operator_1', 'SHA_256_WITH_SALT_AND_DATE_CREATION_AND_SECRET', 'LONG_SALT_STRING', '2023-07-19 18:51:04', 1),
  ('operator_2', 'XXXXXXXXXXXXX', 'YYYYYYYYYYYYY', '2023-07-19 18:51:04', 1),
  ('operator_3', 'XXXXXXXXXXXXX', 'YYYYYYYYYYYYY', '2023-07-20 18:51:04', 1),
  ('operator_4', 'XXXXXXXXXXXXX', 'YYYYYYYYYYYYY', '2022-07-19 18:51:04', 0),
  ('operator_5', 'XXXXXXXXXXXXX', 'YYYYYYYYYYYYY', '2023-08-19 18:51:04', 1);
UNLOCK TABLES;

LOCK TABLES `violation` WRITE;
INSERT INTO `violation` (`parking_meter_id`, `operator_id`, `vehicule_plate`, `fee_amount`, `date_creation`, `payment_status`, `reason`, `date_payment_due`) VALUES 
  (1, 1, 'PLATE_D', 2800, NOW(), 'AWAITING_PAYMENT', 'No ticket found on windshield',DATE_ADD(NOW(), INTERVAL 1 DAY));
UNLOCK TABLES;


LOCK TABLES `archive_fee` WRITE;
INSERT INTO `archive_fee`  (`uuid`, `vehicule_plate`, `fee_amount`, `date_creation`, `zone_name`) VALUES 
    (UUID_TO_BIN(UUID()), 'PLATE_A', 1300, DATE_SUB(NOW(), INTERVAL 1 MONTH), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 200,	 DATE_SUB(NOW(), INTERVAL 2 MONTH), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 400,	 DATE_SUB(NOW(), INTERVAL 3 MONTH), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 500,	 DATE_SUB(NOW(), INTERVAL 4 MONTH), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 600,	 DATE_SUB(NOW(), INTERVAL 5 MONTH), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 630,	 DATE_SUB(NOW(), INTERVAL 6 MONTH), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 620,	 DATE_SUB(NOW(), INTERVAL 7 MONTH), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 610,	 DATE_SUB(NOW(), INTERVAL 8 MONTH), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 999,	 DATE_SUB(NOW(), INTERVAL 1 MONTH), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 453,	 DATE_SUB(NOW(), INTERVAL 2 MONTH), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 373,	 DATE_SUB(NOW(), INTERVAL 3 MONTH), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 782,	 DATE_SUB(NOW(), INTERVAL 4 MONTH), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 452,	 DATE_SUB(NOW(), INTERVAL 5 MONTH), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 782,	 DATE_SUB(NOW(), INTERVAL 6 MONTH), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 4553, DATE_SUB(NOW(), INTERVAL 7 MONTH), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 1300, DATE_SUB(NOW(), INTERVAL 1 MONTH), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 123,	 DATE_SUB(NOW(), INTERVAL 2 MONTH), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 456,	 DATE_SUB(NOW(), INTERVAL 3 MONTH), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 452,	 DATE_SUB(NOW(), INTERVAL 4 MONTH), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 600,	 DATE_SUB(NOW(), INTERVAL 5 MONTH), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 12,	 DATE_SUB(NOW(), INTERVAL 6 MONTH), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 452,	 DATE_SUB(NOW(), INTERVAL 7 MONTH), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 827,	 DATE_SUB(NOW(), INTERVAL 1 MONTH), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 782,	 DATE_SUB(NOW(), INTERVAL 2 MONTH), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 452,	 DATE_SUB(NOW(), INTERVAL 3 MONTH), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 937,	 DATE_SUB(NOW(), INTERVAL 4 MONTH), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 453,	 DATE_SUB(NOW(), INTERVAL 5 MONTH), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 753,	 DATE_SUB(NOW(), INTERVAL 6 MONTH), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 789,	 DATE_SUB(NOW(), INTERVAL 7 MONTH), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 1 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 563,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 1 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 1 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 123,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 1 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 1 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 423,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 1 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 421,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 1 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 8 MONTH), INTERVAL 1 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 687,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 1 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 786,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 1 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 423,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 1 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 545,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 1 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 7865, DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 1 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 120,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 1 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 620,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 1 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 1300, DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 1 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 450,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 1 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 400,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 1 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 500,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 1 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 600,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 1 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 4200, DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 1 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 620,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 1 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 120,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 1 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 5472, DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 1 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 400,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 1 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 500,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 1 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 7543, DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 1 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 630,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 1 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 753,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 1 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 1300, DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 2 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 45,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 2 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 7896, DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 2 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 500,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 2 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 2 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 5728, DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 2 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 782,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 2 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 8 MONTH), INTERVAL 2 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 1300, DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 2 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 78,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 2 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 400,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 2 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 4532, DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 2 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 6860, DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 2 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 630,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 2 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 2 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 2 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 200,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 2 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 78,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 2 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 500,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 2 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 602,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 2 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 630,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 2 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 620,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 2 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 1300, DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 2 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 456,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 2 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 7986, DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 2 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 4563, DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 2 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 786,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 2 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 48,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 2 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 620,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 2 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 786,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 3 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 200,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 3 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 452,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 3 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 783,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 3 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 7938, DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 3 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 7986, DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 3 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 452,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 3 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 120,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 8 MONTH), INTERVAL 3 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 1300, DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 3 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 200,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 3 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 400,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 3 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 500,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 3 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 786,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 3 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 786,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 3 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 620,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 3 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 45,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 3 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 765,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 3 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 400,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 3 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 4200, DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 3 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 600,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 3 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 630,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 3 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 453,  DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 3 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 435,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 3 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 200,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 3 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 78,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 3 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 248,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 3 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 600,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 3 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 876,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 3 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 7866, DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 3 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 1300, DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 3 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 4 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 4300, DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 4 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 500,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 4 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_F', 786,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 4 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_F', 630,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 4 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_F', 9870, DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 4 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_F', 610,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 8 MONTH), INTERVAL 4 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_F', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 4 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_F', 200,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 4 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_F', 786,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 4 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_F', 500,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 4 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_F', 708,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 4 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_F', 630,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 4 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_F', 698,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 4 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_F', 160,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 4 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 687,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 4 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 4 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 500,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 4 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 4 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 697,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 4 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 620,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 4 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 786,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 4 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 200,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 4 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 15,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 4 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 4 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 782,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 4 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 6589, DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 4 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 93,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 4 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 796,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 4 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 423,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 5 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 400,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 5 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 5 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 600,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 5 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 630,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 5 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 6933, DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 5 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 345,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 8 MONTH), INTERVAL 5 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 7523, DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 5 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 423,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 5 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 400,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 5 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 539,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 5 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 5 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 693,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 5 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 687,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 5 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 654,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 5 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 456,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 5 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 8693, DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 5 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 783,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 5 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 5 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 5 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 6857, DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 5 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 687,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 5 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 5 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 60,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 5 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 36,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 5 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 6830, DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 5 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 620,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 5 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 190,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 6 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 999,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 6 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 888,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 6 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 777,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 6 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 666,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 6 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 555,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 6 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 333,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 6 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 222,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 8 MONTH), INTERVAL 6 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 111,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 6 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 222,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 6 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 223,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 6 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 3570, DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 6 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 765,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 6 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 630,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 6 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 69,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 6 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 1300, DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 6 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 4533, DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 6 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 783,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 6 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 5070, DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 6 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 78,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 6 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 6430, DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 6 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 620,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 6 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_A', 456,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 6 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 967,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 6 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 4070, DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 6 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 783,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 6 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_D', 38,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 6 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_B', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 6 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 'PLATE_C', 6435, DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 6 YEAR), 'D');
UNLOCK TABLES;



LOCK TABLES `archive_violation` WRITE;
INSERT INTO `archive_violation` (`uuid`, `operator_id`, `vehicule_plate`, `fee_amount`, `date_creation`, `zone_name`) VALUES 
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 2900,	 DATE_SUB(NOW(), INTERVAL 1 MONTH), 'A'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 2600,	 DATE_SUB(NOW(), INTERVAL 2 MONTH), 'A'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 2700,	 DATE_SUB(NOW(), INTERVAL 3 MONTH), 'A'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 3000,	 DATE_SUB(NOW(), INTERVAL 4 MONTH), 'A'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 3100,	 DATE_SUB(NOW(), INTERVAL 5 MONTH), 'A'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 3200,	 DATE_SUB(NOW(), INTERVAL 6 MONTH), 'A'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 3300,	 DATE_SUB(NOW(), INTERVAL 7 MONTH), 'A'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 9999,	 DATE_SUB(NOW(), INTERVAL 1 MONTH), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 9898,	 DATE_SUB(NOW(), INTERVAL 2 MONTH), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 9786,	 DATE_SUB(NOW(), INTERVAL 3 MONTH), 'B'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 7863,	 DATE_SUB(NOW(), INTERVAL 4 MONTH), 'B'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 453,	 DATE_SUB(NOW(), INTERVAL 6 MONTH), 'B'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 73,	 DATE_SUB(NOW(), INTERVAL 7 MONTH), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 2900,	 DATE_SUB(NOW(), INTERVAL 1 MONTH), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 8793,	 DATE_SUB(NOW(), INTERVAL 2 MONTH), 'C'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 8793,	 DATE_SUB(NOW(), INTERVAL 3 MONTH), 'C'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 4893,	 DATE_SUB(NOW(), INTERVAL 4 MONTH), 'C'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 4563,	 DATE_SUB(NOW(), INTERVAL 5 MONTH), 'C'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 8796,	 DATE_SUB(NOW(), INTERVAL 6 MONTH), 'C'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 4893,	 DATE_SUB(NOW(), INTERVAL 7 MONTH), 'C'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 3489,	 DATE_SUB(NOW(), INTERVAL 1 MONTH), 'C'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 2600,	 DATE_SUB(NOW(), INTERVAL 2 MONTH), 'D'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 4563,	 DATE_SUB(NOW(), INTERVAL 3 MONTH), 'D'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 7893,	 DATE_SUB(NOW(), INTERVAL 4 MONTH), 'D'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 54,	 DATE_SUB(NOW(), INTERVAL 5 MONTH), 'D'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 4563,	 DATE_SUB(NOW(), INTERVAL 6 MONTH), 'D'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 7986,	 DATE_SUB(NOW(), INTERVAL 7 MONTH), 'D'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 3456,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 1 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 786,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 1 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 5463,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 1 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 4563,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 1 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 6987,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 1 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 786,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 1 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 3300,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 1 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 1 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 786,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 1 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 456,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 1 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 697,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 1 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 3987,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 1 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 1 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 7893,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 1 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 9783,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 1 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 1 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 2735,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 1 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 782,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 1 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 687,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 1 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 3200,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 1 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 1 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 1 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 977,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 1 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 786,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 1 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 45,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 1 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 786,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 1 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 3786,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 1 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 786,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 1 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 2 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 42,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 2 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 24,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 2 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 756,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 2 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 6897,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 2 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 753,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 2 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 2 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 7938,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 2 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 123,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 2 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 783,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 2 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 7453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 2 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 9637,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 2 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 2 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 973,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 2 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 735,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 2 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 2 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 396,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 2 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 2 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 45,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 2 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 4836,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 2 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 354,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 2 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 4733,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 2 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 694,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 2 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 89,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 2 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 4563,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 2 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 728,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 2 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 483,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 2 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 2 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 78,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 3 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 3465,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 3 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 5364,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 3 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 2358,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 3 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 783,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 3 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 3 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 8369,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 3 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 3 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 2600,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 3 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 738,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 3 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 435,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 3 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 132,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 3 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 739,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 3 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 1324,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 3 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 378,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 3 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 5364,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 3 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 4563,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 3 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 4536,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 3 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 3 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 4536,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 3 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 897,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 3 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 783,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 3 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 423,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 3 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 123,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 3 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 793,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 3 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 793,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 3 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 4536,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 3 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 8639,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 3 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 4635,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 4 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 7983,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 4 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 4536,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 4 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 453,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 4 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 4536,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 4 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 7938,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 4 YEAR), 'A'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 2900,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 4 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 786,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 4 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 4536,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 4 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 4635,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 4 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 768,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 4 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 78,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 4 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 783,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 4 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 354,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 4 YEAR), 'B'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 753,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 4 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 968,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 4 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 537,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 4 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 8357,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 4 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 738,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 4 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 735,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 4 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 12,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 MONTH), INTERVAL 4 YEAR), 'C'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 1345,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 2 MONTH), INTERVAL 4 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 1, 'PLATE_A', 7968,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 3 MONTH), INTERVAL 4 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_A', 387,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 4 MONTH), INTERVAL 4 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 2, 'PLATE_B', 563,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 5 MONTH), INTERVAL 4 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 3, 'PLATE_B', 768,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 6 MONTH), INTERVAL 4 YEAR), 'D'),
  (UUID_TO_BIN(UUID()), 4, 'PLATE_B', 457,	 DATE_SUB(DATE_SUB(NOW(), INTERVAL 7 MONTH), INTERVAL 4 YEAR), 'D');
UNLOCK TABLES;
