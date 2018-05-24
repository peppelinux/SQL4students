-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Negozio_di_Piante
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Negozio_di_Piante
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Negozio_di_Piante` DEFAULT CHARACTER SET utf8mb4 ;
USE `Negozio_di_Piante` ;

-- -----------------------------------------------------
-- Table `Negozio_di_Piante`.`accessorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Negozio_di_Piante`.`accessorio` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `descrizione` CHAR(1) NULL DEFAULT NULL COMMENT 'description',
  `quantità_magazzino` INT(11) NULL DEFAULT NULL COMMENT 'how many accessories we have',
  `scorta_minima` INT(11) NULL DEFAULT NULL COMMENT 'how many accessories we must have',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `Negozio_di_Piante`.`bolla_arrivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Negozio_di_Piante`.`bolla_arrivo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `fornitore` CHAR(1) NULL DEFAULT NULL COMMENT 'name of the \'fornitore\'',
  `numero` INT(11) NULL DEFAULT NULL COMMENT 'code number',
  `data` DATE NULL DEFAULT NULL COMMENT 'date',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `Negozio_di_Piante`.`bolla_consegna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Negozio_di_Piante`.`bolla_consegna` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `numero` INT(11) NULL DEFAULT NULL COMMENT 'code number',
  `data` DATE NULL DEFAULT NULL COMMENT 'date',
  `dettagliante` CHAR(1) NULL DEFAULT NULL COMMENT 'name of \'dettagliante\'',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `Negozio_di_Piante`.`ordine_dettagliante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Negozio_di_Piante`.`ordine_dettagliante` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `dettagliante` CHAR(1) NULL DEFAULT NULL COMMENT 'name of \'dettagliante\'',
  `numero` INT(11) NULL DEFAULT NULL COMMENT 'code number',
  `data` DATE NULL DEFAULT NULL COMMENT 'date',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `Negozio_di_Piante`.`dettagliante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Negozio_di_Piante`.`dettagliante` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `codicefiscale` CHAR(1) NULL DEFAULT NULL,
  `ragionesociale` CHAR(1) NULL DEFAULT NULL COMMENT 'society\'s name',
  `indirizzo` CHAR(1) NULL DEFAULT NULL COMMENT 'address',
  `città` CHAR(1) NULL DEFAULT NULL COMMENT 'city',
  `n_telefono` INT(11) NULL DEFAULT NULL COMMENT 'phone number',
  PRIMARY KEY (`id`),
  INDEX `fk_dettagliante_ordine_dettagliante_idx` (`ragionesociale` ASC),
  CONSTRAINT `fk_dettagliante_ordine_dettagliante`
    FOREIGN KEY (`ragionesociale`)
    REFERENCES `Negozio_di_Piante`.`ordine_dettagliante` (`dettagliante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dettagliante_bolla_consegna1`
    FOREIGN KEY (`ragionesociale`)
    REFERENCES `Negozio_di_Piante`.`bolla_consegna` (`dettagliante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `Negozio_di_Piante`.`fiore`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Negozio_di_Piante`.`fiore` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'code of the flower',
  `descrizione` CHAR(1) NULL DEFAULT NULL COMMENT 'type of the flower',
  `quantità_magazzino` INT(11) NULL DEFAULT NULL COMMENT 'how many flower we have',
  `scorta_minima` INT(11) NULL DEFAULT NULL COMMENT 'how many flower we must ever have',
  `nome_scientifico` CHAR(1) NULL DEFAULT NULL COMMENT 'scientific name',
  `tempo_di_vita_medio` DATETIME NULL DEFAULT NULL COMMENT 'medium lifetime',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `Negozio_di_Piante`.`ordine_fornitore`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Negozio_di_Piante`.`ordine_fornitore` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `numero` INT(11) NULL DEFAULT NULL COMMENT 'code number',
  `data` DATE NULL DEFAULT NULL COMMENT 'date',
  `fornitore` CHAR(1) NULL DEFAULT NULL COMMENT 'name of the \'fornitore\'',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `Negozio_di_Piante`.`fornitore`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Negozio_di_Piante`.`fornitore` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `codicefiscale` CHAR(1) NULL DEFAULT NULL,
  `ragionesociale` CHAR(1) NULL DEFAULT NULL COMMENT 'name of the society',
  `indirizzo` CHAR(1) NULL DEFAULT NULL COMMENT 'address',
  `città` CHAR(1) NULL DEFAULT NULL COMMENT 'city',
  `n_telefono` INT(11) NULL DEFAULT NULL COMMENT 'phone number',
  PRIMARY KEY (`id`),
  INDEX `fk_fornitore_ordine_fornitore1_idx` (`ragionesociale` ASC),
  CONSTRAINT `fk_fornitore_ordine_fornitore1`
    FOREIGN KEY (`ragionesociale`)
    REFERENCES `Negozio_di_Piante`.`ordine_fornitore` (`fornitore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fornitore_bolla_arrivo1`
    FOREIGN KEY (`ragionesociale`)
    REFERENCES `Negozio_di_Piante`.`bolla_arrivo` (`fornitore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `Negozio_di_Piante`.`pianta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Negozio_di_Piante`.`pianta` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'code of the plant',
  `descrizione` CHAR(1) NULL DEFAULT NULL COMMENT 'description of the plant',
  `quantità_magazzino` INT(11) NULL DEFAULT NULL COMMENT 'how many plant we have',
  `scorta_minima` INT(11) NULL DEFAULT NULL COMMENT 'how many plants we must have',
  `nome_scientifico` CHAR(1) NULL DEFAULT NULL COMMENT 'scientific name',
  `sempreverde` TINYINT(1) NULL DEFAULT NULL COMMENT 'if it is evergreen',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
