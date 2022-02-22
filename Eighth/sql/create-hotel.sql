DROP database IF EXISTS hotel;

CREATE database hotel;

USE hotel;

CREATE TABLE users (
                       id INT PRIMARY KEY auto_increment,
                       name VARCHAR(50),
                       email VARCHAR(50) UNIQUE,
                       password VARCHAR(20) NOT NULL,
                       phone VARCHAR(20)
);


CREATE TABLE rooms (
                       id INT PRIMARY KEY auto_increment,
                       number INT(10) UNIQUE ,
                       capacity INT(20),
                       class VARCHAR(50),
                       price VARCHAR(20),
                       status VARCHAR(20)
);

CREATE TABLE bookings (
                          id INT PRIMARY KEY auto_increment,
                          room_id INT REFERENCES rooms(id) on delete cascade,
                          user_id INT REFERENCES users(id) on delete cascade,
                          date1 DATE,
                          date2 DATE,
                          status VARCHAR(20),
                          expire DATETIME
);

CREATE TABLE orders (
                          id INT PRIMARY KEY auto_increment,
                          user_id INT REFERENCES users(id) on delete cascade,
                          capacity INT(20),
                          class VARCHAR(50),
                          date1 DATE,
                          date2 DATE,
                          status VARCHAR(20)
);

INSERT INTO users VALUES (DEFAULT, 'alex ivanov', 'ivanov@gmail.com', 'ivan', 1234567890);
INSERT INTO users VALUES (DEFAULT, 'andrey alekseev', 'alekseev@gmail.com', 'alex', 5555555555);

INSERT INTO rooms VALUES (DEFAULT, 101, 2, 'standard', '100$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 102, 3, 'standard', '120$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 103, 2, 'standard', '100$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 104, 3, 'standard', '120$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 105, 4, 'standard', '135$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 106, 5, 'standard', '150$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 107, 4, 'standard', '135$', 'booked');
INSERT INTO rooms VALUES (DEFAULT, 108, 5, 'standard', '150$', 'booked');
INSERT INTO rooms VALUES (DEFAULT, 109, 4, 'standard', '135$', 'occupied');
INSERT INTO rooms VALUES (DEFAULT, 110, 3, 'standard', '120$', 'occupied');
INSERT INTO rooms VALUES (DEFAULT, 111, 2, 'standard', '100$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 112, 3, 'standard', '120$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 113, 2, 'standard', '100$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 114, 3, 'standard', '120$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 115, 4, 'standard', '135$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 116, 5, 'standard', '150$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 117, 4, 'standard', '135$', 'booked');
INSERT INTO rooms VALUES (DEFAULT, 118, 5, 'standard', '150$', 'booked');
INSERT INTO rooms VALUES (DEFAULT, 119, 4, 'standard', '135$', 'occupied');
INSERT INTO rooms VALUES (DEFAULT, 120, 3, 'standard', '120$', 'occupied');

INSERT INTO rooms VALUES (DEFAULT, 201, 3, 'comfort', '200$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 202, 3, 'comfort', '200$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 203, 2, 'comfort', '180$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 204, 3, 'comfort', '200$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 205, 4, 'comfort', '220$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 206, 5, 'comfort', '240$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 207, 4, 'comfort', '220$', 'booked');
INSERT INTO rooms VALUES (DEFAULT, 208, 5, 'comfort', '240$', 'booked');
INSERT INTO rooms VALUES (DEFAULT, 209, 4, 'comfort', '220$', 'occupied');
INSERT INTO rooms VALUES (DEFAULT, 210, 3, 'comfort', '200$', 'occupied');

INSERT INTO rooms VALUES (DEFAULT, 301, 3, 'premium', '300$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 302, 5, 'premium', '400$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 303, 2, 'premium', '270$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 304, 3, 'premium', '300$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 305, 4, 'premium', '350$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 306, 5, 'premium', '400$', 'available');
INSERT INTO rooms VALUES (DEFAULT, 307, 4, 'premium', '350$', 'booked');
INSERT INTO rooms VALUES (DEFAULT, 308, 5, 'premium', '400$', 'booked');
INSERT INTO rooms VALUES (DEFAULT, 309, 4, 'premium', '350$', 'occupied');
INSERT INTO rooms VALUES (DEFAULT, 310, 3, 'premium', '300$', 'occupied');

INSERT INTO bookings VALUES (DEFAULT, 18, 1, '2022-02-09', '2022-02-16', 'paid', '2022-02-09 08:12:17');
INSERT INTO bookings VALUES (DEFAULT, 20, 1, '2022-03-01', '2022-03-21', 'not paid', '2022-02-19 23:12:17');
INSERT INTO bookings VALUES (DEFAULT, 19, 1, '2022-02-09', '2022-02-16', 'not paid', '2022-02-15 21:15:10');
INSERT INTO bookings VALUES (DEFAULT, 17, 2, '2022-03-01', '2022-03-21', 'not paid', '2022-02-15 22:40:55');

INSERT INTO orders VALUES (DEFAULT, 1, 3, 'standard', '2022-02-16', '2022-02-23', 'wait');
INSERT INTO orders VALUES (DEFAULT, 1, 4, 'standard', '2022-02-21', '2022-02-28', 'processed');
INSERT INTO orders VALUES (DEFAULT, 2, 3, 'standard', '2022-02-16', '2022-02-23', 'wait');
INSERT INTO orders VALUES (DEFAULT, 2, 4, 'standard', '2022-02-21', '2022-02-28', 'processed');