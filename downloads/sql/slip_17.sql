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

B. Queries (Any 3)
i. List of all properties in Nashik city
SELECT * FROM Property
WHERE city = 'Nashik';

ii. Owners whose property > 2000 sqft
SELECT oname

FROM Property
WHERE area_sqft > 2000;

iii. Number of properties owned by “Mr.Rahane”
SELECT COUNT(*) AS property_count
FROM Property
WHERE oname = 'Mr.Rahane';

iv. Count all properties of Pune city
SELECT COUNT(*) AS pune_properties
FROM Property
WHERE city = 'Pune';

v. Delete all properties in Pune owned by “Mr.Baravkar”
DELETE FROM Property
WHERE city = 'Pune' AND oname = 'Mr.Baravkar';

Option 1 (Simple Version)
Find owners who have property in Pune city, located in Kothrud, and area
greater than 10000 sqft:
SELECT DISTINCT oname
FROM Property
WHERE city = 'Pune'
  AND location = 'Kothrud'
  AND area_sqft > 10000;

Option 2 (View for Owner-wise property list)
CREATE VIEW OwnerWiseProperties AS
SELECT oname, pno, area_sqft, location, city

FROM Property;