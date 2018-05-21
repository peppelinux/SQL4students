-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema address_book
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema address_book
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `address_book` DEFAULT CHARACTER SET utf8 ;
USE `address_book` ;

-- -----------------------------------------------------
-- Table `address_book`.`progetto_informatico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `address_book`.`progetto_informatico` (
  `idprogetto_informatico` INT NOT NULL,
  `progetto_informatico_desiderato` VARCHAR(45) NULL,
  PRIMARY KEY (`idprogetto_informatico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address_book`.`dati_anagrafici`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `address_book`.`dati_anagrafici` (
  `iddati_anagrafici` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `cognome` VARCHAR(45) NULL,
  `indirizzo` VARCHAR(45) NULL,
  `numero_di_telefono` INT NULL,
  `progetto_informatico_id` VARCHAR(45) NULL,
  PRIMARY KEY (`iddati_anagrafici`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address_book`.`città`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `address_book`.`città` (
  `idcittà` INT NOT NULL AUTO_INCREMENT,
  `città_coinvolte` VARCHAR(45) NULL,
  `progetto_informatico_id` VARCHAR(45) NULL,
  PRIMARY KEY (`idcittà`),
  INDEX `fk_città_dati_anagrafici1_idx` (`progetto_informatico_id` ASC),
  CONSTRAINT `fk_città_dati_anagrafici1`
    FOREIGN KEY (`progetto_informatico_id`)
    REFERENCES `address_book`.`dati_anagrafici` (`progetto_informatico_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address_book`.`province`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `address_book`.`province` (
  `idprovince` INT NOT NULL AUTO_INCREMENT,
  `province_coinvolte` VARCHAR(45) NULL,
  `progetto_informatico_id` VARCHAR(45) NULL,
  PRIMARY KEY (`idprovince`),
  INDEX `fk_province_città1_idx` (`progetto_informatico_id` ASC),
  CONSTRAINT `fk_province_città1`
    FOREIGN KEY (`progetto_informatico_id`)
    REFERENCES `address_book`.`città` (`progetto_informatico_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address_book`.`regioni`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `address_book`.`regioni` (
  `idregioni` INT NOT NULL AUTO_INCREMENT,
  `regioni_coinvolte` VARCHAR(45) NULL,
  `progetto_informatico_id` VARCHAR(45) NULL,
  PRIMARY KEY (`idregioni`),
  INDEX `fk_regioni_progetto_informatico1_idx` (`progetto_informatico_id` ASC),
  CONSTRAINT `fk_regioni_progetto_informatico1`
    FOREIGN KEY (`progetto_informatico_id`)
    REFERENCES `address_book`.`progetto_informatico` (`idprogetto_informatico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_regioni_province1`
    FOREIGN KEY (`progetto_informatico_id`)
    REFERENCES `address_book`.`province` (`progetto_informatico_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
