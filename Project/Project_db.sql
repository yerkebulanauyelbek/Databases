CREATE TABLE customers(
    customer_id INTEGER PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    city VARCHAR(40) NOT NULL,
    street VARCHAR(255) NOT NULL,
    house INTEGER NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE package(
    package_id INTEGER PRIMARY KEY,
    sender_id INTEGER REFERENCES customers(customer_id) NOT NULL,
    package_desc VARCHAR(255),
    hazard BOOLEAN NOT NULL,
    send_date_time TIMESTAMP NOT NULL,
    ship_price INTEGER NOT NULL
);

CREATE TABLE location(
    location_code INTEGER NOT NULL ,
    pack_id INTEGER REFERENCES package(package_id) PRIMARY KEY,
    country VARCHAR(40) NOT NULL,
    city VARCHAR(30) NOT NULL,
    arr_date_time TIMESTAMP,
    executed BOOLEAN NOT NULL
);

CREATE TABLE shipment(
    pack_id INTEGER PRIMARY KEY REFERENCES package(package_id),
    sender_id INTEGER NOT NULL REFERENCES customers(customer_id),
    recipient_id INTEGER NOT NULL
);

CREATE TABLE payment_data(
    card_number VARCHAR(19) PRIMARY KEY,
    payment_system VARCHAR(20) NOT NULL,
    cust_id INTEGER references customers(customer_id) NOT NULL,
    card_name VARCHAR(255) NOT NULL,
    card_exp VARCHAR(5),
    cvv_code INTEGER
);

CREATE TABLE bank(
  iban VARCHAR(34) PRIMARY KEY,
  client_name VARCHAR(255) NOT NULL,
  cust_id INTEGER references customers(customer_id) NOT NULL
);

CREATE TABLE warehouse(
    wh_id INTEGER NOT NULL,
    pack_id INTEGER REFERENCES package(package_id) PRIMARY KEY,
    wh_phone VARCHAR(20) NOT NULL,
    wh_address VARCHAR(255) NOT NULL,
    arr_time1 TIMESTAMP NOT NULL
);

CREATE TABLE plane(
    plane_id INTEGER NOT NULL,
    pack_id INTEGER REFERENCES package(package_id) PRIMARY KEY,
    flight_code VARCHAR(5) NOT NULL,
    arr_time2 TIMESTAMP NOT NULL
);

CREATE TABLE truck(
    truck_id INTEGER NOT NULL,
    pack_id INTEGER REFERENCES package(package_id) PRIMARY KEY,
    route_code VARCHAR(5) NOT NULL,
    status VARCHAR(20) NOT NULL,
    arr_time3 TIMESTAMP
);


INSERT INTO customers (customer_id, customer_name, city, street, house, phone) VALUES (1, 'Jangir Tolysbayev', 'Almaty', 'Rozybakiyev', 120, '+7 777 987 12 21');
INSERT INTO customers (customer_id, customer_name, city, street, house, phone) VALUES (2, 'Kurman Shamyran', 'Karagandy', 'Yerubayev', 20, '+7 778 402 41 29');
INSERT INTO customers (customer_id, customer_name, city, street, house, phone) VALUES (5, 'Azamat Murat', 'Astana', 'Dostyk', 205, '+7 701 679 54 65');
INSERT INTO customers (customer_id, customer_name, city, street, house, phone) VALUES (6, 'Kanat Kuatbekov', 'Karagandy', 'Buhar Jyrau', 65, '+7 705 248 16 69');
INSERT INTO customers (customer_id, customer_name, city, street, house, phone) VALUES (4, 'Nuradil Ospanov', 'Atyrau', 'Baytursynov', 10, '+7 700 101 34 91');
INSERT INTO customers (customer_id, customer_name, city, street, house, phone) VALUES (3, 'Aigerim Auyelbekova', 'Almaty', 'Rozybakiyev', 20, '+7 706 613 11 07');

INSERT INTO package (package_id, sender_id, package_desc, hazard, send_date_time, ship_price) VALUES (101, 1, NULL, FALSE, '2021-10-05 14:23:59', 900);
INSERT INTO package (package_id, sender_id, package_desc, hazard, send_date_time, ship_price) VALUES (106, 2, NULL, FALSE, '2021-12-01 10:05:21', 500);
INSERT INTO package (package_id, sender_id, package_desc, hazard, send_date_time, ship_price) VALUES (105, 5, NULL, FALSE, '2020-11-29 15:03:46', 2000);
INSERT INTO package (package_id, sender_id, package_desc, hazard, send_date_time, ship_price) VALUES (104, 6, NULL, FALSE, '2020-12-01 20:40:45', 3000);
INSERT INTO package (package_id, sender_id, package_desc, hazard, send_date_time, ship_price) VALUES (102, 4, NULL, TRUE, '2020-09-01 00:00:00', 5000);
INSERT INTO package (package_id, sender_id, package_desc, hazard, send_date_time, ship_price) VALUES (103, 3, NULL, FALSE, '2021-10-15 12:43:10', 1500);
INSERT INTO package (package_id, sender_id, package_desc, hazard, send_date_time, ship_price) VALUES (107, 1, NULL, TRUE, '2020-10-05 14:23:59', 1200);
INSERT INTO package (package_id, sender_id, package_desc, hazard, send_date_time, ship_price) VALUES (108, 2, NULL, FALSE, '2020-12-01 10:05:21', 400);
INSERT INTO package (package_id, sender_id, package_desc, hazard, send_date_time, ship_price) VALUES (112, 5, NULL, TRUE, '2020-11-29 15:03:46', 600);
INSERT INTO package (package_id, sender_id, package_desc, hazard, send_date_time, ship_price) VALUES (109, 6, NULL, FALSE, '2021-12-01 20:40:45', 300);
INSERT INTO package (package_id, sender_id, package_desc, hazard, send_date_time, ship_price) VALUES (111, 4, NULL, FALSE, '2020-09-01 00:00:00', 10000);
INSERT INTO package (package_id, sender_id, package_desc, hazard, send_date_time, ship_price) VALUES (110, 3, NULL, TRUE, '2021-10-15 12:43:10', 1000);

INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed) VALUES (204, 102, 'Kazakhstan', 'Astana', '2021-10-07 10:21:24', TRUE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed) VALUES (202, 106, 'Kazakhstan', 'Aktau', '2021-12-05 08:06:45', TRUE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed) VALUES (201, 105, 'Russia', 'Moscow', '2020-12-01 19:07:25', FALSE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed) VALUES (206, 101, 'Kazakhstan', 'Pavlodar', NULL, FALSE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed) VALUES (203, 103, 'Kazakhstan', 'Semey', '2020-09-06 23:07:12', TRUE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed) VALUES (205, 104, 'Russia', 'Saint-Petersburg', '2021-10-18 15:49:55', TRUE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed) VALUES (206, 107, 'Kazakhstan', 'Pavlodar', NULL, FALSE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed) VALUES (205, 108, 'Russia', 'Saint-Petersburg', '2021-10-18 15:49:55', TRUE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed) VALUES (206, 110, 'Kazakhstan', 'Pavlodar', NULL, FALSE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed) VALUES (201, 112, 'Russia', 'Moscow', '2020-12-01 19:07:25', TRUE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed) VALUES (201, 109, 'Russia', 'Moscow', '2020-12-03 19:17:25', FALSE);
INSERT INTO location (location_code, pack_id, country, city, arr_date_time, executed) VALUES (205, 111, 'Russia', 'Saint-Petersburg', '2021-10-21 19:58:21', FALSE);

INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (102, 4, 301);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (106, 2, 305);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (105, 5, 304);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (101, 1, 302);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (103, 3, 303);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (104, 6, 307);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (107, 1, 309);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (108, 2, 306);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (110, 3, 308);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (112, 5, 310);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (109, 6, 311);
INSERT INTO shipment (pack_id, sender_id, recipient_id) VALUES (111, 4, 312);

INSERT INTO payment_data (card_number, payment_system, cust_id, card_name, card_exp, cvv_code) VALUES ('4405 2169 2030 8985', 'Visa', 1 , 'Jangir Tolysbayev', '25/07', 550);
INSERT INTO payment_data (card_number, payment_system, cust_id, card_name, card_exp, cvv_code) VALUES ('5169 4982 2930 9694', 'Mastercard', 6, 'Kanat Kuatbekov', '23/05', 885);
INSERT INTO payment_data (card_number, payment_system, cust_id, card_name, card_exp, cvv_code) VALUES ('4405 1258 2030 8825', 'Visa', 4 , 'Nuradil Ospanov', '22/12', 203);
INSERT INTO payment_data (card_number, payment_system, cust_id, card_name, card_exp, cvv_code) VALUES ('5169 2971 2930 4569', 'Mastercard', 3 , 'Aigerim Auyelbekova', '22/02', 203);

INSERT INTO bank (iban, client_name, cust_id) VALUES ('KZ1392183912', 'Azamat Murat', 5);
INSERT INTO bank (iban, client_name, cust_id) VALUES ('KZ1024832034', 'Kurman Shamyran', 2);

INSERT INTO warehouse (wh_id, pack_id, wh_phone, wh_address, arr_time1) VALUES (202, 106, '+7 777 218 29 70', 'Zhandosova 31, 60', '2021-12-05 08:06:45');

INSERT INTO plane (plane_id, pack_id, flight_code, arr_time2) VALUES (201, 105, 'K1054', '2020-12-01 19:07:25');
INSERT INTO plane (plane_id, pack_id, flight_code, arr_time2) VALUES (201, 112, 'K1054', '2020-12-01 19:07:25');
INSERT INTO plane (plane_id, pack_id, flight_code, arr_time2) VALUES (201, 109, 'D1247', '2020-12-03 19:17:25');
INSERT INTO plane (plane_id, pack_id, flight_code, arr_time2) VALUES (203, 103, 'H1203', '2020-09-06 23:07:12');
INSERT INTO plane (plane_id, pack_id, flight_code, arr_time2) VALUES (205, 104, 'M8276', '2021-10-18 15:49:55');
INSERT INTO plane (plane_id, pack_id, flight_code, arr_time2) VALUES (205, 108, 'M8276', '2021-10-18 15:49:55');
INSERT INTO plane (plane_id, pack_id, flight_code, arr_time2) VALUES (205, 111, 'G1823', '2021-10-21 19:58:21');

INSERT INTO truck (truck_id, pack_id, route_code, status, arr_time3) VALUES (204, 102, 'M7234', 'Done', '2021-10-07 10:21:24');
INSERT INTO truck (truck_id, pack_id, route_code, status, arr_time3) VALUES (206, 101, 'Z1257', 'Undone', NULL);
INSERT INTO truck (truck_id, pack_id, route_code, status, arr_time3) VALUES (206, 107, 'Z1257', 'Undone', NULL);
INSERT INTO truck (truck_id, pack_id, route_code, status, arr_time3) VALUES (206, 110, 'Z1257', 'Undone', NULL);
