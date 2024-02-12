-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonAnalysis
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonAnalysis
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonAnalysis` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonAnalysis` ;

-- -----------------------------------------------------
-- Table `LittleLemonAnalysis`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonAnalysis`.`Staff` (
  `StaffID` INT NOT NULL,
  `Role` VARCHAR(255) NOT NULL,
  `Salary` DECIMAL NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonAnalysis`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonAnalysis`.`Customer` (
  `CustomerID` INT NOT NULL,
  `GuestFirstName` VARCHAR(255) NOT NULL,
  `GuestLastName` VARCHAR(255) NOT NULL,
  `Contact` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonAnalysis`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonAnalysis`.`Bookings` (
  `BookingID` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  `BookingSlot` TIME NOT NULL,
  `StaffID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `fk_staff_id_idx` (`StaffID` ASC) VISIBLE,
  INDEX `fk_customerid_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_staff_id`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonAnalysis`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_customerid`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonAnalysis`.`Customer` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonAnalysis`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonAnalysis`.`Menu` (
  `MenuID` INT NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  `Cuisine` VARCHAR(255) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  `Price` DECIMAL NOT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonAnalysis`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonAnalysis`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `BookingID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_bookingid_idx` (`BookingID` ASC) VISIBLE,
  INDEX `fk_menuid_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `fk_bookingid`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonAnalysis`.`Bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_menuid`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonAnalysis`.`Menu` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonAnalysis`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonAnalysis`.`OrderDeliveryStatus` (
  `DeliveryDate` DATE NOT NULL,
  `OrderStatus` VARCHAR(255) NOT NULL,
  `OrderID` INT NOT NULL,
  INDEX `fk_orderid_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_orderid`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonAnalysis`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
