CREATE TABLE Area (
    aname VARCHAR(50) PRIMARY KEY,
    area_type VARCHAR(10) CHECK (area_type IN ('urban', 'rural')),
    pincode INT
);


CREATE TABLE Person (

    pnumber INT PRIMARY KEY,
    pname VARCHAR(50),
    birthdate DATE,
    income NUMERIC(10,2),
    aname VARCHAR(50),
    FOREIGN KEY (aname) REFERENCES Area(aname)
);


INSERT INTO Area VALUES
('Camp', 'urban', 411001),
('Kalyaninagar', 'urban', 411014),
('Hadapsar', 'rural', 412308),
('ShivajiNagar', 'urban', 411005);


INSERT INTO Person VALUES
(1, 'Ravi', '1995-07-12', 45000, 'Camp'),
(2, 'Meena', '1998-03-25', 30000, 'Kalyaninagar'),
(3, 'Raj', '1992-07-05', 60000, 'Hadapsar'),

(4, 'Kiran', '1990-11-18', 70000, 'ShivajiNagar'),
(5, 'Rohit', '1999-01-09', 25000, 'Camp');




SELECT *
FROM Person
WHERE pname LIKE 'R%';


SELECT pname, birthdate
FROM Person
WHERE EXTRACT(MONTH FROM birthdate) = 7;


SELECT *
FROM Person
ORDER BY income;


SELECT COUNT(*) AS urban_count
FROM Area
WHERE area_type = 'urban';


UPDATE Area
SET pincode = 411036
WHERE aname = 'Kalyaninagar';




SELECT pname
FROM Person

WHERE aname = 'Camp'
  AND income < ANY (
      SELECT income
      FROM Person
      WHERE aname = 'Kalyaninagar'
  );


CREATE VIEW SecondMaxIncome AS
SELECT *
FROM Person
WHERE income = (
    SELECT MAX(income)
    FROM Person
    WHERE income < (SELECT MAX(income) FROM Person)
);