CREATE TABLE Student (
    sno INT PRIMARY KEY,
    s_name VARCHAR(50),
    s_class VARCHAR(5) CHECK (s_class IN ('FY','SY','TY'))
);

CREATE TABLE Teacher (
    tno INT PRIMARY KEY,
    t_name VARCHAR(50),
    yrs_experience INT
);

CREATE TABLE Student_Teacher (
    sno INT,
    tno INT,
    subject VARCHAR(50),
    PRIMARY KEY (sno, tno, subject),
    FOREIGN KEY (sno) REFERENCES Student(sno),
    FOREIGN KEY (tno) REFERENCES Teacher(tno)
);

INSERT INTO Student VALUES
(101, 'Ravi', 'FY'),

(102, 'Meena', 'SY'),
(103, 'Amit', 'TY'),
(104, 'Sonal', 'TY'),
(105, 'Kiran', 'SY');

INSERT INTO Teacher VALUES
(201, 'Prof. Patil', 10),
(202, 'Prof. Mehta', 7),
(203, 'Prof. Sharma', 12);

INSERT INTO Student_Teacher VALUES
(101, 201, 'DBMS'),
(102, 201, 'Maths'),
(103, 202, 'Maths'),
(104, 203, 'OS'),
(105, 202, 'Maths'),
(103, 201, 'DBMS');

B. Queries (any 3)
i. Class-wise number of students
SELECT s_class, COUNT(*) AS total_students
FROM Student
GROUP BY s_class;

ii. All students in TY
SELECT *
FROM Student
WHERE s_class = 'TY';

iii. Count students who have taken Maths
SELECT COUNT(DISTINCT sno) AS maths_students
FROM Student_Teacher
WHERE subject = 'Maths';

iv. Delete record of student with sno = 105

DELETE FROM Student
WHERE sno = 105;

v. Add designation column in teacher table
ALTER TABLE Teacher
ADD COLUMN designation VARCHAR(50);

C. Choice
1. Teachers with subjects & total number of students
SELECT T.t_name, ST.subject, COUNT(DISTINCT ST.sno) AS
total_students
FROM Teacher T, Student_Teacher ST
WHERE T.tno = ST.tno
GROUP BY T.t_name, ST.subject;

2. View: Teacher who teaches maximum number of subjects
CREATE VIEW MaxSubjectsTeacher AS
SELECT tno, COUNT(DISTINCT subject) AS subject_count
FROM Student_Teacher
GROUP BY tno
ORDER BY subject_count DESC
LIMIT 1;