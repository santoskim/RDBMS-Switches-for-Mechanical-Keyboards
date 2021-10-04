CREATE SEQUENCE vendors_id_seq
    INCREMENT BY 1
    START WITH 100000000
    MAXVALUE 199999999
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE manufactures_id_seq
    INCREMENT BY 1
    START WITH 200000000
    MAXVALUE 299999999
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE switches_id_seq
    INCREMENT BY 1
    START WITH 300000000
    MAXVALUE 399999999
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE vendor_prices_id_seq
    INCREMENT BY 1
    START WITH 400000000
    MAXVALUE 499999999
    NOCACHE
    NOCYCLE;

CREATE TABLE vendors
    (vendor_id NUMBER(9,0) CONSTRAINT vendors_id_pk PRIMARY KEY,
    vendor_name VARCHAR2(30) CONSTRAINT vendors_name_nn NOT NULL,
    website VARCHAR2(30) CONSTRAINT vendors_website_nn NOT NULL,
    phone_number NUMBER(10,0),
    email VARCHAR2(30) CONSTRAINT vendors_email_nn NOT NULL,
    address VARCHAR2(30),
    city VARCHAR2(30),
    state VARCHAR2(30),
    zip_code NUMBER(5,0),
    CONSTRAINT vendors_name_website_email_uk UNIQUE (vendor_name, website, email))

CREATE TABLE manufactures
    (manufacture_id NUMBER(9) CONSTRAINT manufactures_id_pk PRIMARY KEY,
    manufacture_name VARCHAR2(30) CONSTRAINT manufactures_name_nn NOT NULL,
    website VARCHAR2(30),
    phone_number NUMBER(15),
    email VARCHAR2(30) CONSTRAINT manufactures_email_nn NOT NULL,
    address VARCHAR2(50),
    city VARCHAR2(30),
    state VARCHAR2(30),
    country VARCHAR(30),
    zip_code NUMBER(10),
    CONSTRAINT manufactures_name_phone_email_uk UNIQUE (manufacture_name, phone_number, email))

CREATE TABLE switches
    (switch_id NUMBER(9) CONSTRAINT switches_id_pk PRIMARY KEY,
    switch_name VARCHAR2(30) CONSTRAINT switches_name_nn NOT NULL,
    switch_type VARCHAR(30) CONSTRAINT switches_switch_type_nn NOT NULL,
    mount_type VARCHAR2(5),
    top_housing VARCHAR2(30),
    bottom_housing VARCHAR2(30),
    bottom_out NUMBER(4,2),
    stem VARCHAR2(30),
    spring VARCHAR2(30),
    pins NUMBER(2,0),
    travel NUMBER(4,2),
    actuation NUMBER(4,2),
    lube VARCHAR2(30),
    manufacture_id NUMBER(9,0),
    CONSTRAINT swi_man_id_fk FOREIGN KEY (manufacture_id) 
        REFERENCES manufactures(manufacture_id))
CREATE TABLE vendor_prices
    (vendor_price_id NUMBER(9,0) CONSTRAINT vendor_price_id_pk PRIMARY KEY,
    vendor_id NUMBER(9,0),
    vendor_name VARCHAR2(30),
    switch_id NUMBER(9,0),
    switch_name VARCHAR2(30),
    price NUMBER(6,2),
    quantity NUMBER(5,0),
    CONSTRAINT ven_pri_vi_fk FOREIGN KEY (vendor_id)
        REFERENCES vendors(vendor_id),
    CONSTRAINT ven_pri_si_fk FOREIGN KEY (switch_id)
        REFERENCES switches(switch_id))

INSERT INTO vendors (vendor_id, vendor_name, website, phone_number, email, address, city, state, zip_code)
VALUES (vendors_id_seq.NEXTVAL, 'Dangkeebs', 'https://dangkeebs.com/',NULL, 'Hello@dangkeebs.com', NULL, 'Boston', 'Massachusetts', NULL)
INSERT INTO vendors (vendor_id, vendor_name, website, phone_number, email, address, city, state, zip_code)
VALUES (vendors_id_seq.NEXTVAL, 'Divinikey', 'https://divinikey.com/', NULL, ' support@divinikey.com', NULL, 'Los Angeles', 'California', NULL)
INSERT INTO vendors (vendor_id, vendor_name, website, phone_number, email, address, city, state, zip_code)
VALUES (vendors_id_seq.NEXTVAL, 'Kono', 'https://kono.store/', NULL, ' support@kono.store', NULL, NULL, 'California', NULL)
INSERT INTO vendors (vendor_id, vendor_name, website, phone_number, email, address, city, state, zip_code)
VALUES (vendors_id_seq.NEXTVAL, 'TheKey.Company', 'https://thekey.company/', NULL, 'unavailable', NULL, 'Clarkston', 'Michigan', NULL)
INSERT INTO vendors (vendor_id, vendor_name, website, phone_number, email, address, city, state, zip_code)
VALUES (vendors_id_seq.NEXTVAL, 'CannonKeys', 'https://cannonkeys.com/', NULL, 'support@cannonkeys.com', NULL, NULL, ' Rhode Island', NULL)

INSERT INTO manufactures (manufacture_id, manufacture_name, website, phone_number, email, address, city, state, country, zip_code)
VALUES (manufactures_id_seq.NEXTVAL, 'Tecsee', 'https://tecseekeys.com/', 8675527926786 , 'Sales@sinph-tech.com', '6th floor Building A1 Sanwei Industrial Park', 'Bao an District', 'Shenzhen', 'China', 518102)
INSERT INTO manufactures (manufacture_id, manufacture_name, website, phone_number, email, address, city, state, country, zip_code)
VALUES (manufactures_id_seq.NEXTVAL, 'Durock', 'https://durock.en.alibaba.com/', 8675527209609 , 'info@durock-tech.com', 'D221, Building 4, Hengchuan Zhihui City', 'Fenggang Town', 'Guangdong', 'China', 518103)
INSERT INTO manufactures (manufacture_id, manufacture_name, website, phone_number, email, address, city, state, country, zip_code)
VALUES (manufactures_id_seq.NEXTVAL, 'Gateron', 'http://www.gateron.com/',  07525303616 , ' DM@gateron.com', 'No. 27, Huifeng 6th Road, Zhongkai High-tech Zone', 'Huizhou City', 'Guangdong', 'China', NULL)
INSERT INTO manufactures (manufacture_id, manufacture_name, website, phone_number, email, address, city, state, country, zip_code)
VALUES (manufactures_id_seq.NEXTVAL, 'Zealios', 'https://zealpc.net/',  NULL , 'not available', NULL, NULL, NULL, 'Canada', NULL)
INSERT INTO manufactures (manufacture_id, manufacture_name, website, phone_number, email, address, city, state, country, zip_code)
VALUES (manufactures_id_seq.NEXTVAL, 'BSUN', 'https://www.globalsources.com/',  NULL , 'not available', '2 Industrial Zone, Miubian, Liaobu', 'Dongguan', 'Guangdong', 'China', 523423)
INSERT INTO manufactures (manufacture_id, manufacture_name, website, phone_number, email, address, city, state, country, zip_code)
VALUES (manufactures_id_seq.NEXTVAL, 'JWK', 'https://www.jwksales.com/', 7637863600 , ' info@jwksales.com', '1334 81st Avenue NE', 'Spring Lake Park', ' Minnesota','United States', 55432)
INSERT INTO manufactures (manufacture_id, manufacture_name, website, phone_number, email, address, city, state, country, zip_code)
VALUES (manufactures_id_seq.NEXTVAL, 'Cherrymx', 'https://www.cherrymx.de/en', 4909643 , '  pr@cherry.de ', 'Einsteinstrasse 174, Bogenhausen', 'München', ' Deutschland ','Germany', 81677)
INSERT INTO manufactures (manufacture_id, manufacture_name, website, phone_number, email, address, city, state, country, zip_code)
VALUES (manufactures_id_seq.NEXTVAL, 'KTT', 'not available', NULL , 'not available', NULL, NULL, NULL, NULL, NULL)
INSERT INTO manufactures (manufacture_id, manufacture_name, website, phone_number, email, address, city, state, country, zip_code)
VALUES (manufactures_id_seq.NEXTVAL, 'SOC', 'not available', NULL , 'not available', NULL, NULL, NULL, NULL, NULL)

INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Twilight', 'Tactile', 'PCB', 'Polycarbonate', 'Nylon', '67', 'POM', 'Gold Plated', '5', 4.0, NULL, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Lychee UHMWPE - Tactile', 'Tactile', 'PCB', 'Nylon', 'Nylon', '68', 'UHMWPE', 'Dual stage gold plated', '5', NULL, NULL, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Tecsee'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Lychee UHMWPE - Linear', 'Linear', 'PCB', 'Nylon', 'Nylon', '68', 'UHMWPE', 'Dual stage gold plated', '5', NULL, NULL, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Tecsee'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Blue Velvet PME - Tactile', 'Tactile', 'PCB', 'PME', 'PME', '68', 'POM', NULL, '5', NULL, NULL, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Tecsee'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Blue Velvet PME - Linear', 'Linear', 'PCB', 'PME', 'PME', '68', 'POM', NULL, '5', NULL, NULL, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Tecsee'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Tecsee Sapphire', 'Tactile', 'PCB', 'Polycarbonate mix', 'Polycarbonate mix', '63.5', 'POM', 'Gold plated progressive', '5', NULL, NULL, 'Lightl pre-lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Tecsee'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Tecsee Ruby', 'Linear', 'PCB', 'Polycarbonate mix', 'Polycarbonate mix', '63.5', 'POM', 'Gold plated progressive', '5', NULL, NULL, 'Lightly pre-lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Tecsee'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'COX GN08 Silent Yellow', 'Silent Linear', NULL, NULL, NULL, NULL, NULL, NULL, '3', 4, 50, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Queen', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 60, 'POM', 'Gold plated three-stage', '5', 4, NULL, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Cherry Hyperglide - Black', 'Linear', 'PCB', NULL, NULL, NULL, NULL, NULL, '5', 4, 60, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Cherry MX'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Cherry Hyperglide - Red', 'Linear', 'PCB', NULL, NULL, NULL, NULL, NULL, '5', 4, 45, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Cherry MX'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Cherry Hyperglide - Brown', 'Tactile', 'PCB', NULL, NULL, NULL, NULL, NULL, '5', 4, 45, NULL, 
    (SELECT manufacture_id
    FROM manufactures
    WHERE manufacture_name = 'Cherry MX'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Cherry - Red', 'Linear', 'PCB', NULL, NULL, NULL, NULL, NULL, '5', 4, 45, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Cherry MX'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Cherry - Brown', 'Tactile', 'PCB', NULL, NULL, NULL, NULL, NULL, '5', 4, 45, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Cherry MX'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'TTC Bluish White', 'Tactile', NULL, 'Clearn', 'Bluish white', NULL, NULL, 'Double coil long', '3', 3.5, 42, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'TCC'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'TTC Watermelon Milkshake', 'Tactile', NULL, NULL, NULL, 63, NULL, 'Gold plated', '3', 5, 45, 'Lightly lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'TCC'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Ethereal Panda', 'Tactile', 'PCB', 'Polycarbonate', 'Nylon', NULL, 'POM Halo', '68g', '5', NULL, NULL, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'SOC'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Dusk Panda - Tactile', 'Tactile', 'PCB', 'Polycarbonate', 'Polycarbonate', NULL, 'Custom POM; similar T1', '67g', '5', NULL, NULL, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'SOC'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Dusk Panda - Linear', 'Linear', 'PCB', 'Polycarbonate', 'Polycarbonate', NULL, 'Panda V2 POM', '62g', '5', NULL, NULL, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'SOC'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'KTT Strawberry', 'Linear', NULL, 'Polycarbonate', 'Polycarbonate', 62, 'POM', 'Gold plated', 3, 4, 43, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'KTT'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'KTT Sea Salt Lemon', 'Linear', NULL, 'Polycarbonate', 'Nylon', NULL, 'POM', NULL, 3, 4, 45, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'KTT'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'KTT Peach', 'Linear', NULL, 'Polycarbonate', 'Nylon', NULL, 'POM', NULL, 3, 4, 45, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'KTT'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'KTT Grapefruit', 'Linear', NULL, 'Polycarbonate', 'Nylon', NULL, 'POM', NULL, 5, 4, 45, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'KTT'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'KTT Kang White', 'Linear', NULL, 'Polycarbonate', 'Nylon', NULL, 'POM', 'Progressive', 3, 4, 60, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'KTT'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Durock Pom Linear - 63.5g', 'Linear', 'PCB', 'POM blend', 'POM blend', 63.5, 'POM blend', 'Gold plated', 5, 4, NULL, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Durock Pom T1 - 67g', 'Tactile', 'PCB', 'POM blend', 'POM blend', 67, 'POM blend', 'Gold plated', 5, 4, NULL, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'HaluHalo', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 63.5, 'POM', 'Gold plated', 5, 4, NULL, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Durock Linear - 55g', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 55, 'POM', 'Gold plated', 5, 4, NULL, 'Lightly lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Durock Linear - 62g', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 62, 'POM', 'Gold plated', 5, 4, NULL, 'Lightly pre-lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Durock Linear - 65g', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 65, 'POM', 'Gold plated', 5, 4, NULL, 'Lightly pre-lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Durock Linear - 67g', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 67, 'POM', 'Gold plated', 5, 4, NULL, 'Lightly pre-lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Durock Linear - 78g', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 78, 'POM', 'Gold plated', 5, 4, NULL, 'Lightly pre-lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Durock Dolphin', 'Silent Linear', 'PCB', 'Polycarbonate', 'Nylon', 62, 'POM', 'Gold plated', 5, 4, NULL, 'Lightly pre-lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Durock Daybreak', 'Silent Linear', 'PCB', 'Polycarbonate', 'Nylon', 67, 'POM', 'Gold plated', 5, 4, NULL, 'Lightly pre-lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Durock Light Tactile - 67g', 'Tactile', 'PCB', 'Polycarbonate', 'Nylon', 67, 'POM', 'Gold plated', 5, 4, NULL, 'Lightly pre-lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Durock Medium Tactile - 65g', 'Tactile', 'PCB', 'Polycarbonate', 'Nylon', 65, 'POM', 'Gold plated', 5, 4, NULL, 'Lightly pre-lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Durock T1', 'Tactile', 'PCB', 'Polycarbonate', 'Nylon', 67, 'POM', 'Gold plated', 5, 4, NULL, 'Lightly pre-lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Durock Koala', 'Tactile', 'PCB', 'Polycarbonate', 'Nylon', 67, 'POM', 'Gold plated', 5, 4, NULL, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Slate', 'Linear', NULL, NULL, NULL, 60, NULL, 'Stainless steel', 5, NULL, 40, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Cap - Milky', 'Linear', NULL, NULL, NULL, 63, NULL, NULL, 5, NULL, 50, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Cap - Yellow', 'Linear', NULL, NULL, NULL, 63, NULL, 'Gold plated', 5, 4, 50, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Cap - Brown', 'Tactile', NULL, NULL, NULL, NULL, NULL, 'Gold plated', 5, 4, 55, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Black Ink V2', 'Linear', NULL, NULL, NULL, 70, NULL, NULL, 5, 4, 60, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Yellow Ink V2', 'Linear', NULL, NULL, NULL, 67, NULL, NULL, 5, 3.5, 60, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Red Ink V2', 'Linear', NULL, NULL, NULL, 60, NULL, NULL, 5, 4, 45, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Poseidon', 'Linear', 'PCB', 'Nylon', 'Nylon', 58, 'POM', 'three-section gold-plated', 5, NULL, NULL, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Quartz', 'Linear', 'PCB', 'Polycarbonate/ Nylon Blend', 'Special Polyamide Blend', 63.5, 'P3', 'gold plated', 5, 4, 2, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'POM Glacier Panda ', 'Linear', 'PCB', 'POM', 'POM', 67, 'POM V2 linear', NULL, 5, NULL, NULL, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'BSUN'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'TTC Golden Brown', 'Tactile', NULL, NULL, NULL, 63, NULL, NULL, 3, 4, 55, 'Lightly Lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'TTC'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'TTC Watermelon', 'Tactile', NULL, NULL, NULL, 63, NULL, 'Gold Plated', 3, 4, 45, 'Lightly Lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'TTC'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'TTC Golden Blue', 'Clicky', NULL, NULL, NULL, NULL, NULL, 'Gold Plated', 3, 4, 37, 'Lightly Lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'TTC'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'KTT Sea Salt Lemon', 'Linear', NULL, 'Polycarbonate', 'Nylon', NULL, 'POM', NULL, 3, 4, 45, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'KTT'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'KTT Peach', 'Linear', NULL, 'Polycarbonate', 'Nylon', NULL, 'POM', NULL, 3, 4, 45, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'KTT'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Durock Silent T1 (Shrimp)', 'Silent Tactile', 'PCB', 'Polycarbonate', 'Nylon', 67, 'POM', 'Gold Plated', 5, 4, NULL, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Cap - Milky V2', 'Linear', NULL, NULL, NULL, 63, NULL, NULL, 5, 4, 2, 'Pre-lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'KBDFans x MITO x Gateron Laser – 60g', 'Linear', NULL, NULL, NULL, 60, NULL, NULL, 5, 4, NULL, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'KBDFans x MITO x Gateron Laser – 70g', 'Linear', NULL, NULL, NULL, 70, NULL, NULL, 5, 4, NULL, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Silver Blizzard', 'Tactile', NULL, 'Polycarbonate', 'PA66', NULL, 'POM', 'Gold Plated', 5, 3.4, 60, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Milky Yellow', 'Linear', NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, 50, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Milky Black', 'Linear', NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, 60, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Milky Red', 'Linear', NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, 45, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Milky Clear', 'Linear', NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, 35, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Milky Brown', 'Tactile', NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, 55, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Milky Blue', 'Clicky', NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, 60, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Milky Green', 'Clicky', NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, 80, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Yellow', 'Linear', NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, 50, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Black', 'Linear', NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, 60, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Red', 'Linear', NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, 45, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Brown', 'Tactile', NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, 55, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Blue', 'Clicky', NULL, NULL, NULL, NULL, NULL, NULL, 5, 4, 60, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Novelkeys x Kailh Box Cream', 'Linear', NULL, NULL, 55, NULL, NULL, NULL, 5, 4, 45, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Kailh'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Novelkeys x Kailh Chocolate', 'Linear', NULL, NULL, 70, NULL, NULL, NULL, 5, 4, 55, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Kailh'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Novelkeys x Kailh Box Jade', 'Clicky', NULL, NULL, 60, NULL, NULL, NULL, 3, 3.6, 50, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Kailh'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'ZealPC Zealios V2 - 62g', 'Tactile', NULL, NULL, 62, NULL, NULL, NULL, 5, NULL, NULL, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Zealios'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'ZealPC Zealios V2 - 67g', 'Linear', NULL, NULL, 67, NULL, NULL, NULL, 5, NULL, NULL, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Zealios'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'ZealPC Tealios V2 - 67g', 'Linear', NULL, NULL, 67, NULL, NULL, NULL, 5, NULL, NULL, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Zealios'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'ZealPC Zealios V2 - 65g', 'Tactile', NULL, NULL, 65, NULL, NULL, NULL, 5, NULL, NULL, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Zealios'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Hippo', 'Linear', 'PCB', NULL, NULL, 65.5, 'UHMWPE', NULL, 5, 4, 55, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Penguin', 'Tactile', 'PCB', 'Polycarbonate', 'Nylon', 63.5, 'POM', NULL, 5, 4, 2, 'Unlubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Salmon', 'Tactile', 'PCB', NULL, NULL, 63.5, 'POM', 'gold plated stainless steel', 5, 3.5, 55, 'Unlubed', NULL)
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Husky', 'Linear', 'PCB', 'Polycarbonate', 'Polycarbonate', 63.5, 'POM', NULL, 5, 3.9, 55, 'Factory Oil', NULL)
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Pok Polar Pandas', 'Linear', NULL, 'Nylon', 'Nylon', 60, 'POM', NULL, 3, NULL, 50, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'BSUN'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'L-Series Smokey Pink', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 65, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'L-Series Smokey Purple', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 67, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'L-Series Smokey Turquoise', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 67, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'L-Series Smokey Black', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 62, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'L-Series Smokey Yellow', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 55, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'L-Series Smokey Pink', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 65, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'L-Series Smokey Purple', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 67, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'L-Series Smokey Turquoise', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 67, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'L-Series Smokey Black', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 62, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'L-Series Smokey Yellow', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 55, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'L-Series Clear Purple', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 67, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'L-Series Clear Pink', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 65, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'L-Series Clear Yellow', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 55, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'L-Series Clear Purple', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 67, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'L-Series Clear Pink', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 65, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'L-Series Clear Yellow', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 55, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Dolphin', 'Silent Linear', 'PCB', 'Polycarbonate', 'Nylon', 62, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Dolphin', 'Silent Linear', 'PCB', 'Polycarbonate', 'Nylon', 62, 'POM', NULL, 5, 3.8, 2, 'Factory Oil', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'C³EQUALZ X TKC BANANA SPLIT', 'Linear', 'PCB', 'Polycarbonate', 'Nylon', 62, 'POM', NULL, 5, NULL, NULL, 'Pre-lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'C³EQUALZ X TKC KIWI', 'Tactile', 'PCB', 'UHMWPE', 'UHMWPE', 67, 'N9 Grey', 'Gold Plated', 5, NULL, NULL, 'Lightly lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Gateron Full Nylon Yellow', 'Linear', 'PCB', 'Nylon', 'Nylon', 62, 'POM', NULL, 5, NULL, 50, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Gateron'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Coffee Chip Ice Cream', 'Tactile', NULL, 'PME', 'PME', 68, 'POM', NULL, 5, NULL, NULL, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Tecsee'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Seal', 'Linear', NULL, 'Polycarbonate', 'Nylon', 78, 'POM', NULL, 5, NULL, NULL, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Lilac', 'Linear', NULL, 'Polycarbonate', 'Nylon', 62, 'POM', NULL, 5, NULL, NULL, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Lilac', 'Tactile', NULL, 'Polycarbonate', 'Nylon', 65, 'POM', NULL, 5, NULL, NULL, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Wuque Studio Original Aspiration (OA)', 'Linear', 'PCB', 'Polycarbonate', 'UHMWPE ', 67, 'POM', 'Gold Plated', 5, NULL, NULL, NULL, 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Lavendar', 'Linear', 'PCB', 'Nylon', 'Nylon ', 65, 'POM', 'Gold Plated', 5, NULL, NULL, 'Lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Neapolitan Ice Cream', 'Tactile', 'PCB', 'Polycarbonate', 'Polycarbonate ', 63.5, 'POM', NULL, 5, NULL, NULL, 'Lightly Lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Tecsee'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Cerulean', 'Tactile', 'PCB', 'Nylon', 'Nylon ', 65, 'POM', NULL, 5, NULL, NULL, 'Lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Anubis ', 'Tactile', 'PCB', 'Nylon', 'Nylon ', 65, 'POM', 'Gold Plated', 5, NULL, NULL, 'Lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Mauve ', 'Linear', 'PCB', 'Polycarbonate', 'Nylon ', 65, 'POM', NULL, 5, NULL, NULL, 'Lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Dark Amber T1', 'Tactile', 'PCB', 'Nylon', 'Nylon ', 65, 'POM', 'Gold Plated', 5, NULL, NULL, 'Pre-Lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'Durock'))
INSERT INTO switches (switch_id, switch_name, switch_type, mount_type, top_housing, bottom_housing, bottom_out, stem, spring, pins, travel, actuation, lube, manufacture_id)
VALUES(switches_id_seq.NEXTVAL, 'Taro Ball', 'Tactile', 'PCB', 'Polycarbonate', 'Nylon ', 65, 'POM', 'Gold Plated', 5, NULL, NULL, 'Pre-Lubed', 
    (SELECT manufacture_id 
    FROM manufactures
    WHERE manufacture_name = 'JWK'))










INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Twilight'), (SELECT switch_name FROM switches WHERE switch_name = 'Twilight'), 5.50, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Lychee UHMWPE - Tactile'), (SELECT switch_name FROM switches WHERE switch_name = 'Lychee UHMWPE - Tactile'), 6.50, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Lychee UHMWPE - Linear'), (SELECT switch_name FROM switches WHERE switch_name = 'Lychee UHMWPE - Linear'), 6.50, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Blue Velvet PME - Tactile'), (SELECT switch_name FROM switches WHERE switch_name = 'Blue Velvet PME - Tactile'), 4.70, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Blue Velvet PME - Linear'), (SELECT switch_name FROM switches WHERE switch_name = 'Blue Velvet PME - Linear'), 4.70, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Tecsee Sapphire'), (SELECT switch_name FROM switches WHERE switch_name = 'Tecsee Sapphire'), 5.5, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Tecsee Ruby'), (SELECT switch_name FROM switches WHERE switch_name = 'Tecsee Ruby'), 5.5, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'COX GN08 Silent Yellow'), (SELECT switch_name FROM switches WHERE switch_name = 'COX GN08 Silent Yellow'), 4, 10)

INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Queen'), (SELECT switch_name FROM switches WHERE switch_name = 'Queen'), 6.5, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Cherry Hyperglide - Black'), (SELECT switch_name FROM switches WHERE switch_name = 'Cherry Hyperglide - Black'), 5.5, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Cherry Hyperglide - Red'), (SELECT switch_name FROM switches WHERE switch_name = 'Cherry Hyperglide - Red'), 5.5, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Cherry Hyperglide - Brown'), (SELECT switch_name FROM switches WHERE switch_name = 'Cherry Hyperglide - Brown'), 5.5, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Cherry - Red'), (SELECT switch_name FROM switches WHERE switch_name = 'Cherry - Red'), 4, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Cherry - Brown'), (SELECT switch_name FROM switches WHERE switch_name = 'Cherry - Brown'), 4, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'TTC Bluish White'), (SELECT switch_name FROM switches WHERE switch_name = 'TTC Bluish White'), 5, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'TTC Watermelon Milkshake'), (SELECT switch_name FROM switches WHERE switch_name = 'TTC Watermelon Milkshake'), 5.2, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Ethereal Panda'), (SELECT switch_name FROM switches WHERE switch_name = 'Ethereal Panda'), 8, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Dusk Panda - Tactile'), (SELECT switch_name FROM switches WHERE switch_name = 'Dusk Panda - Tactile'), 6, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Dusk Panda - Linear'), (SELECT switch_name FROM switches WHERE switch_name = 'Dusk Panda - Linear'), 6, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'KTT Strawberry'), (SELECT switch_name FROM switches WHERE switch_name = 'KTT Strawberry'), 4, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'KTT Sea Salt Lemon'), (SELECT switch_name FROM switches WHERE switch_name = 'KTT Sea Salt Lemon'), 2.7, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'KTT Peach'), (SELECT switch_name FROM switches WHERE switch_name = 'KTT Peach'), 2.7, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'KTT Grapefruit'), (SELECT switch_name FROM switches WHERE switch_name = 'KTT Grapefruit'), 2.7, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'KTT Kang White'), (SELECT switch_name FROM switches WHERE switch_name = 'KTT Kang White'), 2.7, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Durock Pom Linear - 63.5g'), (SELECT switch_name FROM switches WHERE switch_name = 'Durock Pom Linear - 63.5g'), 7, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Durock Pom T1 - 67g'), (SELECT switch_name FROM switches WHERE switch_name = 'Durock Pom T1 - 67g'), 7, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'HaluHalo'), (SELECT switch_name FROM switches WHERE switch_name = 'HaluHalo'), 5.5, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Durock Linear - 55g'), (SELECT switch_name FROM switches WHERE switch_name = 'Durock Linear - 55g'), 5.5, 10)
INSERT INTO vendor_prices (vendor_price_id, vendor_id, vendor_name, switch_id, switch_name, price, quantity)
VALUES (vendor_prices_id_seq.NEXTVAL, (SELECT vendor_id FROM vendors WHERE vendor_name = 'Dangkeebs'), (SELECT vendor_name FROM vendors WHERE vendor_name = 'Dangkeebs'), 
    (SELECT switch_id FROM switches WHERE switch_name = 'Durock Linear - 62g'), (SELECT switch_name FROM switches WHERE switch_name = 'Durock Linear - 62g'), 5.5, 10)
