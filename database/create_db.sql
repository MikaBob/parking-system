-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema parking_system
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `parking_system` ;

-- -----------------------------------------------------
-- Schema parking_system
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `parking_system` DEFAULT CHARACTER SET utf8 ;
USE `parking_system` ;

-- -----------------------------------------------------
-- Table `parking_system`.`zone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `parking_system`.`zone` ;

CREATE TABLE IF NOT EXISTS `parking_system`.`zone` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `hourly_fee` INT UNSIGNED NOT NULL,
  `daily_fee` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parking_system`.`street`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `parking_system`.`street` ;

CREATE TABLE IF NOT EXISTS `parking_system`.`street` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `zone_id` INT UNSIGNED NOT NULL,
  `designation` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) INVISIBLE,
  INDEX `fk_street_zone1_idx` (`zone_id` ASC) VISIBLE,
  CONSTRAINT `fk_street_zone1`
    FOREIGN KEY (`zone_id`)
    REFERENCES `parking_system`.`zone` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parking_system`.`violation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `parking_system`.`violation` ;

CREATE TABLE IF NOT EXISTS `parking_system`.`violation` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `street_id` INT UNSIGNED NOT NULL,
  `vehicule_plate` VARCHAR(50) NOT NULL,
  `fee_amount` INT UNSIGNED NOT NULL,
  `date_creation` DATETIME NOT NULL,
  `payment_status` ENUM('AWAITING_PAYMENT', 'PENDING_BANK', 'PAID') NOT NULL,
  `reason` VARCHAR(255) NOT NULL,
  `date_payment_due` DATETIME NOT NULL,
  INDEX `fk_violation_street1_idx` (`street_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_violation_street1`
    FOREIGN KEY (`street_id`)
    REFERENCES `parking_system`.`street` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parking_system`.`operator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `parking_system`.`operator` ;

CREATE TABLE IF NOT EXISTS `parking_system`.`operator` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `violation_id` INT UNSIGNED NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `salt` VARCHAR(255) NOT NULL,
  `date_creation` DATETIME NOT NULL,
  `is_active` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  INDEX `fk_operator_violation1_idx` (`violation_id` ASC) VISIBLE,
  CONSTRAINT `fk_operator_violation1`
    FOREIGN KEY (`violation_id`)
    REFERENCES `parking_system`.`violation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parking_system`.`fee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `parking_system`.`fee` ;

CREATE TABLE IF NOT EXISTS `parking_system`.`fee` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `street_id` INT UNSIGNED NOT NULL,
  `vehicule_plate` VARCHAR(50) NOT NULL,
  `fee_amount` INT UNSIGNED NOT NULL,
  `date_creation` DATETIME NOT NULL,
  `date_end_validity` DATETIME NOT NULL,
  INDEX `fk_fee_street1_idx` (`street_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_fee_street1`
    FOREIGN KEY (`street_id`)
    REFERENCES `parking_system`.`street` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS ps_backend_user;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'ps_backend_user' IDENTIFIED BY 'ps_backend_user_password';

GRANT SELECT ON TABLE `parking_system`.* TO 'ps_backend_user';
GRANT SELECT, INSERT, TRIGGER ON TABLE `parking_system`.* TO 'ps_backend_user';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
