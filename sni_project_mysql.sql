SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema sni_project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sni_project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sni_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `sni_project` ;

-- -----------------------------------------------------
-- Table `sni_project`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sni_project`.`role` (
  `role_name` VARCHAR(45) NOT NULL,
  `role_description` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`role_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sni_project`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sni_project`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `is_active` INT NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `UKsb8bbouer5wak8vyiiy4pf2bx` (`username` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `sni_project`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sni_project`.`user_role` (
  `user_id` INT NOT NULL,
  `role_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`),
  INDEX `fk_user_has_role_role1_idx` (`role_id` ASC) VISIBLE,
  INDEX `fk_user_has_role_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_role_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `sni_project`.`role` (`role_name`),
  CONSTRAINT `fk_user_has_role_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `sni_project`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO `sni_project`.`role` (`role_name`, `role_description`) VALUES ('User', 'User role');

INSERT INTO `sni_project`.`user` (`user_id`, `first_name`, `last_name`, `is_active`, `password`, `username`) VALUES (1,	'Aleksandra', 'Jekic', 0, '$2a$10$//p/J.sDLmcD1pR5i6ZAe.uO/VNrkg/z6kla.ewZw5q6Qb3R1Fkvy', 'aca');
INSERT INTO `sni_project`.`user` (`user_id`, `first_name`, `last_name`, `is_active`, `password`, `username`) VALUES (2,	'Nikola', 'Jokic', 0, '$2a$10$g3lxidbfse.IfS9ktDNgku6ADMmlTKSMH0pTX1iR4pmcP334PgPSu', 'nikola');
INSERT INTO `sni_project`.`user` (`user_id`, `first_name`, `last_name`, `is_active`, `password`, `username`) VALUES (3,	'Marija', 'Jekic', 0, '$2a$10$zh2vV8xs/a.NWenKD.4m8OBlZrGBx2puXb0I3Xo2T8ZIjgwHcNnUS', 'maja');

INSERT INTO `sni_project`.`user_role` (`user_id`, `role_id`) VALUES	(1, 'User');
INSERT INTO `sni_project`.`user_role` (`user_id`, `role_id`) VALUES	(2, 'User');
INSERT INTO `sni_project`.`user_role` (`user_id`, `role_id`) VALUES	(3, 'User');
