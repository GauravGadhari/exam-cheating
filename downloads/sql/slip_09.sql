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

INSERT INTO Area VALUES
('Pune', 'urban'),
('Delhi', 'urban'),
('Nashik', 'rural'),
('Camp', 'urban');

INSERT INTO Person VALUES
(101, 'Ravi', '1995-02-15', 12000, 'Pune'),
(102, 'Meena', '1997-07-21', 8000, 'Nashik'),
(103, 'Amit', '2000-02-05', 10000, 'Delhi'),
(104, 'Sonal', '1999-12-11', 15000, 'Pune'),
(105, 'Kiran', '2001-06-25', 12000, 'Camp');

B. Queries (any 3)
i. Persons with income > 10000
SELECT *
FROM Person
WHERE income > 10000;

ii. Transfer all people from Pune → Delhi
UPDATE Person
SET aname = 'Delhi'
WHERE aname = 'Pune';

iii. Count areas of type ‘urban’
SELECT COUNT(*) AS total_urban

FROM Area
WHERE area_type = 'urban';

iv. Count people born in February
SELECT COUNT(*) AS feb_birthdays
FROM Person
WHERE EXTRACT(MONTH FROM birthdate) = 2;

v. List names of people living in rural areas
SELECT pname
FROM Person
WHERE aname IN (
    SELECT aname FROM Area WHERE area_type = 'rural'
);

C. Choice
1. Count people in urban areas with income equal to average
income
SELECT COUNT(*) AS total_people
FROM Person
WHERE income = (SELECT AVG(income) FROM Person)
  AND aname IN (SELECT aname FROM Area WHERE area_type = 'urban');

2. View: Person details with area name
CREATE VIEW PersonAreaView AS
SELECT P.pnumber, P.pname, P.birthdate, P.income, A.aname,
A.area_type
FROM Person P, Area A
WHERE P.aname = A.aname;