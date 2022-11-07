SET foreign_key_checks = 0;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `trackables`;
DROP TABLE IF EXISTS `entries`;
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
    `active` TINYINT(1) NOT NULL
);

CREATE TABLE `entries`(
    `id` INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `trackable_id` INT UNSIGNED NOT NULL,
    `date` DATE NOT NULL,
    `boolean_value` TINYINT(1) NULL,
    `quantitative_value` DOUBLE(8, 2) NULL
);

ALTER TABLE
    `trackables` ADD CONSTRAINT `trackables_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `entries` ADD CONSTRAINT `boolean_entries_trackable_id_foreign` FOREIGN KEY(`trackable_id`) REFERENCES `trackables`(`id`)
    ON DELETE CASCADE;



INSERT INTO users (name, email)
VALUES
    ('Vicky', 'vicky@test.com'),
    ('Bjork', 'bjork@test.com');

INSERT INTO trackables (user_id, name, type, unit, color, active)
VALUES
    (1, "Meditation", "boolean", null, "grey", 1),
    (1, "Weight", "quantitative", "kg", "pink", 1),
    (1, "Zumba", "boolean", null, "green", 1),
    (1, "Dessert", "boolean", null, "black", 0),
    (1, "Waist", "quantitative", "cm", "yellow", 1),
    (1, "Bloating", "boolean", null, "blue", 1),
    (2, "Bloating", "boolean", null, "blue", 1);

INSERT INTO entries (trackable_id, date, boolean_value, quantitative_value)
VALUES
    (2, '2022-10-26' , null, 75.0),
    (3, '2022-10-26', null, 68),
    (2, '2022-10-31', null, 75.4),
    (3, '2022-10-31', null, 67.5),
    (1, '2022-10-26', 1, null),
    (3, '2022-10-26', 1, null),
    (4, '2022-10-26', 1, null),
    (6, '2022-10-27', 1, null),
    (1, '2022-10-27', 0, null),
    (4, '2022-10-27', 0, null);