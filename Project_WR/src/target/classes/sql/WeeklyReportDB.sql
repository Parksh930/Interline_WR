-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema interline_weeklyreport
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema interline_weeklyreport
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `interline_weeklyreport` DEFAULT CHARACTER SET utf8 ;
USE `interline_weeklyreport` ;

-- -----------------------------------------------------
-- Table `interline_weeklyreport`.`user_inform`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `interline_weeklyreport`.`user_inform` (
  `UserNum` INT(11) NOT NULL,
  `UserId` VARCHAR(30) NOT NULL,
  `UserName` VARCHAR(100) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Authority` VARCHAR(1) NOT NULL DEFAULT 'u',
  PRIMARY KEY (`UserNum`),
  UNIQUE INDEX `UserId_UNIQUE` (`UserId` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `interline_weeklyreport`.`report_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `interline_weeklyreport`.`report_list` (
  `ReportNum` INT(11) NOT NULL,
  `User_Num` INT(11) NOT NULL,
  `User_Name` VARCHAR(100) NOT NULL,
  `Location` VARCHAR(50) NOT NULL,
  `StartWeek` DATETIME NOT NULL,
  `EndWeek` DATETIME NOT NULL,
  `WeeklyRemarks` VARCHAR(300),
  `SendDays` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ReportNum`),
  INDEX `fk_REPORT_LIST_USER_INFORM_idx` (`User_Num` ASC) VISIBLE,
  CONSTRAINT `fk_REPORT_LIST_USER_INFORM`
    FOREIGN KEY (`User_Num`)
    REFERENCES `interline_weeklyreport`.`user_inform` (`UserNum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `interline_weeklyreport`.`report_main`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `interline_weeklyreport`.`report_main` (
  `ContentNum` INT(11) NOT NULL,
  `Report_Num` INT(11) NOT NULL,
  `StartWork` DATETIME NOT NULL,
  `EndWork` DATETIME NOT NULL,
  `ReportContents` VARCHAR(300) NOT NULL,
  `DailyRemarks` VARCHAR(300),
  PRIMARY KEY (`ContentNum`),
  INDEX `fk_REPORT_MAIN_REPORT_LIST1_idx` (`Report_Num` ASC) VISIBLE,
  CONSTRAINT `fk_REPORT_MAIN_REPORT_LIST1`
    FOREIGN KEY (`Report_Num`)
    REFERENCES `interline_weeklyreport`.`report_list` (`ReportNum`)
	ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `interline_weeklyreport`.`seq_report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `interline_weeklyreport`.`seq_report` (
  `val` INT(11) NOT NULL,
  `seq_name` VARCHAR(50) NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `interline_weeklyreport` ;

-- -----------------------------------------------------
-- function get_seq
-- -----------------------------------------------------

DELIMITER $$
USE `interline_weeklyreport`$$
CREATE DEFINER=`hrhr`@`localhost` FUNCTION `get_seq`(p_seq_name varchar(45)) RETURNS int(11)
    READS SQL DATA
begin
declare result_id int;
update seq_report set val = last_insert_id(val+1)
where seq_name = p_seq_name;
set result_id = (select last_insert_id());
return result_id;
end$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
