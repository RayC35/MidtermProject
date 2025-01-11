-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema nationalparksdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `nationalparksdb` ;

-- -----------------------------------------------------
-- Schema nationalparksdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nationalparksdb` DEFAULT CHARACTER SET utf8 ;
USE `nationalparksdb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `email` VARCHAR(100) NULL,
  `biography` TEXT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `password_UNIQUE` (`password` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `park`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `park` ;

CREATE TABLE IF NOT EXISTS `park` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `main_entrance_latitude` DOUBLE NULL,
  `main_entrance_longitude` DOUBLE NULL,
  `state_abbreviation` CHAR(2) NULL,
  `opening_time` TIME NULL,
  `closing_time` TIME NULL,
  `entry_fee` DOUBLE NULL,
  `website_url` VARCHAR(2000) NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite_park`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_park` ;

CREATE TABLE IF NOT EXISTS `favorite_park` (
  `park_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`park_id`, `user_id`),
  INDEX `fk_park_has_user_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_park_has_user_park_idx` (`park_id` ASC) VISIBLE,
  CONSTRAINT `fk_park_has_user_park`
    FOREIGN KEY (`park_id`)
    REFERENCES `park` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_park_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amenity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amenity` ;

CREATE TABLE IF NOT EXISTS `amenity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `park_id` INT NOT NULL,
  `description` TEXT NULL,
  `cost_range` INT NULL,
  `image_url` VARCHAR(2000) NULL,
  `website_url` VARCHAR(2000) NULL,
  `latitude` DOUBLE NULL,
  `longitude` DOUBLE NULL,
  `enabled` TINYINT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_amenity_park1_idx` (`park_id` ASC) VISIBLE,
  CONSTRAINT `fk_amenity_park1`
    FOREIGN KEY (`park_id`)
    REFERENCES `park` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `park_visit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `park_visit` ;

CREATE TABLE IF NOT EXISTS `park_visit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NULL,
  `remarks` TEXT NULL,
  `user_id` INT NOT NULL,
  `park_id` INT NOT NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `rating` INT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `image_url` VARCHAR(2000) NULL,
  `published` TINYINT NULL DEFAULT 1,
  `enabled` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_park_visit_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_park_visit_park1_idx` (`park_id` ASC) VISIBLE,
  CONSTRAINT `fk_park_visit_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_park_visit_park1`
    FOREIGN KEY (`park_id`)
    REFERENCES `park` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amenity_visit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amenity_visit` ;

CREATE TABLE IF NOT EXISTS `amenity_visit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NULL,
  `comment` TEXT NULL,
  `date_visited` DATE NULL,
  `last_update` DATETIME NULL,
  `park_visit_id` INT NOT NULL,
  `amenity_id` INT NOT NULL,
  `create_date` DATETIME NULL,
  `enabled` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_review_park_visit1_idx` (`park_visit_id` ASC) VISIBLE,
  INDEX `fk_review_amenity1_idx` (`amenity_id` ASC) VISIBLE,
  CONSTRAINT `fk_review_park_visit1`
    FOREIGN KEY (`park_visit_id`)
    REFERENCES `park_visit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_amenity1`
    FOREIGN KEY (`amenity_id`)
    REFERENCES `amenity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amenity_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amenity_category` ;

CREATE TABLE IF NOT EXISTS `amenity_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amenity_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amenity_has_category` ;

CREATE TABLE IF NOT EXISTS `amenity_has_category` (
  `amenity_id` INT NOT NULL AUTO_INCREMENT,
  `amenity_category_id` INT NOT NULL,
  PRIMARY KEY (`amenity_id`, `amenity_category_id`),
  INDEX `fk_amenity_has_amenity_category_amenity_category1_idx` (`amenity_category_id` ASC) VISIBLE,
  INDEX `fk_amenity_has_amenity_category_amenity1_idx` (`amenity_id` ASC) VISIBLE,
  CONSTRAINT `fk_amenity_has_amenity_category_amenity1`
    FOREIGN KEY (`amenity_id`)
    REFERENCES `amenity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_amenity_has_amenity_category_amenity_category1`
    FOREIGN KEY (`amenity_category_id`)
    REFERENCES `amenity_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `park_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `park_comment` ;

CREATE TABLE IF NOT EXISTS `park_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` TEXT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `user_id` INT NOT NULL,
  `park_id` INT NOT NULL,
  `in_reply_to_id` INT NULL,
  `enabled` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_park_comment_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_park_comment_park1_idx` (`park_id` ASC) VISIBLE,
  INDEX `fk_park_comment_park_comment1_idx` (`in_reply_to_id` ASC) VISIBLE,
  CONSTRAINT `fk_park_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_park_comment_park1`
    FOREIGN KEY (`park_id`)
    REFERENCES `park` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_park_comment_park_comment1`
    FOREIGN KEY (`in_reply_to_id`)
    REFERENCES `park_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `park_visit_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `park_visit_comment` ;

CREATE TABLE IF NOT EXISTS `park_visit_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` TEXT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `user_id` INT NOT NULL,
  `park_visit_id` INT NOT NULL,
  `in_reply_to_id` INT NULL,
  `enabled` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_park_comment_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_park_comment_park_comment1_idx` (`in_reply_to_id` ASC) VISIBLE,
  INDEX `fk_park_visit_comment_park_visit1_idx` (`park_visit_id` ASC) VISIBLE,
  CONSTRAINT `fk_park_comment_user10`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_park_comment_park_comment10`
    FOREIGN KEY (`in_reply_to_id`)
    REFERENCES `park_visit_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_park_visit_comment_park_visit1`
    FOREIGN KEY (`park_visit_id`)
    REFERENCES `park_visit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `park_visit_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `park_visit_image` ;

CREATE TABLE IF NOT EXISTS `park_visit_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(2000) NOT NULL,
  `description` TEXT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `park_visit_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_park_visit_image_park_visit1_idx` (`park_visit_id` ASC) VISIBLE,
  CONSTRAINT `fk_park_visit_image_park_visit1`
    FOREIGN KEY (`park_visit_id`)
    REFERENCES `park_visit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wishlist_park`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wishlist_park` ;

CREATE TABLE IF NOT EXISTS `wishlist_park` (
  `park_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`park_id`, `user_id`),
  INDEX `fk_park_has_user_user2_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_park_has_user_park1_idx` (`park_id` ASC) VISIBLE,
  CONSTRAINT `fk_park_has_user_park1`
    FOREIGN KEY (`park_id`)
    REFERENCES `park` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_park_has_user_user2`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `followed_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `followed_user` ;

CREATE TABLE IF NOT EXISTS `followed_user` (
  `user_id` INT NOT NULL,
  `followed_user_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `followed_user_id`),
  INDEX `fk_user_has_user_user2_idx` (`followed_user_id` ASC) VISIBLE,
  INDEX `fk_user_has_user_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_user_user2`
    FOREIGN KEY (`followed_user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amenity_visit_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `amenity_visit_comment` ;

CREATE TABLE IF NOT EXISTS `amenity_visit_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` TEXT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `user_id` INT NOT NULL,
  `amenity_visit_id` INT NOT NULL,
  `in_reply_to_id` INT NULL,
  `enabled` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_park_comment_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_park_comment_park_comment1_idx` (`in_reply_to_id` ASC) VISIBLE,
  INDEX `fk_park_comment_copy1_amenity_visit1_idx` (`amenity_visit_id` ASC) VISIBLE,
  CONSTRAINT `fk_park_comment_user11`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_park_comment_park_comment11`
    FOREIGN KEY (`in_reply_to_id`)
    REFERENCES `amenity_visit_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_park_comment_copy1_amenity_visit1`
    FOREIGN KEY (`amenity_visit_id`)
    REFERENCES `amenity_visit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS parksuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'parksuser'@'localhost' IDENTIFIED BY 'parks';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'parksuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image_url`, `create_date`, `last_update`, `email`, `biography`) VALUES (1, 'admin', 'test', 1, 'admin', 'admin', 'admin', NULL, '2025-01-10 14:43', '2025-01-10 14:43', 'admin@admin.com', NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image_url`, `create_date`, `last_update`, `email`, `biography`) VALUES (2, 'parkslover', 'parks', 1, NULL, 'Taylor', 'Swift', NULL, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `park`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (1, 'Yosemite', 'test park description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite_park`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `favorite_park` (`park_id`, `user_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `amenity`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `amenity` (`id`, `name`, `park_id`, `description`, `cost_range`, `image_url`, `website_url`, `latitude`, `longitude`, `enabled`, `create_date`, `last_update`) VALUES (1, 'Yosemite Visitor Center', 1, 'test amenity description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `park_visit`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `park_visit` (`id`, `title`, `remarks`, `user_id`, `park_id`, `start_date`, `end_date`, `rating`, `create_date`, `last_update`, `image_url`, `published`, `enabled`) VALUES (1, NULL, 'test park_visit_remarks', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `amenity_visit`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `amenity_visit` (`id`, `rating`, `comment`, `date_visited`, `last_update`, `park_visit_id`, `amenity_id`, `create_date`, `enabled`) VALUES (1, 5, 'test amenity_visit', NULL, NULL, 1, 1, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `amenity_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Visitor\'s Center', NULL, NULL);
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (2, 'Hotel', NULL, NULL);
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (3, 'Food', NULL, NULL);
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (4, 'Campground', NULL, NULL);
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (5, 'RV Park', NULL, NULL);
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (6, 'Cabin', NULL, NULL);
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (7, 'Restroom', NULL, NULL);
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (8, 'Landmark', NULL, NULL);
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (9, 'Fishing', NULL, NULL);
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (10, 'Guided Tour', NULL, NULL);
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (11, 'Hiking', NULL, NULL);
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (12, 'Horseback Riding', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `amenity_has_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `amenity_has_category` (`amenity_id`, `amenity_category_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `park_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `park_comment` (`id`, `comment`, `create_date`, `last_update`, `user_id`, `park_id`, `in_reply_to_id`, `enabled`) VALUES (1, 'first comment', NULL, NULL, 1, 1, NULL, NULL);
INSERT INTO `park_comment` (`id`, `comment`, `create_date`, `last_update`, `user_id`, `park_id`, `in_reply_to_id`, `enabled`) VALUES (2, 'in reply to comment', NULL, NULL, 2, 1, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `park_visit_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `park_visit_comment` (`id`, `comment`, `create_date`, `last_update`, `user_id`, `park_visit_id`, `in_reply_to_id`, `enabled`) VALUES (1, 'test comment', NULL, NULL, 1, 1, NULL, NULL);
INSERT INTO `park_visit_comment` (`id`, `comment`, `create_date`, `last_update`, `user_id`, `park_visit_id`, `in_reply_to_id`, `enabled`) VALUES (2, 'in reply to ', NULL, NULL, 2, 1, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `park_visit_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `park_visit_image` (`id`, `image_url`, `description`, `create_date`, `last_update`, `park_visit_id`) VALUES (1, 'https://www.nps.gov/media/photo/gallery.htm?pg=841891&id=66F449BA-1399-4855-806B-D405505677FB', 'test park_visit_image', NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wishlist_park`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `wishlist_park` (`park_id`, `user_id`) VALUES (1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `followed_user`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `followed_user` (`user_id`, `followed_user_id`) VALUES (1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `amenity_visit_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `amenity_visit_comment` (`id`, `comment`, `create_date`, `last_update`, `user_id`, `amenity_visit_id`, `in_reply_to_id`, `enabled`) VALUES (1, 'test amenity_visit_comment', NULL, NULL, 1, 1, NULL, NULL);

COMMIT;

