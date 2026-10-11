CREATE TABLE Bus (
    bno INT PRIMARY KEY,
    capacity INT,
    depot_name VARCHAR(50)
);

CREATE TABLE Driver (
    dno INT PRIMARY KEY,
    driver_name VARCHAR(50),
    license_no VARCHAR(20),
    address VARCHAR(50),
    age INT,
    salary NUMERIC
);

CREATE TABLE BusDriver (
    bno INT,
    dno INT,
    date_of_duty DATE,
    PRIMARY KEY (bno, dno, date_of_duty),
    FOREIGN KEY (bno) REFERENCES Bus(bno),
    FOREIGN KEY (dno) REFERENCES Driver(dno)

);

INSERT INTO Bus VALUES (101, 30, 'Kothrud Depot');
INSERT INTO Bus VALUES (102, 40, 'Swargate Depot');
INSERT INTO Bus VALUES (103, 25, 'Kothrud Depot');

INSERT INTO Driver VALUES (1, 'Swapnil', 'LIC123', 'Pune', 28, 30000);
INSERT INTO Driver VALUES (2, 'Sohan', 'LIC124', 'Mumbai', 24, 28000);
INSERT INTO Driver VALUES (3, 'Sunil', 'LIC125', 'Pune', 26, 32000);

INSERT INTO BusDriver VALUES (101, 1, '2009-02-12');
INSERT INTO BusDriver VALUES (101, 2, '2009-02-12');
INSERT INTO BusDriver VALUES (102, 3, '2017-01-15');
INSERT INTO BusDriver VALUES (103, 2, '2017-01-15');
INSERT INTO BusDriver VALUES (103, 1, '2009-02-12');

B. Queries (Any 3)
i. Number of buses having capacity more than 20
SELECT COUNT(*) AS bus_count
FROM Bus
WHERE capacity > 20;

ii. Count number of drivers who did duty on “15/01/2017”
SELECT COUNT(DISTINCT dno) AS driver_count
FROM BusDriver
WHERE date_of_duty = '2017-01-15';

iii. Display license number of all drivers whose name starts with ‘S’
SELECT license_no
FROM Driver
WHERE driver_name LIKE 'S%';

iv. Calculate average salary of a driver
SELECT AVG(salary) AS avg_salary
FROM Driver;

v. Find all details of driver named “Swapnil”
SELECT *
FROM Driver
WHERE driver_name = 'Swapnil';

C. Two Options
Option 1: Names of all drivers driving buses from “Kothrud Depot” on 12/2/2009
SELECT DISTINCT d.driver_name
FROM Driver d
JOIN BusDriver bd ON d.dno = bd.dno
JOIN Bus b ON bd.bno = b.bno
WHERE b.depot_name = 'Kothrud Depot'
  AND bd.date_of_duty = '2009-02-12';

Option 2: View for all buses driven by drivers aged less than 25 years
CREATE VIEW YoungDriverBuses AS
SELECT DISTINCT b.*
FROM Bus b
JOIN BusDriver bd ON b.bno = bd.bno
JOIN Driver d ON bd.dno = d.dno
WHERE d.age < 25;

OR

CREATE VIEW YoungDriverBuses AS
SELECT *
FROM Bus
WHERE bno IN (
    SELECT bno
    FROM BusDriver bd
    JOIN Driver d ON bd.dno = d.dno

    WHERE d.age < 25
);