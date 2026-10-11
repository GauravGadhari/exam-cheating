CREATE TABLE Area (
    aname VARCHAR(50) PRIMARY KEY,
    area_type VARCHAR(10) CHECK (area_type IN ('urban','rural'))
);

CREATE TABLE Person (
    pnumber INT PRIMARY KEY,
    pname VARCHAR(50),
    birthdate DATE,
    income NUMERIC(10,2),
    aname VARCHAR(50),
    FOREIGN KEY (aname) REFERENCES Area(aname)
);

Insert into Area
INSERT INTO Area VALUES
('Pune', 'urban'),
('Delhi', 'urban'),
('Nashik', 'rural'),
('Camp', 'urban');

Insert into Person
INSERT INTO Person VALUES
(101, 'Ravi', '1995-02-15', 12000, 'Pune'),
(102, 'Meena', '1997-07-21', 8000, 'Nashik'),
(103, 'Amit', '2000-02-05', 10000, 'Delhi'),
(104, 'Sonal', '1999-12-11', 15000, 'Pune'),
(105, 'Kiran', '2001-06-25', 12000, 'Camp');

SELECT *
FROM Person
WHERE income > 10000;

UPDATE Person
SET aname = 'Delhi'
WHERE aname = 'Pune';

SELECT COUNT(*) AS total_urban

FROM Area
WHERE area_type = 'urban';

SELECT COUNT(*) AS feb_birthdays
FROM Person
WHERE EXTRACT(MONTH FROM birthdate) = 2;

SELECT pname
FROM Person
WHERE aname IN (
    SELECT aname FROM Area WHERE area_type = 'rural'
);

SELECT COUNT(*) AS total_people
FROM Person
WHERE income = (SELECT AVG(income) FROM Person)
  AND aname IN (SELECT aname FROM Area WHERE area_type = 'urban');

CREATE VIEW PersonAreaView AS
SELECT P.pnumber, P.pname, P.birthdate, P.income, A.aname,
A.area_type
FROM Person P, Area A
WHERE P.aname = A.aname;