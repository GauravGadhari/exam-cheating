CREATE TABLE Owner (

    oname VARCHAR(50) PRIMARY KEY,
    address VARCHAR(100),
    phone VARCHAR(15)
);


CREATE TABLE Property (
    pno INT PRIMARY KEY,
    area_sqft INT,
    location VARCHAR(50),
    city VARCHAR(50),
    oname VARCHAR(50),
    FOREIGN KEY (oname) REFERENCES Owner(oname)
);


INSERT INTO Owner VALUES ('Mr.Rahane', 'Nashik', '9876543210');


INSERT INTO Owner VALUES ('Mr.Baravkar', 'Pune', '9123456789');


INSERT INTO Owner VALUES ('Mr.Kulkarni', 'Mumbai', '9988776655');


INSERT INTO Property VALUES (1, 2500, 'Gangapur Road', 'Nashik',
'Mr.Rahane');


INSERT INTO Property VALUES (2, 1800, 'Kothrud', 'Pune',
'Mr.Baravkar');


INSERT INTO Property VALUES (3, 12000, 'Kothrud', 'Pune',
'Mr.Kulkarni');


INSERT INTO Property VALUES (4, 3000, 'Deccan', 'Pune', 'Mr.Rahane');


INSERT INTO Property VALUES (5, 900, 'Dadar', 'Mumbai', 'Mr.Kulkarni');




SELECT * FROM Property
WHERE city = 'Nashik';


SELECT oname

FROM Property
WHERE area_sqft > 2000;


SELECT COUNT(*) AS property_count
FROM Property
WHERE oname = 'Mr.Rahane';


SELECT COUNT(*) AS pune_properties
FROM Property
WHERE city = 'Pune';


DELETE FROM Property
WHERE city = 'Pune' AND oname = 'Mr.Baravkar';


SELECT DISTINCT oname
FROM Property
WHERE city = 'Pune'
  AND location = 'Kothrud'
  AND area_sqft > 10000;




CREATE VIEW OwnerWiseProperties AS
SELECT oname, pno, area_sqft, location, city

FROM Property;