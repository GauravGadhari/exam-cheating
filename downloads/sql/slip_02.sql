CREATE TABLE Department (
    dno INT PRIMARY KEY,
    dname VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Employee (
    eno INT PRIMARY KEY,
    ename VARCHAR(50),
    designation VARCHAR(50),
    salary NUMERIC(10,2),
    dno INT,
    FOREIGN KEY (dno) REFERENCES Department(dno)
);

INSERT INTO Department VALUES
(1, 'HR', 'Delhi'),
(2, 'Finance', 'Nashik'),
(3, 'IT', 'Mumbai'),
(4, 'Admin', 'Nashik');

INSERT INTO Employee VALUES

(101, 'Ravi', 'Manager', 50000, 1),
(102, 'Meena', 'Clerk', 25000, 2),
(103, 'Aruna', 'Analyst', 30000, 2),
(104, 'Kiran', 'Developer', 45000, 3),
(105, 'Sonia', 'HR Executive', 28000, 1);

UPDATE Employee
SET salary = salary * 1.05;

SELECT AVG(salary) AS avg_salary
FROM Employee;

SELECT *
FROM Department
WHERE location = 'Nashik';

SELECT *
FROM Employee
WHERE ename LIKE '%a';

SELECT location
FROM Department
WHERE dname = 'HR';

SELECT *
FROM Employee
WHERE dno NOT IN (
    SELECT dno
    FROM Department
    WHERE location = 'Delhi'
);

CREATE VIEW HighSalaryEmployees AS
SELECT ename, salary
FROM Employee
WHERE salary > ALL (
    SELECT salary
    FROM Employee E
    JOIN Department D ON E.dno = D.dno
    WHERE D.dname = 'HR'
);

CREATE VIEW HighSalaryEmployees AS
SELECT ename, salary
FROM Employee
WHERE salary > ALL (
    SELECT salary
    FROM Employee
    WHERE dno = (
        SELECT dno
        FROM Department
        WHERE dname = 'HR'
    )
);