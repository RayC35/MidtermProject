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
  `rating` INT NULL,
  `comment` TEXT NULL,
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
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image_url`, `create_date`, `last_update`, `email`, `biography`) VALUES (3, 'mosquitoSlayer', 'buffy', 1, 'user', 'Buffy', 'Hua', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG_fGOGFth1yhdgHTy2PjOWmSvHREtSgiDPQ&s', '2025-01-12 13:29', '2025-01-12 13:29', 'buffy.hua@sdvid.com', 'Hi, I’m Buffy Hua, your go-to expert on dodging mosquitoes while pretending to be one with nature. I’ve hiked, camped, and occasionally tripped my way through countless national parks, all in the name of \"adventure.\" Whether I’m outrunning raccoons for my snacks or getting lost on \"clearly marked\" trails, I’m here for the views, the fresh air, and the never-ending quest for the perfect s’more.\n\n\n\n\n\n');
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `first_name`, `last_name`, `image_url`, `create_date`, `last_update`, `email`, `biography`) VALUES (4, 'scrambledSteve', 'steve', 1, 'user', 'Steve', 'Striker', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFaDhcLu-sEeSmV46-m49v92UmaGm2K77C-Q&s', '2025-01-12 13:35', '2025-01-12 13:35', 'steve.striker@sdvid.com', 'Hi! I love our natural outdoor world. Ever since I left New Jersey, I\'ve been obsessed with going places where I can\'t see any skyscrapers or apartment buildings. If anyone wants to join me while I scramble up some mountain peaks, drop me a line!');

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
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (6, 'Bryce Canyon', 'Bryce Canyon National Park in Southwestern Utah is famous for the largest collection of hoodoos—the distinctive rock formations at Bryce—in the world. Bryce Canyon is also home to horseshoe-shaped amphitheaters carved from the eastern edge of the Paunsaugunt Plateau, scenic vistas, and the dark night sky.', 37.593048, -112.187332, 'UT', '00:00', '24:00', 35.00, 'https://www.nps.gov/brca/', 'https://www.nps.gov/common/uploads/grid_builder/brca/crop16_9/D5D625F9-B5BD-D3E6-70C0B2253AF8B804.jpg?width=640&quality=90&mode=crop');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (7, 'Canyonlands', 'Canyonlands invites you to explore a wilderness of countless canyons and fantastically formed buttes carved by the Colorado River and its tributaries. Rivers divide the park into four districts: Island in the Sky, The Needles, The Maze, and the rivers themselves. These areas share a primitive desert atmosphere, but each offers different opportunities for sightseeing and adventure.', 38.23399, -109.94958, 'UT', '00:00', '24:00', 30.00, 'https://www.nps.gov/cany/', 'https://www.nps.gov/npgallery/GetAsset/11fdddf9-b081-469a-8de7-7ac8c0e03062/proxy/lores');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (8, 'Capitol Reef', 'The unifying geographic feature of Capitol Reef is the Waterpocket Fold. For a hundred miles its parallel ridges rise from the desert like the swell of giant waves rolling toward shore. Exposed edges of the uplift have eroded into a slickrock wilderness of massive domes, cliffs, and a maze of twisting canyons.', 38.089600, -111.149910, 'UT', '00:00', '24:00', 20.00, 'https://www.nps.gov/CARE', 'https://www.nps.gov/npgallery/GetAsset/a2ddcd9b-1dd8-b71b-0bb3-4fccb2bd656a/proxy/lores');
INSERT INTO `park` (`id`, `name`, `description`, `main_entrance_latitude`, `main_entrance_longitude`, `state_abbreviation`, `opening_time`, `closing_time`, `entry_fee`, `website_url`, `image_url`) VALUES (9, 'Zion', 'Within its 232 square miles are high plateaus, a maze of narrow, deep, sandstone canyons, and the Virgin River and its tributaries. Zion also has 2,000-foot Navajo Sandstone cliffs, pine- and juniper-clad slopes, and seeps, springs, and waterfalls supporting lush and colorful hanging gardens.', 37.297817, -113.028770, 'UT', '00:00', '24:00', 35.00, 'https://www.nps.gov/zion', 'https://www.nps.gov/zion/learn/photosmultimedia/images/Winter.jpg?maxwidth=650&autorotate=false&quality=78&format=webp');

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
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (3, 3);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (4, 2);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (4, 4);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (4, 6);
INSERT INTO `favorite_park` (`user_id`, `park_id`) VALUES (4, 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `amenity`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `amenity` (`id`, `name`, `park_id`, `description`, `cost_range`, `image_url`, `website_url`, `latitude`, `longitude`, `enabled`, `create_date`, `last_update`) VALUES (1, 'Beaver Meadows Visitor Center', 1, 'Beaver Meadows Visitor Center is open year-round. This visitor center is located on the east side of RMNP near the town of Estes Park, along U.S. Highway 36 approximately 1 mile east of the Beaver Meadows Entrance to RMNP. Inside the visitor center, meet with park staff, enjoy the park\'s movie, and visit the Rocky Mountain Conservancy Nature Store.\n\n\n', 0, 'https://files.slack.com/files-tmb/T052X7BAZ-F088ZNTFSKA-f446fc57d2/image_720.png', 'https://www.nps.gov/romo/bm_visitor_center.htm', 40.2158, 105.3339, 1, '2025-01-10 10:36', '2025-01-10 10:36');

COMMIT;


-- -----------------------------------------------------
-- Data for table `park_visit`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `park_visit` (`id`, `user_id`, `park_id`, `title`, `remarks`, `start_date`, `end_date`, `rating`, `create_date`, `last_update`, `image_url`, `published`, `enabled`) VALUES (1, 3, 1, 'Fall at RMNP!', 'fall getaway with my boo', '2024-10-11', '2024-10-14', 5, '2024-10-15 12:05', '2024-10-15 12:05', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2d/d5/4d/f0/caption.jpg?w=1200&h=-1&s=1', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `amenity_visit`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `amenity_visit` (`id`, `park_visit_id`, `amenity_id`, `rating`, `comment`, `date_visited`, `create_date`, `last_update`, `enabled`) VALUES (1, 1, 1, 5, 'test amenity_visit', NULL, NULL, NULL, NULL);

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
INSERT INTO `park_comment` (`id`, `user_id`, `park_id`, `in_reply_to_id`, `comment`, `create_date`, `last_update`, `enabled`) VALUES (1, 1, 1, NULL, 'first comment', NULL, NULL, NULL);
INSERT INTO `park_comment` (`id`, `user_id`, `park_id`, `in_reply_to_id`, `comment`, `create_date`, `last_update`, `enabled`) VALUES (2, 2, 1, 1, 'in reply to comment', NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `park_visit_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `park_visit_comment` (`id`, `user_id`, `park_visit_id`, `in_reply_to_id`, `comment`, `create_date`, `last_update`, `enabled`) VALUES (1, 3, 1, NULL, 'Rocky Mountain National Park is absolutely majestic! A wonderful display of colorful meadows, evergreen forests, alpine tundra far above the tree line, numerous superb hiking trails, stunning clear mountain lakes, spectacular drives, and up-close encounters with impressive wildlife! We enjoyed every minute of the three days we spent exploring RMNP.\n\nYes, you do need a timed permit during the Parks\' busy season. If you do your homework, you are prepared. The permits were easy to acquire if you got on the website about a month in advance. No permit needed the rest of the year, though (Oct 20th)!', '2024-10-15 12:10', '2024-10-14 12:10', 1);
INSERT INTO `park_visit_comment` (`id`, `user_id`, `park_visit_id`, `in_reply_to_id`, `comment`, `create_date`, `last_update`, `enabled`) VALUES (2, 2, 1, 1, 'Rocky Mountain sunsets are unbeatable. Did you catch any while you were there?', '2024-10-18 9:36', '2024-10-18 9:36', 1);
INSERT INTO `park_visit_comment` (`id`, `user_id`, `park_visit_id`, `in_reply_to_id`, `comment`, `create_date`, `last_update`, `enabled`) VALUES (3, 3, 1, 2, 'Hi Lisa, yes we did - they were incredible (photos uploaded)!', '2024-10-18 13:20', '2024-10-18 13:20', 1);
INSERT INTO `park_visit_comment` (`id`, `user_id`, `park_visit_id`, `in_reply_to_id`, `comment`, `create_date`, `last_update`, `enabled`) VALUES (4, 2, 1, 3, 'Beautiful pictures, Steve!!', '2024-10-18 19:02', '2024-10-18 19:02', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `park_visit_image`
-- -----------------------------------------------------
START TRANSACTION;
USE `nationalparksdb`;
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (1, 1, 'https://koa.com/blog/images/mills-lake-rocky-mountain-national-park.jpg?preset=blogPhoto', 'Hiking around Bear Lake', '2024-10-15 12:32', '2024-10-15 12:32');
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (2, 1, 'https://gdb.voanews.com/16587b16-4a14-4f9f-abd2-95adefcf357e_cx0_cy2_cw0_w1200_r1.jpg', 'We even saw some Big Horned Sheep!', '2024-10-15 12:36', '2024-10-15 12:36');
INSERT INTO `park_visit_image` (`id`, `park_visit_id`, `image_url`, `description`, `create_date`, `last_update`) VALUES (3, 1, 'https://www.imagesofrmnp.com/images/xl/Tree-Line-Treasure.jpg', 'Sunset at RMNP', '2024-10-18 13:15', '2024-10-18 13:15');

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
INSERT INTO `amenity_visit_comment` (`id`, `user_id`, `amenity_visit_id`, `in_reply_to_id`, `comment`, `create_date`, `last_update`, `enabled`) VALUES (1, 1, 1, NULL, 'test amenity_visit_comment', NULL, NULL, NULL);

COMMIT;

