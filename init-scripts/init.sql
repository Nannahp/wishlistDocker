CREATE DATABASE IF NOT EXISTS DreamCloud;
USE DreamCloud;

GRANT SELECT, INSERT, UPDATE, DELETE ON DreamCloud.* TO 'admin'@'%';


DROP TABLE IF EXISTS profile;
CREATE TABLE profile (
                         profile_username VARCHAR(255) UNIQUE PRIMARY KEY NOT NULL,
                         profile_firstname VARCHAR(255) NOT NULL,
                         profile_lastname VARCHAR(255) NOT NULL,
                         profile_password VARCHAR(255) NOT NULL,
                         profile_picture LONGBLOB
);

DROP TABLE IF EXISTS wishlist;
CREATE TABLE wishlist (
                          wishlist_id INT AUTO_INCREMENT PRIMARY KEY,
                          wishlist_title VARCHAR(255) NOT NULL,
                          wishlist_description VARCHAR(255),
                          profile_username VARCHAR(255),
                          FOREIGN KEY (profile_username) REFERENCES profile(profile_username) ON DELETE CASCADE
);

DROP TABLE IF EXISTS wish;
CREATE TABLE wish (
                      wish_id INT AUTO_INCREMENT PRIMARY KEY,
                      wish_name VARCHAR(255) NOT NULL,
                      wish_description VARCHAR(255),
                      wish_price double NOT NULL,
                      wish_picture LONGBLOB,
                      wishlist_id INT,
                      FOREIGN KEY (wishlist_id) REFERENCES wishlist(wishlist_id) ON DELETE CASCADE
);

CREATE TABLE reservation (
                             reservation_id INT AUTO_INCREMENT PRIMARY KEY,
                             wish_id INT,
                             profile_username VARCHAR(255),
                             FOREIGN KEY (wish_id) REFERENCES wish(wish_id) ON DELETE CASCADE,
                             FOREIGN KEY (profile_username) REFERENCES profile(profile_username) ON DELETE CASCADE
);

INSERT INTO profile (profile_firstname, profile_lastname, profile_username, profile_password) VALUES
                                                                                                  ('John', 'Doe', 'john_doe', 'password123'),
                                                                                                  ('Alice', 'Smith', 'alice_smith', 'password456');


INSERT INTO wishlist (wishlist_title, wishlist_description, profile_username) VALUES
                                                                                  ('Birthday Wishlist', 'Items I want for my birthday', 'john_doe'),
                                                                                  ('Holiday Wishlist', 'Things to bring for my holiday trip', 'john_doe'),
                                                                                  ('Gift Ideas', 'Ideas for gifts to buy for friends', 'alice_smith'),
                                                                                  ('Home Improvement', 'Items to improve my home', 'alice_smith');

INSERT INTO wish (wish_name, wish_description, wish_price,  wishlist_id)
VALUES
    ('Smartphone', 'iPhone 12 Pro', 6666.63, 1),
    ('Wireless Headphones', 'Sony WH-1000XM4', 2449.34, 1),
    ('Travel Backpack', 'Osprey Farpoint 40', 1115.92, 2),
    ('Portable Charger', 'Anker PowerCore 10000', 209.93, 2),
    ('Books', 'Bestsellers for reading', 333.25, 3),
    ('Perfume', 'Chanel No. 5', 666.63, 3),
    ('Tool Set', 'Stanley 65 Piece Tool Kit', 599.92, 4),
    ('Indoor Plants', 'Assorted indoor plants', 225.00, 4);


INSERT INTO reservation (wish_id, profile_username)
VALUES
    (2, 'alice_smith'),
    (4, 'alice_smith'),
    (6, 'john_doe'),
    (8, 'john_doe');




