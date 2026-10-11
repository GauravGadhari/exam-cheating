CREATE TABLE Student (
    rno INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);


CREATE TABLE Teacher (
    tno INT PRIMARY KEY,
    tname VARCHAR(50),
    phone_no VARCHAR(15),
    salary INT
);


CREATE TABLE StudentTeacher (
    rno INT,

    tno INT,
    subject VARCHAR(50),
    PRIMARY KEY (rno, tno, subject),
    FOREIGN KEY (rno) REFERENCES Student(rno),
    FOREIGN KEY (tno) REFERENCES Teacher(tno)
);


INSERT INTO Student VALUES (1, 'Amit', 'Sangamner');


INSERT INTO Student VALUES (2, 'Sneha', 'Pune');


INSERT INTO Student VALUES (3, 'Ravi', 'Nashik');


INSERT INTO Student VALUES (4, 'Meera', 'Sangamner');


INSERT INTO Teacher VALUES (101, 'Dr. Mulay', '9876543210', 50000);


INSERT INTO Teacher VALUES (102, 'Dr. Wani', '9123456789', 60000);


INSERT INTO Teacher VALUES (103, 'Dr. Patil', '9988776655', 45000);


INSERT INTO StudentTeacher VALUES (1, 101, 'Maths');


INSERT INTO StudentTeacher VALUES (2, 102, 'IKS');


INSERT INTO StudentTeacher VALUES (3, 101, 'Electronics');


INSERT INTO StudentTeacher VALUES (4, 102, 'IKS');


INSERT INTO StudentTeacher VALUES (2, 103, 'Physics');




SELECT * FROM Student
WHERE city = 'Sangamner';


SELECT MAX(salary) AS max_salary
FROM Teacher;


UPDATE Teacher
SET phone_no = '9834233235'

WHERE tname = 'Dr. Mulay';


SELECT * FROM Teacher
ORDER BY tname;


SELECT COUNT(DISTINCT rno) AS student_count
FROM StudentTeacher
WHERE subject = 'IKS';




SELECT s.name
FROM Student s
JOIN StudentTeacher st ON s.rno = st.rno
JOIN Teacher t ON st.tno = t.tno
WHERE t.tname = 'Dr. Wani';


CREATE VIEW NoElectronicsStudents AS
SELECT s.rno, s.name, s.city
FROM Student s
WHERE s.rno NOT IN (
    SELECT rno FROM StudentTeacher
    WHERE subject = 'Electronics'
);