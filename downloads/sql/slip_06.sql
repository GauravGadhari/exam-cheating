CREATE TABLE Student (
    rno INT PRIMARY KEY,

    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Teacher (
    tno INT PRIMARY KEY,
    tname VARCHAR(50),
    phone_no VARCHAR(15),
    salary NUMERIC(10,2)
);

CREATE TABLE Student_Teacher (
    rno INT,
    tno INT,
    subject VARCHAR(50),
    PRIMARY KEY (rno, tno, subject),
    FOREIGN KEY (rno) REFERENCES Student(rno),
    FOREIGN KEY (tno) REFERENCES Teacher(tno)

);

INSERT INTO Student VALUES
(1, 'Ravi', 'Pune'),
(2, 'Meena', 'Ahilyanagar'),
(3, 'Arjun', 'Mumbai'),
(4, 'Sita', 'Ahilyanagar');

INSERT INTO Teacher VALUES
(101, 'Prof. Patil', '9876543210', 45000),
(102, 'Mr. Kumar', '9898989898', 55000),
(103, 'Dr. Mehta', '9123456789', 65000),
(104, 'Mr. Joshi', '9234567890', 40000);

INSERT INTO Student_Teacher VALUES
(1, 101, 'DBMS'),
(2, 101, 'DBMS'),

(3, 102, 'Maths'),
(4, 104, 'English'),
(2, 103, 'Science'),
(1, 104, 'English');

B. Queries (any 3)
i. List the names of students from ‘Ahilyanagar’
SELECT name
FROM Student
WHERE city = 'Ahilyanagar';

ii. Count of teachers whose salary is between 40000 to 60000
SELECT COUNT(*) AS teacher_count
FROM Teacher
WHERE salary BETWEEN 40000 AND 60000;

iii. Change phone number of ‘Prof. Patil’

UPDATE Teacher
SET phone_no = '9822131226'
WHERE tname = 'Prof. Patil';

iv. List teachers sorted by name
SELECT *
FROM Teacher
ORDER BY tname;

v. Names of teachers with salary < 50000
SELECT tname
FROM Teacher
WHERE salary < 50000;

C. Choice
1. Teachers who do not teach any subject taught by ‘Mr. Patil’

SELECT tname
FROM Teacher
WHERE tno NOT IN (
    SELECT tno
    FROM Student_Teacher
    WHERE subject IN (
        SELECT subject
        FROM Student_Teacher
        WHERE tno = (
            SELECT tno FROM Teacher WHERE tname = 'Mr. Patil'
        )
    )
);

2. Create a view: students who have taken ‘DBMS’ subject
CREATE VIEW DBMS_Students AS
SELECT S.rno, S.name, S.city
FROM Student S

WHERE S.rno IN (
    SELECT rno
    FROM Student_Teacher
    WHERE subject = 'DBMS'
);