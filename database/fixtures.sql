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
  (9, 'PLATE_C', 150, NOW(), DATE_ADD(NOW(), INTERVAL 1 HOUR));
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
