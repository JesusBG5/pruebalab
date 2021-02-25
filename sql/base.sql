-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema test
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema test
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `test` ;

-- -----------------------------------------------------
-- Table `test`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test`.`estado` (
  `kcveestado` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `onombre` VARCHAR(150) NULL,
  `istatus` VARCHAR(1) NOT NULL,
  `ifecins` DATETIME NOT NULL,
  `iusrins` VARCHAR(45) NOT NULL,
  `ifecmod` DATETIME NULL,
  `iusrmod` VARCHAR(45) NULL,
  PRIMARY KEY (`kcveestado`));


-- -----------------------------------------------------
-- Table `test`.`municipio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test`.`municipio` (
  `kcvemunicipio` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `rcveestado` INT UNSIGNED NOT NULL,
  `onombre` VARCHAR(200) NULL,
  `istatus` VARCHAR(1) NOT NULL,
  `ifecins` DATETIME NOT NULL,
  `iusrins` VARCHAR(45) NOT NULL,
  `ifecmod` DATETIME NULL,
  `iusrmod` VARCHAR(45) NULL,
  PRIMARY KEY (`kcvemunicipio`),
  INDEX `fk_municipio_rcveestado_idx` (`rcveestado` ASC),
  CONSTRAINT `fk_municipio_rcveestado`
    FOREIGN KEY (`rcveestado`)
    REFERENCES `test`.`estado` (`kcveestado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `test`.`datosfiscales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test`.`datosfiscales` (
  `kcvedatosfiscales` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `orfc` VARCHAR(15) NULL,
  `orazonsocial` VARCHAR(300) NULL,
  `rcveestado` INT UNSIGNED NULL,
  `rcvemunicipio` INT UNSIGNED NULL,
  `odireccion` VARCHAR(600) NULL,
  `ocolonia` VARCHAR(100) NULL,
  `ocodigopostal` VARCHAR(5) NULL,
  `oemail` VARCHAR(120) NULL,
  `istatus` VARCHAR(1) NOT NULL,
  `ifecins` DATETIME NOT NULL,
  `iusrins` VARCHAR(45) NOT NULL,
  `ifecmod` DATETIME NULL,
  `iusrmod` VARCHAR(45) NULL,
  PRIMARY KEY (`kcvedatosfiscales`));


-- -----------------------------------------------------
-- Table `test`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test`.`producto` (
  `kcveproducto` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `onombre` VARCHAR(200) NULL,
  `oclave` VARCHAR(45) NULL,
  `ocostounitario` DECIMAL(10,2) NULL,
  `istatus` VARCHAR(1) NOT NULL,
  `ifecins` DATETIME NOT NULL,
  `iusrins` VARCHAR(45) NOT NULL,
  `ifecmod` DATETIME NULL,
  `iusrmod` VARCHAR(45) NULL,
  PRIMARY KEY (`kcveproducto`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
