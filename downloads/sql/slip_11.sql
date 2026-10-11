CREATE TABLE Emp (
    eno INT PRIMARY KEY,

    ename VARCHAR(50),
    salary NUMERIC(10,2)
);

CREATE TABLE Project (
    pno INT PRIMARY KEY,
    pname VARCHAR(50),
    budget NUMERIC(12,2)
);

CREATE TABLE Emp_Project (
    eno INT,
    pno INT,
    total_hours INT,
    PRIMARY KEY (eno, pno),
    FOREIGN KEY (eno) REFERENCES Emp(eno),
    FOREIGN KEY (pno) REFERENCES Project(pno)
);

INSERT INTO Emp VALUES
(1, 'Ravi', 25000),
(2, 'Meena', 30000),
(3, 'Sonia', 28000),
(4, 'Amit', 35000);

INSERT INTO Project VALUES
(101, 'DBMS', 500000),
(102, 'AI', 800000),
(103, 'Networking', 400000);

INSERT INTO Emp_Project VALUES
(1, 101, 120),
(2, 101, 80),
(2, 102, 150),
(3, 103, 90);

SELECT MAX(budget) AS max_budget
FROM Project;

UPDATE Emp
SET salary = salary * 1.10;

SELECT COUNT(DISTINCT pno) AS project_count
FROM Emp_Project
WHERE total_hours > 100;

SELECT *
FROM Emp
WHERE ename LIKE '%a';

ALTER TABLE Emp
ADD COLUMN contact_number VARCHAR(15);

SELECT ename
FROM Emp
WHERE eno NOT IN (SELECT eno FROM Emp_Project);

CREATE VIEW MaxHoursProject AS
SELECT P.pno, P.pname, P.budget, SUM(EP.total_hours) AS total_hours
FROM Project P, Emp_Project EP
WHERE P.pno = EP.pno
GROUP BY P.pno, P.pname, P.budget

ORDER BY total_hours DESC
LIMIT 1;