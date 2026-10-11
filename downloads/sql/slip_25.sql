CREATE TABLE Project (
    projno INT PRIMARY KEY,
    proj_name VARCHAR(50),
    status VARCHAR(20) CHECK (status IN ('Complete', 'In progress')),
    start_date DATE
);


CREATE TABLE Employee (
    empno INT PRIMARY KEY,
    emp_name VARCHAR(50),
    city VARCHAR(50),
    designation VARCHAR(50),
    salary NUMERIC,
    projno INT,
    FOREIGN KEY (projno) REFERENCES Project(projno)
);


INSERT INTO Project VALUES (101, 'AI', 'In progress', '2025-01-01');


INSERT INTO Project VALUES (102, 'Robotics', 'Complete', '2025-02-15');


INSERT INTO Project VALUES (103, 'ML', 'In progress', '2025-03-01');


INSERT INTO Project VALUES (104, 'IoT', 'Complete', '2025-01-20');


INSERT INTO Project VALUES (105, 'Cloud', 'In progress', '2025-04-01');


INSERT INTO Employee VALUES (1, 'Sagar', 'Pune', 'Developer', 50000,
101);


INSERT INTO Employee VALUES (2, 'Meera', 'Mumbai', 'Analyst', 45000,
105);


INSERT INTO Employee VALUES (3, 'Ravi', 'Pune', 'Tester', 40000, 105);


INSERT INTO Employee VALUES (4, 'Sneha', 'Delhi', 'Developer', 55000,
103);


INSERT INTO Employee VALUES (5, 'Amit', 'Pune', 'Tester', 42000, 105);


INSERT INTO Employee VALUES (6, 'Kiran', 'Mumbai', 'Developer', 48000,
101);


INSERT INTO Employee VALUES (7, 'Anil', 'Pune', 'Analyst', 43000, 105);




SELECT emp_name
FROM Employee
WHERE projno = 105;


SELECT COUNT(*) AS inprogress_projects
FROM Project
WHERE status = 'In progress';


UPDATE Project
SET start_date = '2022-12-15'
WHERE proj_name = 'Robotics';


UPDATE Employee
SET salary = salary * 1.05
WHERE projno = 10;


DELETE FROM Project
WHERE status = 'Complete';




SELECT p.proj_name
FROM Project p
JOIN Employee e ON p.projno = e.projno
GROUP BY p.proj_name
HAVING COUNT(e.empno) > 3;


CREATE VIEW EmployeesOnApr1InProgress AS
SELECT e.empno, e.emp_name, e.city, e.designation, e.salary, e.projno
FROM Employee e
JOIN Project p ON e.projno = p.projno
WHERE p.start_date = '2025-04-01' AND p.status = 'In progress';