/**
* The City would like to list its parking or violation fee income per time period.
*/
SELECT
	total_violation_fees AS 'Total violation fees',
    amount_violation_fees AS 'Amount violation fees',
    total_parking_fees AS 'Total parking fees',
    amount_parking_fees AS 'Amount parking fees',
    IF(fees.period IS NULL, violation.period, fees.period) AS Period,
    (total_violation_fees +amount_violation_fees) AS 'Total fees',
    (amount_violation_fees + amount_parking_fees) AS 'Amount fees'
FROM 
	(
		SELECT 
			SUM(av.fee_amount) AS total_violation_fees,
			COUNT(av.fee_amount) AS amount_violation_fees,
			YEAR(av.date_creation) AS period
		FROM archive_violation av
		GROUP BY period
	) violation
    CROSS JOIN
    (
		SELECT 
			SUM(af.fee_amount) AS total_parking_fees,
			COUNT(af.fee_amount) AS amount_parking_fees,
			YEAR(af.date_creation) AS period
		FROM archive_fee af
		GROUP BY period
	) fees
    ON violation.period = fees.period
;
/**
* Looks a bit scray with the cross join. It to keep periods from both SELECT.
* Using a LEFT/RIGHT/INNER join would have filter out period that isn't in the other table.
*
* Both table are partitionned and uses their idx_date_creation
*/


/**
* The City is interested in efficiency of its employees, so they’d like to see the number of 
* vehicles tested by field operators.
*/
SELECT 
	av.operator_id AS Operator,
    COUNT(av.fee_amount) AS 'Amount scan', /* I would add a log at each time an operator scan. in the meantime I'm using this column as "scan counter" */
    YEAR(av.date_creation) AS Period
FROM archive_violation av
GROUP BY Period, Operator
;
/* no index used :/, but I also didn't implement a "scan log" */

/**
* The City would like good management of their parking zones so they’d like to see a
* report on the number of vehicles per zone per time period.
*/
SELECT 
	COUNT(af.vehicule_plate) AS 'Amount Vehicule',
    af.zone_name AS Zone,
    YEAR(af.date_creation) AS Period
FROM archive_fee af
GROUP BY Zone, Period
;
/* use index idx_zone_name_vehicule_plate */

/**
* The City would like to offer special monthly pricing to frequent users of the parking
* system, so they’d like to see a list of repeated users of the system, by license plate.
*/
SELECT 
	af.vehicule_plate as Plate,
	COUNT(af.vehicule_plate) AS 'Amount of visit',
    af.zone_name AS Zone
FROM archive_fee af
GROUP BY Plate, Zone
;
/* use index idx_zone_name_vehicule_plate */