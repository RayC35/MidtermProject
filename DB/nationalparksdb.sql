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
  `description` VARCHAR(1000) NOT NULL,
  `main_entrance_latitude` DOUBLE NULL,
  `main_entrance_longitude` DOUBLE NULL,
  `state_abbreviation` CHAR(2) NULL,
  `opening_time` TIME NULL,
  `closing_time` TIME NULL,
  `entry_fee` DOUBLE NULL,
  `website_url` VARCHAR(2000) NULL,
  `image_url` VARCHAR(5000) NULL,
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
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (1, 'Rocky Mountain', 'Rocky Mountain National Park, boasting high-altitude lakes and streams, imposing peaks exceeding 14,000 feet, dense evergreen forests, and vast wildlife habitats, presents a perfect haven for anyone who loves nature. ', 40.3661, 105.5553, 'CO', '00:00', '24:00', 30.00, 'https://www.nps.gov/romo/', 'https://www.nps.gov/npgallery/GetAsset/035b3918-1dd8-b71b-0b25-1c76a4dc59e2/proxy/lores');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (2, 'Mesa Verde', 'Including more than 4,000 known archeological sites dating back to A.D. 550, this national treasure protects the cliff dwellings and mesa top sites of pit houses, pueblos, masonry towers, and farming structures of the Ancestral Pueblo peoples who lived here for more than 700 years.', 37.1838, -108.4887, 'CO', '00:00', '24:00', 20.00, 'https://www.nps.gov/meve', 'https://www.nps.gov/npgallery/GetAsset/ff500f3a-155d-451f-672f-70437d482b09/proxy/lores');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (3, 'Great Sand Dunes', 'Nowhere else in the United States do mountains of sand stand higher than Great Sand Dunes National Park in Colorado. The tallest dune towers 750 feet high at an elevation of 8,700 feet above sea level. The entire dune field itself encompasses 30 square miles within the 150,000-acre park. Surf the sands or hike the surrounding trails and plan to spend the night — this International Dark Sky Park offers pristine stargazing opportunities.', 37.7329, 105.5121, 'CO', '00:00', '24:00', 25.00, 'https://www.nps.gov/grsa/', 'https://live.staticflickr.com/65535/54112535959_be36a9a89c_z.jpg');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (4, 'Black Canyon of the Gunnison', 'Sheer black walls plummet up to 2,700 feet on this 53-mile stretch of narrow gorge,  which reveal millions of years of natural history. Since its documented European discovery in the 1700s, the gorge has been renowned for its dramatic scenery and recreational opportunities.  Hike or drive along the outer rim for dramatic views of the steep cliffs, or explore the inner canyon — carved from the earth by the Gunnison River over the course of 2 million years — by way of challenging trails, rock climbing or kayaking.', 38.55056, -107.68667, 'CO', '00:00', '24:00', 30.00, 'https://www.nps.gov/blca/', 'https://www.nps.gov/npgallery/GetAsset/cf36e43e-596b-4104-a59e-9426cb826b92/proxy/lores');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (5, 'Arches', 'A red-rock wonderland. Arches National Park has over 2,000 natural stone arches, hundreds of soaring pinnacles, massive rock fins, and giant balanced rocks. This red-rock wonderland will amaze you with its formations, refresh you with its trails, and inspire you with its sunsets.', 38.733082, -109.592514, 'UT', '00:00', '24:00', 30.00, 'https://www.nps.gov/ARCH', 'https://www.nps.gov/npgallery/GetAsset/1fdb5483-155d-451f-67e4-6d15e6405ca2/proxy/lores');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (6, 'Bryce Canyon', '\nBryce Canyon National Park in Southwestern Utah is famous for the largest collection of hoodoos—the distinctive rock formations at Bryce—in the world. Bryce Canyon is also home to horseshoe-shaped amphitheaters carved from the eastern edge of the Paunsaugunt Plateau, scenic vistas, and the dark night sky.', 37.593048, -112.187332, 'UT', '00:00', '24:00', 35.00, 'https://www.nps.gov/brca/', 'https://www.nps.gov/common/uploads/grid_builder/brca/crop16_9/D5D625F9-B5BD-D3E6-70C0B2253AF8B804.jpg?width=640&quality=90&mode=crop');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (7, 'Canyonlands', 'Canyonlands invites you to explore a wilderness of countless canyons and fantastically formed buttes carved by the Colorado River and its tributaries. Rivers divide the park into four districts: Island in the Sky, The Needles, The Maze, and the rivers themselves. These areas share a primitive desert atmosphere, but each offers different opportunities for sightseeing and adventure.', 38.23399, -109.94958, 'UT', '00:00', '24:00', 30.00, 'https://www.nps.gov/cany/', 'https://www.nps.gov/npgallery/GetAsset/11fdddf9-b081-469a-8de7-7ac8c0e03062/proxy/lores');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (8, 'Capitol Reef', 'The unifying geographic feature of Capitol Reef is the Waterpocket Fold. For a hundred miles its parallel ridges rise from the desert like the swell of giant waves rolling toward shore. Exposed edges of the uplift have eroded into a slickrock wilderness of massive domes, cliffs, and a maze of twisting canyons.', 38.089600, -111.149910, 'UT', '00:00', '24:00', 20.00, 'https://www.nps.gov/CARE', 'https://www.nps.gov/npgallery/GetAsset/a2ddcd9b-1dd8-b71b-0bb3-4fccb2bd656a/proxy/lores');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (9, 'Zion', 'Within its 232 square miles are high plateaus, a maze of narrow, deep, sandstone canyons, and the Virgin River and its tributaries. Zion also has 2,000-foot Navajo Sandstone cliffs, pine- and juniper-clad slopes, and seeps, springs, and waterfalls supporting lush and colorful hanging gardens.', 37.297817, -113.028770, 'UT', '00:00', '24:00', 35.00, 'https://www.nps.gov/zion', 'https://www.nps.gov/zion/learn/photosmultimedia/images/Winter.jpg?maxwidth=650&autorotate=false&quality=78&format=webp');

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
INSERT INTO `park_visit_comment` (`id`, `comment`, `create_date`, `last_update`, `user_id`, `park_visit_id`, `in_reply_to_id`, `enabled`) VALUES (2, 'in reply to', NULL, NULL, 2, 1, 1, NULL);

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

