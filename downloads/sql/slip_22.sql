CREATE TABLE Department (
    dno INT PRIMARY KEY,
    dname VARCHAR(50),
    location VARCHAR(50)
);


CREATE TABLE Employee (
    eno INT PRIMARY KEY,
    ename VARCHAR(50),
    designation VARCHAR(50),
    salary NUMERIC CHECK (salary > 5000),
    dno INT,
    FOREIGN KEY (dno) REFERENCES Department(dno)
);


INSERT INTO Department VALUES (1, 'HR', 'Nanded');


INSERT INTO Department VALUES (2, 'Finance', 'Pune');


INSERT INTO Department VALUES (3, 'IT', 'Mumbai');


INSERT INTO Employee VALUES (101, 'Sagar', 'Clerk', 12000, 1);


INSERT INTO Employee VALUES (102, 'Amit', 'Analyst', 15000, 2);


INSERT INTO Employee VALUES (103, 'Anil', 'Developer', 18000, 3);


INSERT INTO Employee VALUES (104, 'Meera', 'Clerk', 10000, 1);


INSERT INTO Employee VALUES (105, 'Ravi', 'Analyst', 16000, 2);




UPDATE Employee
SET designation = 'Manager'
WHERE ename = 'Sagar';


SELECT MIN(salary) AS min_salary
FROM Employee;


SELECT *
FROM Department
WHERE location = 'Nanded';


SELECT *
FROM Employee
WHERE ename LIKE 'A%';


SELECT dno, COUNT(*) AS employee_count
FROM Employee

GROUP BY dno
ORDER BY dno;




SELECT d.dname, SUM(e.salary) AS total_salary
FROM Department d
JOIN Employee e ON d.dno = e.dno
GROUP BY d.dname;


CREATE VIEW DeptWithMaxEmployees AS
SELECT d.*
FROM Department d
WHERE d.dno = (
    SELECT dno
    FROM Employee
    GROUP BY dno
    ORDER BY COUNT(*) DESC
    LIMIT 1
);