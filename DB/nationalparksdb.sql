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
  `enabled` TINYINT NULL DEFAULT 1,
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
  `description` TEXT NOT NULL,
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
  `user_id` INT NOT NULL,
  `park_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_id`, `park_id`),
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
  `enabled` TINYINT NULL DEFAULT 1,
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
  `user_id` INT NOT NULL,
  `park_id` INT NOT NULL,
  `title` VARCHAR(200) NULL,
  `remarks` TEXT NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `rating` INT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `image_url` VARCHAR(2000) NULL,
  `published` TINYINT NULL DEFAULT 1,
  `enabled` TINYINT NULL DEFAULT 1,
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
  `park_visit_id` INT NOT NULL,
  `amenity_id` INT NOT NULL,
  `remarks` TEXT NULL,
  `rating` INT NULL,
  `date_visited` DATE NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `enabled` TINYINT NULL DEFAULT 1,
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
  `name` VARCHAR(100) NULL,
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
  `user_id` INT NOT NULL,
  `park_id` INT NOT NULL,
  `in_reply_to_id` INT NULL,
  `comment` TEXT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `enabled` TINYINT NULL DEFAULT 1,
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
  `user_id` INT NOT NULL,
  `park_visit_id` INT NOT NULL,
  `in_reply_to_id` INT NULL,
  `comment` TEXT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `enabled` TINYINT NULL DEFAULT 1,
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
  `park_visit_id` INT NOT NULL,
  `image_url` VARCHAR(2000) NOT NULL,
  `description` TEXT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
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
  `user_id` INT NOT NULL,
  `park_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `park_id`),
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
  `user_id` INT NOT NULL,
  `amenity_visit_id` INT NOT NULL,
  `in_reply_to_id` INT NULL,
  `comment` TEXT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `enabled` TINYINT NULL DEFAULT 1,
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
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image_url`, `create_date`, `last_update`, `email`, `biography`) VALUES (1, 'parksKingKong', 'larry', 1, 'admin', 'Larry', 'Kong', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhk-KzwYROUR7YTTnyt7x-prwSedwvlbwb5w&s', '2025-01-10 14:43', '2025-01-10 14:43', 'larry.kong@sdvid.com', 'Hiya, Larry here! I\'m a passionate national park enthusiast who loves exploring the beauty of the great outdoors. I\'ve visited over 30 national parks, capturing stunning landscapes through my photography and sharing my adventures to inspire others. When I\'m not on the trail, I focus on advocating for environmental conservation and educating my community on the importance of preserving our natural wonders.      ');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image_url`, `create_date`, `last_update`, `email`, `biography`) VALUES (2, 'lisaLovesParks', 'lisa', 1, 'admin', 'Lisa', 'Gibson', 'https://img.freepik.com/premium-photo/black-female-park-ranger-smiling_605022-25386.jpg', '2025-01-12 13:25', '2025-01-12 13:25', 'lisa.gibson@sdvid.com', 'Boy, do I love parks - that\'s why it\'s in my username! I\'m Lisa and I\'ve been to a national park in every state and my favorite is ... all of them! Let\'s connect if you want to join me on my quest to visit all 63 national parks before 2030!\n');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image_url`, `create_date`, `last_update`, `email`, `biography`) VALUES (3, 'mosquitoSlayer', 'buffy', 1, 'user', 'Buffy', 'Hua', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG_fGOGFth1yhdgHTy2PjOWmSvHREtSgiDPQ&s', '2025-01-12 13:29', '2025-01-12 13:29', 'buffy.hua@sdvid.com', 'Hi, I’m Buffy Hua, your go-to expert on dodging mosquitoes while pretending to be one with nature. I’ve hiked, camped, and occasionally tripped my way through countless national parks, all in the name of \"adventure.\" Whether I’m outrunning raccoons for my snacks or getting lost on \"clearly marked\" trails, I’m here for the views, the fresh air, and the never-ending quest for the perfect s’more.');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image_url`, `create_date`, `last_update`, `email`, `biography`) VALUES (4, 'scrambledSteve', 'steve', 1, 'user', 'Steve', 'Striker', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFaDhcLu-sEeSmV46-m49v92UmaGm2K77C-Q&s', '2025-01-12 13:35', '2025-01-12 13:35', 'steve.striker@sdvid.com', 'Hi! I love our natural outdoor world. Ever since I left New Jersey, I\'ve been obsessed with going places where I can\'t see any skyscrapers or apartment buildings. If anyone wants to join me while I scramble up some mountain peaks, drop me a line!');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image_url`, `create_date`, `last_update`, `email`, `biography`) VALUES (5, 'AA', 'aa', 1, NULL, 'test', 'test', NULL, NULL, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `park`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (1, 'Rocky Mountain', 'Rocky Mountain National Park, boasting high-altitude lakes and streams, imposing peaks exceeding 14,000 feet, dense evergreen forests, and vast wildlife habitats, presents a perfect haven for anyone who loves nature. ', 40.3661, 105.5553, 'CO', '00:00', '23:59', 30.00, 'https://www.nps.gov/romo/', 'https://www.nps.gov/npgallery/GetAsset/035b3918-1dd8-b71b-0b25-1c76a4dc59e2/proxy/lores');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (2, 'Mesa Verde', 'Including more than 4,000 known archeological sites dating back to A.D. 550, this national treasure protects the cliff dwellings and mesa top sites of pit houses, pueblos, masonry towers, and farming structures of the Ancestral Pueblo peoples who lived here for more than 700 years.', 37.1838, -108.4887, 'CO', '00:00', '23:59', 20.00, 'https://www.nps.gov/meve', 'https://www.nps.gov/npgallery/GetAsset/ff500f3a-155d-451f-672f-70437d482b09/proxy/lores');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (3, 'Great Sand Dunes', 'Nowhere else in the United States do mountains of sand stand higher than Great Sand Dunes National Park in Colorado. The tallest dune towers 750 feet high at an elevation of 8,700 feet above sea level. The entire dune field itself encompasses 30 square miles within the 150,000-acre park. Surf the sands or hike the surrounding trails and plan to spend the night — this International Dark Sky Park offers pristine stargazing opportunities.', 37.7329, 105.5121, 'CO', '00:00', '23:59', 25.00, 'https://www.nps.gov/grsa/', 'https://live.staticflickr.com/65535/54112535959_be36a9a89c_z.jpg');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (4, 'Black Canyon of the Gunnison', 'Sheer black walls plummet up to 2,700 feet on this 53-mile stretch of narrow gorge,  which reveal millions of years of natural history. Since its documented European discovery in the 1700s, the gorge has been renowned for its dramatic scenery and recreational opportunities.  Hike or drive along the outer rim for dramatic views of the steep cliffs, or explore the inner canyon — carved from the earth by the Gunnison River over the course of 2 million years — by way of challenging trails, rock climbing or kayaking.', 38.55056, -107.68667, 'CO', '00:00', '23:59', 30.00, 'https://www.nps.gov/blca/', 'https://www.nps.gov/npgallery/GetAsset/cf36e43e-596b-4104-a59e-9426cb826b92/proxy/lores');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (5, 'Arches', 'A red-rock wonderland. Arches National Park has over 2,000 natural stone arches, hundreds of soaring pinnacles, massive rock fins, and giant balanced rocks. This red-rock wonderland will amaze you with its formations, refresh you with its trails, and inspire you with its sunsets.', 38.733082, -109.592514, 'UT', '00:00', '23:59', 30.00, 'https://www.nps.gov/ARCH', 'https://www.nps.gov/npgallery/GetAsset/1fdb5483-155d-451f-67e4-6d15e6405ca2/proxy/lores');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (6, 'Bryce Canyon', 'Bryce Canyon National Park in Southwestern Utah is famous for the largest collection of hoodoos—the distinctive rock formations at Bryce—in the world. Bryce Canyon is also home to horseshoe-shaped amphitheaters carved from the eastern edge of the Paunsaugunt Plateau, scenic vistas, and the dark night sky.', 37.593048, -112.187332, 'UT', '00:00', '23:59', 35.00, 'https://www.nps.gov/brca/', 'https://www.nps.gov/common/uploads/grid_builder/brca/crop16_9/D5D625F9-B5BD-D3E6-70C0B2253AF8B804.jpg?width=640&quality=90&mode=crop');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (7, 'Canyonlands', 'Canyonlands invites you to explore a wilderness of countless canyons and fantastically formed buttes carved by the Colorado River and its tributaries. Rivers divide the park into four districts: Island in the Sky, The Needles, The Maze, and the rivers themselves. These areas share a primitive desert atmosphere, but each offers different opportunities for sightseeing and adventure.', 38.23399, -109.94958, 'UT', '00:00', '23:59', 30.00, 'https://www.nps.gov/cany/', 'https://www.nps.gov/npgallery/GetAsset/11fdddf9-b081-469a-8de7-7ac8c0e03062/proxy/lores');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (8, 'Capitol Reef', 'The unifying geographic feature of Capitol Reef is the Waterpocket Fold. For a hundred miles its parallel ridges rise from the desert like the swell of giant waves rolling toward shore. Exposed edges of the uplift have eroded into a slickrock wilderness of massive domes, cliffs, and a maze of twisting canyons.', 38.089600, -111.149910, 'UT', '00:00', '23:59', 20.00, 'https://www.nps.gov/CARE', 'https://www.nps.gov/npgallery/GetAsset/a2ddcd9b-1dd8-b71b-0bb3-4fccb2bd656a/proxy/lores');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (9, 'Zion', 'Within its 232 square miles are high plateaus, a maze of narrow, deep, sandstone canyons, and the Virgin River and its tributaries. Zion also has 2,000-foot Navajo Sandstone cliffs, pine- and juniper-clad slopes, and seeps, springs, and waterfalls supporting lush and colorful hanging gardens.', 37.297817, -113.028770, 'UT', '00:00', '23:59', 35.00, 'https://www.nps.gov/zion', 'https://www.nps.gov/zion/learn/photosmultimedia/images/Winter.jpg?maxwidth=650&autorotate=false&quality=78&format=webp');

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite_park`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (1, 1);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (1, 2);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (1, 3);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (1, 4);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (1, 5);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (1, 6);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (1, 7);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (1, 8);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (1, 9);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (2, 1);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (2, 2);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (2, 3);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (2, 4);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (2, 5);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (2, 6);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (2, 7);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (2, 8);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (2, 9);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (3, 1);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (3, 7);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (3, 8);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (4, 1);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (4, 4);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (4, 6);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (4, 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `amenity`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `amenity` (`id`, `name`, `park_id`, `description`, `cost_range`, `image_url`, `website_url`, `latitude`, `longitude`, `enabled`, `create_date`, `last_update`) VALUES (1, 'Beaver Meadows Visitor Center', 1, 'Beaver Meadows Visitor Center is open year-round. This visitor center is located on the east side of RMNP near the town of Estes Park, along U.S. Highway 36 approximately 1 mile east of the Beaver Meadows Entrance to RMNP. Inside the visitor center, meet with park staff, enjoy the park\'s movie, and visit the Rocky Mountain Conservancy Nature Store.\n\n\n', 0, 'https://files.slack.com/files-tmb/T052X7BAZ-F088ZNTFSKA-f446fc57d2/image_720.png', 'https://www.nps.gov/romo/bm_visitor_center.htm', 40.2158, 105.3339, 1, '2024-01-01 12:00', '2024-01-01 12:00');
INSERT INTO `amenity` (`id`, `name`, `park_id`, `description`, `cost_range`, `image_url`, `website_url`, `latitude`, `longitude`, `enabled`, `create_date`, `last_update`) VALUES (2, 'Fruita Campground', 8, 'The Fruita Campground is open year-round, and is the only developed campground in Capitol Reef National Park. With only 71 spaces in the Fruita Campground, the park has a 100% reservation system. There is currently much higher demand for the campsites, and the sites are full several months in advance.\n', 2, 'https://www.nps.gov/care/planyourvisit/images/CG-fall-color-best.JPG?maxwidth=650&autorotate=false&quality=78&format=webp', 'https://www.nps.gov/care/planyourvisit/fruitacampground.htm#:~:text=The%20Fruita%20Campground%20is%20open,full%20several%20months%20in%20advance.', 38.28252, -111.24702, 1, '2024-01-01 12:00', '2024-01-01 12:00');
INSERT INTO `amenity` (`id`, `name`, `park_id`, `description`, `cost_range`, `image_url`, `website_url`, `latitude`, `longitude`, `enabled`, `create_date`, `last_update`) VALUES (3, 'Cassidy Arch Trail', 8, 'Head out on this 3.1-mile out-and-back trail near Torrey, Utah. Generally considered a moderately challenging route. This is a very popular area for hiking, so you\'ll likely encounter other people while exploring. The best times to visit this trail are March through June. You\'ll need to leave pups at home — dogs aren\'t allowed on this trail.\nCassidy Arch Trail provides astounding and beautiful views, so make sure to bring your camera! This route takes you to a viewpoint of Cassidy Arch, with an option to walk out to the top of the arch itself. To complete this route, some scrambling and exposure to heights is required. This route does not have shade and is also exposed to the elements. It is a good idea to bring a hat and plenty of water. The best time to hike this route is during the shoulder seasons when the conditions are mild.', 0, 'https://images.ctfassets.net/0wjmk6wgfops/4n3bAYToFjsLhaJt2mvV2I/a929df2ca086f0748ed37065311cfef1/5006f21456_11570582-797f-45fb-b550-2cf1a75717a2.jpg?w=1280&h=800&fit=fill&f=center&q=80&fm=webp', 'https://www.alltrails.com/trail/us/utah/cassidy-arch-trail', 38.26382, -111.21572, 1, '2024-01-01 12:00', '2024-01-01 12:00');
INSERT INTO `amenity` (`id`, `name`, `park_id`, `description`, `cost_range`, `image_url`, `website_url`, `latitude`, `longitude`, `enabled`, `create_date`, `last_update`) VALUES (4, 'Gifford Homestead', 8, 'The Gifford Homestead is located 1 mile south of the Capitol Reef visitor center on the Scenic Drive and is open 8-5 daily (possible extended hours in the summer) from March 14 (Pi Day) to October 31 (closing dates may vary).', 1, 'https://a.travel-assets.com/findyours-php/viewfinder/images/res70/167000/167655-Capitol-Reef-National-Park.jpg', 'https://www.visitutah.com/places-to-go/parks-outdoors/capitol-reef/must-see-capitol-reef/gifford-homestead', 38.283736, -111.247401, 1, '2024-01-01 12:00', '2024-01-01 12:00');
INSERT INTO `amenity` (`id`, `name`, `park_id`, `description`, `cost_range`, `image_url`, `website_url`, `latitude`, `longitude`, `enabled`, `create_date`, `last_update`) VALUES (5, 'Bryce Canyon Lodge', 6, 'The Lodge at Bryce Canyon, located in Bryce, UT, the only lodging within Bryce Canyon National Park, welcomes guests to experience the magic of Bryce. We are a full-service lodge with a variety of room accommodations that cater to both individuals and families traveling to Bryce Canyon, who are wanting to explore the infamous canyon, or relax in one of the most remote national parks.\n\n', 3, 'https://www.visitbrycecanyon.com/media/826776/entrence-exterior-bryce-canyon-lodge-2000x.jpg?anchor=center&mode=crop&width=2000&height=1334&rnd=133747865140000000', 'https://www.visitbrycecanyon.com/lodging/the-lodge-at-bryce-canyon/', 37.62694, -112.16722, 1, '2024-01-01 12:00', '2024-01-01 12:00');
INSERT INTO `amenity` (`id`, `name`, `park_id`, `description`, `cost_range`, `image_url`, `website_url`, `latitude`, `longitude`, `enabled`, `create_date`, `last_update`) VALUES (6, 'Watchman Campground', 9, 'Watchman Campground is next to the Zion Canyon Visitor Center, ¼ mile away from the South Entrance in Springdale, Utah. Tent and electric campsites are available year-round and group campsites are available from March through November. All sites include a place for a tent or RV, a picnic table, and access to a fire ring.\n\nYou need to make a reservation for all sites in Watchman Campground. There are no sites set aside for walk-up campers. You can make a reservation up to six (6) months in advance.', 2, 'https://i0.wp.com/hikestgeorge.com/wp-content/uploads/2021/01/watchman-campground-8.jpg?fit=1200%2C800&ssl=1', 'https://www.nps.gov/zion/planyourvisit/watchman-campground.htm', 37.185333, -112.979599, 1, '2024-01-01 12:00', '2024-01-01 12:00');
INSERT INTO `amenity` (`id`, `name`, `park_id`, `description`, `cost_range`, `image_url`, `website_url`, `latitude`, `longitude`, `enabled`, `create_date`, `last_update`) VALUES (7, 'The Narrows', 9, 'The Narrows is the narrowest section of Zion Canyon. This gorge, with walls a thousand feet tall and the river sometimes just twenty to thirty feet wide, is one of the most popular areas in Zion National Park. You can see The Narrows by hiking along the paved, wheelchair accessible Riverside Walk for one mile from the Temple of Sinawava. If you wish to see more, you will be walking in the Virgin River. This can involve wading upstream for just a few minutes or it can be an all day hike.\n\n', 0, 'https://preview.redd.it/the-narrows-zion-national-park-v0-zgignqezpiib1.jpg?width=640&crop=smart&auto=webp&s=cf51d0c8ce14343ee0947c0ac1d84bbd1ed8cf06', 'https://www.nps.gov/zion/planyourvisit/thenarrows.htm', 37.30669, -111.05236, 1, '2024-01-01 12:00', '2024-01-01 12:00');
INSERT INTO `amenity` (`id`, `name`, `park_id`, `description`, `cost_range`, `image_url`, `website_url`, `latitude`, `longitude`, `enabled`, `create_date`, `last_update`) VALUES (8, 'Angels Landing', 9, 'Angels Landing is one of the most popular destinations in Zion National Park. The Angels Landing trail is a strenuous, 4.95-mile roundtrip hike that takes about 3.5 hours to complete. The trailhead has vault toilets and water, but there is no camping on the trail. The best time to hike is in the spring, summer, or fall, and in the morning or afternoon.', 1, 'https://www.nps.gov/common/uploads/cropped_image/primary/23EF45DA-96CE-AEDD-E6FA82FF43279637.jpg?width=1300&quality=90&mode=crop', 'https://www.nps.gov/thingstodo/hike-angels-landing.htm', 37.269125, -112.947894, 1, '2024-01-01 12:00', '2024-01-01 12:00');
INSERT INTO `amenity` (`id`, `name`, `park_id`, `description`, `cost_range`, `image_url`, `website_url`, `latitude`, `longitude`, `enabled`, `create_date`, `last_update`) VALUES (9, 'Red Rock Grill', 9, 'Welcome to the Red Rock Grill, where magnificent views of Zion Canyon pair perfectly with local flavors and beautifully crafted dishes. Enjoy a fresh, seasonal menu with an abundance of variety designed to meet the diverse tastes and dietary needs of our many guests. Dinner is a sit-down affair at the Red Rock Grill. We recommend making reservations. \n\n', 2, 'https://media-cdn.tripadvisor.com/media/photo-s/0b/14/c6/f2/zion-lodge-with-red-rock.jpg', 'https://www.zionlodge.com/dining-shopping/red-rock-grill', 37.205274, -112.98246, 1, '2024-01-01 12:00', '2024-01-01 12:00');
INSERT INTO `amenity` (`id`, `name`, `park_id`, `description`, `cost_range`, `image_url`, `website_url`, `latitude`, `longitude`, `enabled`, `create_date`, `last_update`) VALUES (10, 'Sandboarding & Sandsledding', 3, 'One of the newest sports growing in popularity in the area is Sandboarding and sand sledding. Like the winter version, snowboarding, it offers challenges, thrills, lots of fun and exercise. Sand is a softer landing surface so Sandboarding is a great activity for all ages, young and old! Sandboarding, sledding, and skiing are permitted anywhere on the dunefield away from vegetated areas. From the main Dunes Parking Area, it\'s a minimum 0.7 mile (1km) hike to get to the small or medium-sized slopes; the top of the first high ridge is 1.25 miles. Smaller slopes at the base are fine for young children, while teens and adults may prefer longer slopes near the top of the first high ridge of dunes.  Sandboards and sand sleds are specifically made for sand, featuring a special design with extra slick base material and special wax; these work best for sliding in most conditions. ', 2, 'https://npca.s3.amazonaws.com/images/11001/117cf387-8b77-428c-ac14-36a6dedd6fe8-banner.jpg?1488561081', 'https://www.nps.gov/grsa/planyourvisit/sandboardingsandsledding.htm', 37.732777777778, -105.51222222222, 1, '2024-01-01 12:00', '2024-01-01 12:00');
INSERT INTO `amenity` (`id`, `name`, `park_id`, `description`, `cost_range`, `image_url`, `website_url`, `latitude`, `longitude`, `enabled`, `create_date`, `last_update`) VALUES (11, 'Great Sand Dunes Visitor Center', 3, 'Don\'t forget to grab Great Sand Dunes memorabilia and gifts after leaving the park! At this Visitor\'s Center located at the park\'s entrance, you can find books, posters, apparel, local art, and more.\n\n', 0, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2rnxOtteiHgTI7TRv1RmWwZHxbqLIpY3H0g&s', 'https://www.nps.gov/grsa/planyourvisit/visitor-center.htm', 37.732777777778, -105.51222222222, 1, '2024-01-01 12:00', '2024-01-01 12:00');
INSERT INTO `amenity` (`id`, `name`, `park_id`, `description`, `cost_range`, `image_url`, `website_url`, `latitude`, `longitude`, `enabled`, `create_date`, `last_update`) VALUES (12, 'Great Sand Dunes Oasis', 3, 'Restaurant, sandboad ad sandsled rentals, gift store, groceries, gasoline, motel, camper cabins, tent and RV camping - all at the entrance of Great Sand Dunes National Park and Preserve.', NULL, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/28/cb/2d/d6/caption.jpg?w=1400&h=-1&s=1', 'https://greatdunes.com/', 37.649957, -105.586780, 1, '2024-01-01 12:00', '2024-01-01 12:00');

COMMIT;


-- -----------------------------------------------------
-- Data for table `park_visit`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `park_visit` (`id`, `user_id`, `park_id`, `title`, `remarks`, `start_date`, `end_date`, `rating`, `create_date`, `last_update`, `image_url`, `published`, `enabled`) VALUES (1, 4, 1, 'Fall at RMNP!', 'Rocky Mountain National Park is absolutely majestic! A wonderful display of colorful meadows, evergreen forests, alpine tundra far above the tree line, numerous superb hiking trails, stunning clear mountain lakes, spectacular drives, and up-close encounters with impressive wildlife! We enjoyed every minute of the three days we spent exploring RMNP.  Yes, you do need a timed permit during the Parks\' busy season. If you do your homework, you are prepared. The permits were easy to acquire if you got on the website about a month in advance. No permit needed the rest of the year, though (Oct 20th)!', '2024-10-11', '2024-10-14', 5, '2024-10-15 12:05', '2024-10-15 12:05', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2d/d5/4d/f0/caption.jpg?w=1200&h=-1&s=1', 1, 1);
INSERT INTO `park_visit` (`id`, `user_id`, `park_id`, `title`, `remarks`, `start_date`, `end_date`, `rating`, `create_date`, `last_update`, `image_url`, `published`, `enabled`) VALUES (2, 3, 8, 'Capitol Reef camping experience', 'My friends and I visited the Capitol Reef National Park from September 20-25, 2024, and it was an unforgettable experience. The park\'s stunning red rock landscapes and unique geological formations took our breath away, and we enjoyed several of the hiking trails. The Fruita Campground was the perfect base for our adventures, and we were able to relax under the stars after a day of exploring. Highly recommend for nature lovers and families looking for a quieter park to visit!', '2024-09-20', '2024-09-25', 4, '2024-09-25 20:08', '2024-09-25 20:08', 'https://files.slack.com/files-pri/T052X7BAZ-F0884CBDZPY/image.png?is_viewed=1', 1, 1);
INSERT INTO `park_visit` (`id`, `user_id`, `park_id`, `title`, `remarks`, `start_date`, `end_date`, `rating`, `create_date`, `last_update`, `image_url`, `published`, `enabled`) VALUES (3, 2, 6, 'Stargazing at Bryce Canyon', 'The hubs and I took a short vacation to Bryce Canyon this summer to stay at one of our favorite hotels, the Bryce Canyon lodge. We went stargazing in the park and it was amazing! We even saw Uranus!', '2024-06-17', '2024-06-19', 5, '2024-06-20 8:42', '2024-06-20 8:42', 'https://www.astropics.com/images/xl/BryceCanyonNP-NavajoTrail-Hiking-MWArch-20x30-web2_1600.jpg', 1, 1);
INSERT INTO `park_visit` (`id`, `user_id`, `park_id`, `title`, `remarks`, `start_date`, `end_date`, `rating`, `create_date`, `last_update`, `image_url`, `published`, `enabled`) VALUES (4, 1, 9, 'Summer Fun in Zion', 'My friend and I spent three unforgettable days at Zion National Park, and let\'s just say, the views were almost as wild as the hikes themselves. We tackled Angels Landing and The Narrows. The park’s shuttle system was a lifesaver—perfect for when our legs were too tired from hiking (and maybe other activities we enjoyed to enhance the experience). Between the psychedelic rock formations and the natural beauty, Zion left us both wondering if maybe the rocks were speaking to us... or maybe it was just the desert heat. Either way, can’t wait to go back! ', '2024-08-01', '2024-08-04', 5, '2024-08-07 9:30', '2024-08-07 9:30', 'https://files.slack.com/files-tmb/T052X7BAZ-F08887679U5-d76a09bbab/image_720.png', 1, 1);
INSERT INTO `park_visit` (`id`, `user_id`, `park_id`, `title`, `remarks`, `start_date`, `end_date`, `rating`, `create_date`, `last_update`, `image_url`, `published`, `enabled`) VALUES (5, 4, 3, 'Eating sand at Great Sand Dunes National Park', 'Lots of sand! Got sand in my sandwich, which sucked. Some people were very helpful and told me not to bury my head in the sand, which I didn\'t do. Very beautiful! But sandy. The only escape from the sand was the visitor center. The dunes themselves are massive and it feels like you\'re in a different world, especially when the sun is setting. However, be prepared for the sand to get everywhere—your shoes, your clothes, even in your water bottle if you’re not careful. The sandboarding was a fun way to embrace the sand, though. Just make sure to bring a towel or something to wipe off afterward. The trails leading up to the dunes are scenic and easy to follow, but they get pretty hot in the afternoon, so early mornings or evenings are best. Definitely worth a visit, but maybe pack a snack that won’t get ruined by the wind!', '2024-04-19', '2024-04-21', 3, '2024-04-22 16:12', '2024-04-22 16:12', 'https://i0.wp.com/wanderwoman.online/wp-content/uploads/2021/01/DSC07915.jpg?resize=900%2C601&ssl=1', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `amenity_visit`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `amenity_visit` (`id`, `park_visit_id`, `amenity_id`, `remarks`, `rating`, `date_visited`, `create_date`, `last_update`, `enabled`) VALUES (1, 1, 1, 'test amenity_visit', 5, NULL, NULL, NULL, NULL);
INSERT INTO `amenity_visit` (`id`, `park_visit_id`, `amenity_id`, `remarks`, `rating`, `date_visited`, `create_date`, `last_update`, `enabled`) VALUES (2, 2, 2, 'The Fruita Campground was a great spot to camp during our visit to Capitol Reef. The sites are spacious, and being surrounded by the park’s stunning landscape made it an unforgettable experience. Plus, the proximity to the park’s main attractions is a huge bonus! ', 4, '2024-09-20', '2024-09-25 20:12', '2024-09-25 20:12', 1);
INSERT INTO `amenity_visit` (`id`, `park_visit_id`, `amenity_id`, `remarks`, `rating`, `date_visited`, `create_date`, `last_update`, `enabled`) VALUES (3, 2, 3, 'The Cassidy Arch Trail was a rewarding challenge! The hike up was steep at times, but reaching the arch and seeing the breathtaking views from the top made it all worth it. A must-do for anyone looking for a bit of adventure in Capitol Reef!', 5, '2024-09-22', '2024-09-25 20:15', '2024-09-25 20:15', 1);
INSERT INTO `amenity_visit` (`id`, `park_visit_id`, `amenity_id`, `remarks`, `rating`, `date_visited`, `create_date`, `last_update`, `enabled`) VALUES (4, 2, 4, 'The Gifford Homestead at Capitol Reef National Park is a charming stop with a glimpse into the park\'s agricultural past. I enjoyed learning about the history of the area while grabbing a fresh pie—definitely a tasty treat to enjoy after a hike! ', 4, '2024-09-25', '2024-09-25 20:21', '2024-09-25 20:21', 1);
INSERT INTO `amenity_visit` (`id`, `park_visit_id`, `amenity_id`, `remarks`, `rating`, `date_visited`, `create_date`, `last_update`, `enabled`) VALUES (5, 3, 5, 'We stayed at the Bryce Canyon Lodge and it was so wonderful and fancy! We felt just like that Jack Nicholson family that stayed in the hotel in the mountains! How romantic!', 5, '2024-06-17', '2024-06-20 8:45', '2024-06-20 8:45', 1);
INSERT INTO `amenity_visit` (`id`, `park_visit_id`, `amenity_id`, `remarks`, `rating`, `date_visited`, `create_date`, `last_update`, `enabled`) VALUES (6, 4, 6, 'The Watchman Campground is perfectly located near the entrance to Zion, making it super convenient for exploring the park. The sites are well-maintained, and we loved the views of the surrounding cliffs. The shuttle stop nearby was also a huge plus. However, we did find the campgrounds a bit crowded, especially during peak season, which made it harder to enjoy some peace and quiet. Still, if you\'re looking for convenience and proximity to the park\'s attractions, it’s a solid choice! ', 4, '2024-08-01', '2024-08-07 9:40', '2024-08-07 9:40', 1);
INSERT INTO `amenity_visit` (`id`, `park_visit_id`, `amenity_id`, `remarks`, `rating`, `date_visited`, `create_date`, `last_update`, `enabled`) VALUES (7, 4, 7, 'The Narrows is one of Zion\'s most iconic hikes, and for good reason. You’re wading through the Virgin River, surrounded by towering canyon walls—it\'s an unforgettable experience. We went in the late summer, so the water was nice and cool, though we did have to watch our footing on the slippery rocks. Definitely a must-do for anyone visiting Zion, but be prepared to get your feet wet (or more, depending on how adventurous you\'re feeling)!', 5, '2024-08-02', '2024-08-07 9:48', '2024-08-07 9:48', 1);
INSERT INTO `amenity_visit` (`id`, `park_visit_id`, `amenity_id`, `remarks`, `rating`, `date_visited`, `create_date`, `last_update`, `enabled`) VALUES (8, 4, 8, 'Angels Landing is not for the faint of heart, but the views from the top are totally worth the adrenaline rush. The hike is strenuous and involves some serious rock scrambling with chains to help along the exposed ridges. It was definitely intense, but once we reached the summit, the panoramic views of Zion were breathtaking. If you’re up for a challenge and have a head for heights, this trail is one you won’t forget!', 5, '2024-08-03', '2024-08-07 9:52', '2024-08-07 9:52', 1);
INSERT INTO `amenity_visit` (`id`, `park_visit_id`, `amenity_id`, `remarks`, `rating`, `date_visited`, `create_date`, `last_update`, `enabled`) VALUES (9, 4, 9, 'Let’s be honest: after a long hike through Zion, the last thing you want to do is cook your own food. Enter the Red Rock Grill, where you can refuel without having to battle the elements (or your own camp stove). The food isn’t going to win any Michelin stars, but it’ll certainly do the trick—especially if you’re as famished as I was after conquering the trails. The pizza was solid, and I’d give the salad a ‘good effort’ award. The real winner, though? The view. If you’ve ever wanted to eat a mediocre meal while basking in the glory of Zion’s cliffs, this is your spot. Just don’t expect your tastebuds to remember it the next day... but your Instagram will', 2, '2024-08-03', '2024-08-07 9:56', '2024-08-07 9:56', 1);
INSERT INTO `amenity_visit` (`id`, `park_visit_id`, `amenity_id`, `remarks`, `rating`, `date_visited`, `create_date`, `last_update`, `enabled`) VALUES (10, 5, 10, 'If you’re visiting Great Sand Dunes National Park, sandsledding is a must-do activity! I had an absolute blast gliding down the towering dunes. The sleds were easy to rent, and the staff at the rental shop outside the park gave great tips on how to steer and brake. The feeling of speeding down a giant sand slope is just exhilarating, and the views are breathtaking. The dunes themselves are incredibly fun to ride on—soft sand that allows you to pick up speed, but not so soft that you get stuck. I tried both standing and sitting on the sled, and each was a blast in its own way. The thrill of racing down a massive dune, with nothing but the desert around you, is an experience I’ll never forget. Be sure to bring some water and wear sunglasses—those dunes can be pretty sunny. Overall, sandsledding was the highlight of my trip, and I’d definitely do it again. Highly recommend it for anyone looking for an adrenaline rush!', 5, '2024-04-20', '2024-04-22 16:14', '2024-04-22 16:14', 1);
INSERT INTO `amenity_visit` (`id`, `park_visit_id`, `amenity_id`, `remarks`, `rating`, `date_visited`, `create_date`, `last_update`, `enabled`) VALUES (11, 5, 11, 'Be sure to stop at the visitor center to learn more about how geography shaped and continues to shape this park. The staff and rangers were most helpful and the visitor\'s center offered great views of the dunes, lots of educational displays about the dunes and a small store to buy shirts, cups, etc. - plus lots of parking.  There is a short interpretive loop at the visitor center which will interest those who enjoy botany and gardening. ', 5, '2024-04-19', '2024-04-22 16:20', '2024-4-22 16:20', 1);
INSERT INTO `amenity_visit` (`id`, `park_visit_id`, `amenity_id`, `remarks`, `rating`, `date_visited`, `create_date`, `last_update`, `enabled`) VALUES (12, 5, 12, 'The RV campground really is just a lot with hookup sites. What makes the area special is the views of the dunes. The store is really well stocked, the restaurant is clean and serves up good food. The campground restrooms are clean. Oasis is also the best place to rent sand sleds and boards. Reasonable prices and they have plenty. Provide wax and explain what to do. Only complaint was the long slow line… probably waited 30-40 minutes at about 9am. Still easy though due to close proximity to park. Just allow extra time to wait in the morning. Also go early and bring socks because that sand gets hot in the sun very quickly!', 3, '2024-04-19', '2024-04-22 16:24', '2024-04-22 16:24', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `amenity_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (1, 'Visitor\'s Center', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwaOk4KOnAvSPHgC1K5A1d9Pqm9-8GxyJNNA&s');
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (2, 'Hotel', NULL, 'https://cdn11.bigcommerce.com/s-kh80nbh17m/images/stencil/500x659/products/2578/13489/52175357-A9D8-493E-88D7-7C897DA6EA0F-xl__42568.1577379197.jpg?c=2');
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (3, 'Food', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDbH-ka3RdsuFSHDBOKkOfQN-tE2TXZYKAnA&s');
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (4, 'Campground', NULL, 'https://i.pinimg.com/736x/34/6e/f1/346ef163776b9e85998661620411e1b5.jpg');
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (5, 'RV Park', NULL, 'https://i.pinimg.com/originals/c9/30/95/c930952d1498a4d4bebcfd2f351f63ba.png');
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (6, 'Cabin', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-ujDZrbglUNgdy-GOx3-W0KYg4xtbDl62CQ&s');
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (7, 'Restroom', NULL, 'https://cdn11.bigcommerce.com/s-kh80nbh17m/images/stencil/1280x1280/products/2559/13411/E77FEB01-BC9A-4401-BD33-989D94128194-xl__75698.1577374548.jpg?c=2');
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (8, 'Landmark', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU2kGO4Gpu4plfqVMyBPQ0w5_VxksuhHkBKQ&s');
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (9, 'Fishing', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1yn87M4Jwujh7QmoSwpzDl1lIY2MMsZw9XA&s');
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (10, 'Guided Tour', NULL, 'https://www.shutterstock.com/image-vector/vector-graphic-sign-indicating-hiking-600nw-2422428693.jpg');
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (11, 'Hiking', NULL, 'https://www.shutterstock.com/image-vector/vector-graphic-sign-indicating-hiking-600nw-2422428691.jpg');
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (12, 'Horseback Riding', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaV0QGTAsLosw_r5n5Wsm0Y0TBfiwlehPk5Q&s');
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (13, 'Rock Climbing', NULL, 'https://www.shutterstock.com/image-illustration/brown-square-us-parks-recreation-260nw-1019645.jpg');
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (14, 'Biking', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsJqvJ0BG9TVJ1uUg9VVIZtkGh_L44zf9TPjtK7sZ9dFxpKvapP6jhrcdGlbTMlMwVLfM&usqp=CAU');
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (15, 'Ranger Station', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXHv3hj-lxjrRx3eukx0kSZcBVshGt9x8WKw&s');
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (16, 'Swimming', NULL, 'https://cdn11.bigcommerce.com/s-kh80nbh17m/images/stencil/500x659/products/2584/13514/9379E5FA-A2F9-450D-8B29-D626467D43AD-xl__10560.1561676118.gif?c=2');
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (17, 'Giftshop/Museum', NULL, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_3rfGTa0FRJ118ldpANlPRm-gEZA-0VZ4QQ&s');
INSERT INTO `amenity_category` (`id`, `name`, `description`, `image_url`) VALUES (18, 'Other Activity', NULL, 'https://cdn11.bigcommerce.com/s-1mxugrbmxo/images/stencil/190x190/products/533/820/RS-127__74577.1599835544.png?c=1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `amenity_has_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `amenity_has_category` (`amenity_id`, `amenity_category_id`) VALUES (1, 1);
INSERT INTO `amenity_has_category` (`amenity_id`, `amenity_category_id`) VALUES (2, 4);
INSERT INTO `amenity_has_category` (`amenity_id`, `amenity_category_id`) VALUES (3, 11);
INSERT INTO `amenity_has_category` (`amenity_id`, `amenity_category_id`) VALUES (4, 17);
INSERT INTO `amenity_has_category` (`amenity_id`, `amenity_category_id`) VALUES (5, 2);
INSERT INTO `amenity_has_category` (`amenity_id`, `amenity_category_id`) VALUES (6, 4);
INSERT INTO `amenity_has_category` (`amenity_id`, `amenity_category_id`) VALUES (7, 11);
INSERT INTO `amenity_has_category` (`amenity_id`, `amenity_category_id`) VALUES (8, 11);
INSERT INTO `amenity_has_category` (`amenity_id`, `amenity_category_id`) VALUES (9, 3);
INSERT INTO `amenity_has_category` (`amenity_id`, `amenity_category_id`) VALUES (10, 18);
INSERT INTO `amenity_has_category` (`amenity_id`, `amenity_category_id`) VALUES (11, 1);
INSERT INTO `amenity_has_category` (`amenity_id`, `amenity_category_id`) VALUES (12, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `park_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `park_comment` (`id`, `user_id`, `park_id`, `in_reply_to_id`, `comment`, `create_date`, `last_update`, `enabled`) VALUES (1, 1, 1, NULL, 'first comment', NULL, NULL, NULL);
INSERT INTO `park_comment` (`id`, `user_id`, `park_id`, `in_reply_to_id`, `comment`, `create_date`, `last_update`, `enabled`) VALUES (2, 2, 1, 1, 'in reply to comment', NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `park_visit_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `park_visit_comment` (`id`, `user_id`, `park_visit_id`, `in_reply_to_id`, `comment`, `create_date`, `last_update`, `enabled`) VALUES (1, 2, 1, NULL, 'Rocky Mountain sunsets are unbeatable. Did you catch any while you were there?', '2024-10-15 12:10', '2024-10-14 12:10', 1);
INSERT INTO `park_visit_comment` (`id`, `user_id`, `park_visit_id`, `in_reply_to_id`, `comment`, `create_date`, `last_update`, `enabled`) VALUES (2, 4, 1, 1, 'Hi Lisa, yes we did - they were incredible (photos uploaded)!', '2024-10-18 9:36', '2024-10-18 9:36', 1);
INSERT INTO `park_visit_comment` (`id`, `user_id`, `park_visit_id`, `in_reply_to_id`, `comment`, `create_date`, `last_update`, `enabled`) VALUES (3, 2, 1, 2, 'Beautiful pictures, Steve!!', '2024-10-18 13:20', '2024-10-18 13:20', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `park_visit_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (1, 1, 'https://koa.com/blog/images/mills-lake-rocky-mountain-national-park.jpg?preset=blogPhoto', 'Hiking around Bear Lake', '2024-10-15 12:32', '2024-10-15 12:32');
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (2, 1, 'https://gdb.voanews.com/16587b16-4a14-4f9f-abd2-95adefcf357e_cx0_cy2_cw0_w1200_r1.jpg', 'We even saw some Big Horned Sheep!', '2024-10-15 12:36', '2024-10-15 12:36');
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (3, 1, 'https://www.imagesofrmnp.com/images/xl/Tree-Line-Treasure.jpg', 'Sunset at RMNP', '2024-10-18 13:15', '2024-10-18 13:15');
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (4, 2, 'https://files.slack.com/files-tmb/T052X7BAZ-F087WEYCLFR-8000b875d8/image_720.png', 'Fruit campground', '2024-09-25 20:25', '2024-09-25 20:25');
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (5, 2, 'https://files.slack.com/files-tmb/T052X7BAZ-F088DGGPT7E-99bd292a1b/image_720.png', 'Cassidy Arch Trail', '2024-09-25 20:27', '2024-09-25 20:27');
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (6, 2, 'https://files.slack.com/files-tmb/T052X7BAZ-F088DGJ7220-569048c476/image_720.png', 'Gifford Homestead', '2024-09-25 20:28', '2024-09-25 20:28');
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (7, 3, 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2e/75/7b/0d/caption.jpg?w=1200&h=-1&s=1', 'We made it!', '2024-06-20 8:55', '2024-06-20 8:55');
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (8, 3, 'https://travel.usnews.com/images/Jon_Hicks.jpg', 'Stargazing night #1', '2024-06-20 8:56', '2024-06-20 8:56');
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (9, 3, 'https://home.nps.gov/common/uploads/cropped_image/primary/B80F0795-A5AB-8CE3-5EE347AAC7AB58AE.jpg?width=1300&quality=90&mode=crop', 'Stargazing night #2', '2024-06-20 8:57', '2024-06-20 8:57');
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (10, 4, 'https://files.slack.com/files-tmb/T052X7BAZ-F088ZSG3HAL-e33322d947/image_720.png', 'Watchman campground, Zion NP', '2024-08-07 9:42', '2024-08-07 9:42');
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (11, 4, 'https://files.slack.com/files-tmb/T052X7BAZ-F088ZSLNCG0-156f01a289/image_720.png', 'Wading in the Narrows', '2024-08-07 9:49', '2024-08-07 9:49');
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (12, 4, 'https://files.slack.com/files-tmb/T052X7BAZ-F087WGE3NUX-3ded60994c/image_480.png', 'Angels Landing hike', '2024-08-07 9:52', '2024-08-07 9:52');
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (13, 4, 'https://files.slack.com/files-tmb/T052X7BAZ-F0884DZMHAS-5e4d69542d/image_720.png', 'Grabbing a beer and enjoying the views at Red Rock Grill', '2024-08-07 9:56', '2024-08-07 9:56');
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (14, 5, 'https://wanderthemap.com/wp-content/uploads/2015/11/MG_4380.jpg', 'Sandboarding the Great Sand Dunes', '2024-04-22 16:18', '2024-04-22 16:18');
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (15, 5, 'https://s3-media0.fl.yelpcdn.com/bphoto/dFPwzY8wuy2ZeMfv_HUuXg/348s.jpg', 'Oasis RV park', '2024-04-22 16:30', '2024-04-22 16:30');

COMMIT;


-- -----------------------------------------------------
-- Data for table `wishlist_park`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `wishlist_park` (`user_id`, `park_id`) VALUES (3, 2);
INSERT INTO `wishlist_park` (`user_id`, `park_id`) VALUES (3, 9);
INSERT INTO `wishlist_park` (`user_id`, `park_id`) VALUES (4, 9);
INSERT INTO `wishlist_park` (`user_id`, `park_id`) VALUES (4, 1);
INSERT INTO `wishlist_park` (`user_id`, `park_id`) VALUES (4, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `followed_user`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `followed_user` (`user_id`, `followed_user_id`) VALUES (1, 2);
INSERT INTO `followed_user` (`user_id`, `followed_user_id`) VALUES (2, 1);
INSERT INTO `followed_user` (`user_id`, `followed_user_id`) VALUES (2, 3);
INSERT INTO `followed_user` (`user_id`, `followed_user_id`) VALUES (2, 4);
INSERT INTO `followed_user` (`user_id`, `followed_user_id`) VALUES (3, 2);
INSERT INTO `followed_user` (`user_id`, `followed_user_id`) VALUES (3, 4);
INSERT INTO `followed_user` (`user_id`, `followed_user_id`) VALUES (4, 3);
INSERT INTO `followed_user` (`user_id`, `followed_user_id`) VALUES (4, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `amenity_visit_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `amenity_visit_comment` (`id`, `user_id`, `amenity_visit_id`, `in_reply_to_id`, `comment`, `create_date`, `last_update`, `enabled`) VALUES (1, 1, 2, NULL, 'Thanks for this great review, Lisa!', NULL, NULL, 1);

COMMIT;

