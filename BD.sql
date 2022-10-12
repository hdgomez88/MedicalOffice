-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MedicalOffice
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MedicalOffice
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MedicalOffice` DEFAULT CHARACTER SET utf8 ;
USE `MedicalOffice` ;

-- -----------------------------------------------------
-- Table `MedicalOffice`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MedicalOffice`.`Medico` (
  `idMedico` INT NOT NULL,
  `nombresMedico` VARCHAR(60) NOT NULL,
  `apellidosMedico` VARCHAR(60) NOT NULL,
  `fechaNacimiento` DATE NOT NULL,
  `telefonoMedico` VARCHAR(45) NOT NULL,
  `emailMedico` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idMedico`),
  UNIQUE INDEX `idPaciente_UNIQUE` (`idMedico` ASC) VISIBLE,
  UNIQUE INDEX `emailMedico_UNIQUE` (`emailMedico` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicalOffice`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MedicalOffice`.`Paciente` (
  `idPaciente` INT NOT NULL,
  `nombre1Paciente` VARCHAR(45) NOT NULL,
  `nombre2Paciente` VARCHAR(45) NULL,
  `apellidosPaciente` VARCHAR(60) NOT NULL,
  `fechaNacimiento` DATE NOT NULL,
  `telefonoPaciente` VARCHAR(45) NOT NULL,
  `emailPaciente` VARCHAR(45) NOT NULL,
  `Medico_idMedico` INT NOT NULL,
  PRIMARY KEY (`idPaciente`, `Medico_idMedico`),
  UNIQUE INDEX `idPaciente_UNIQUE` (`idPaciente` ASC) VISIBLE,
  UNIQUE INDEX `emailPaciente_UNIQUE` (`emailPaciente` ASC) VISIBLE,
  INDEX `fk_Paciente_Medico1_idx` (`Medico_idMedico` ASC) VISIBLE,
  CONSTRAINT `fk_Paciente_Medico1`
    FOREIGN KEY (`Medico_idMedico`)
    REFERENCES `MedicalOffice`.`Medico` (`idMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicalOffice`.`Citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MedicalOffice`.`Citas` (
  `idCitas` INT NOT NULL AUTO_INCREMENT,
  `fechaCita` DATE NOT NULL,
  `horaCita` VARCHAR(5) NOT NULL,
  `Paciente_idPaciente` INT NOT NULL,
  `Medico_idMedico` INT NOT NULL,
  PRIMARY KEY (`idCitas`, `Paciente_idPaciente`, `Medico_idMedico`),
  INDEX `fk_Citas_Paciente_idx` (`Paciente_idPaciente` ASC) VISIBLE,
  INDEX `fk_Citas_Medico1_idx` (`Medico_idMedico` ASC) VISIBLE,
  CONSTRAINT `fk_Citas_Paciente`
    FOREIGN KEY (`Paciente_idPaciente`)
    REFERENCES `MedicalOffice`.`Paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Medico1`
    FOREIGN KEY (`Medico_idMedico`)
    REFERENCES `MedicalOffice`.`Medico` (`idMedico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
