SET foreign_key_checks = 0;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `trackables`;
DROP TABLE IF EXISTS `boolean_entries`;
DROP TABLE IF EXISTS `quantitative_entries`;
SET foreign_key_checks = 1;

CREATE TABLE `users`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL
);

CREATE TABLE `trackables`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `unit` VARCHAR(255),
    `color` VARCHAR(255) NOT NULL,
    `icon` VARCHAR(255) NOT NULL,
    `active` TINYINT(1) NOT NULL
);

CREATE TABLE `boolean_entries`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `trackable_id` INT UNSIGNED NOT NULL,
    `date` DATE NOT NULL,
    `value` TINYINT(1) NOT NULL
);

CREATE TABLE `quantitative_entries`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `trackable_id` INT UNSIGNED NOT NULL,
    `date` DATE NOT NULL,
    `value` DOUBLE(8, 2) NOT NULL
);

ALTER TABLE
    `trackables` ADD CONSTRAINT `trackables_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `boolean_entries` ADD CONSTRAINT `boolean_entries_trackable_id_foreign` FOREIGN KEY(`trackable_id`) REFERENCES `trackables`(`id`);
ALTER TABLE
    `quantitative_entries` ADD CONSTRAINT `quantitative_entries_trackable_id_foreign` FOREIGN KEY(`trackable_id`) REFERENCES `trackables`(`id`);

INSERT INTO users (name, email)
VALUES
    ('Vicky', 'vicky@test.com'),
    ('Bjork', 'bjork@test.com');

INSERT INTO trackables (user_id, name, type, unit, color, icon, active)
VALUES
    (1, "Meditation", "boolean", null, "grey", "any", 1),
    (1, "Weight", "quantitative", "kg", "pink", "any", 1),
    (1, "Zumba", "boolean", null, "green", "any", 1),
    (1, "Dessert", "boolean", null, "black", "any", 0),
    (1, "Waist", "quantitative", "cm", "yellow", "any", 1),
    (1, "Bloating", "boolean", null, "blue", "any", 1);

INSERT INTO quantitative_entries (trackable_id, date, value)
VALUES
    (2, '2022-10-26' , 75.0),
    (3, '2022-10-26', 68),
    (2, '2022-10-31', 75.4),
    (3, '2022-10-31', 67.5);

INSERT INTO boolean_entries (trackable_id, date, value)
VALUES
    (1, '2022-10-26' , 1),
    (3, '2022-10-26', 1),
    (4, '2022-10-26', 1),
    (6, '2022-10-27', 1),
    (1, '2022-10-27', 0),
    (4, '2022-10-27', 0);