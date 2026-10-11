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

CREATE TABLE StudentTeacher (
    sno INT,
    tno INT,
    subject VARCHAR(50),
    PRIMARY KEY (sno, tno, subject),
    FOREIGN KEY (sno) REFERENCES Student(sno),
    FOREIGN KEY (tno) REFERENCES Teacher(tno)
);

INSERT INTO Student VALUES (1, 'Amit', 'FY');

INSERT INTO Student VALUES (2, 'Sneha', 'SY');

INSERT INTO Student VALUES (3, 'Ravi', 'SY');

INSERT INTO Student VALUES (4, 'Meera', 'TY');

INSERT INTO Teacher VALUES (101, 'Patil', 10);

INSERT INTO Teacher VALUES (102, 'Pawar', 5);

INSERT INTO Teacher VALUES (103, 'Kulkarni', 8);

INSERT INTO StudentTeacher VALUES (1, 101, 'C Programming');

INSERT INTO StudentTeacher VALUES (2, 101, 'Data Structure');

INSERT INTO StudentTeacher VALUES (3, 102, 'Data Structure');

INSERT INTO StudentTeacher VALUES (4, 103, 'DBMS');

INSERT INTO StudentTeacher VALUES (2, 103, 'Operating System');

SELECT t_name FROM Teacher
WHERE yrs_experience > 5;

SELECT COUNT(DISTINCT sno) AS student_count
FROM StudentTeacher
WHERE subject = 'Data Structure';

SELECT s_name FROM Student
WHERE s_class = 'SY';

UPDATE Teacher
SET yrs_experience = 20
WHERE t_name = 'Pawar';

SELECT s_class, s_name
FROM Student
ORDER BY s_class;

SELECT t.t_name, st.subject, s.s_name
FROM Teacher t
JOIN StudentTeacher st ON t.tno = st.tno
JOIN Student s ON st.sno = s.sno;

CREATE VIEW MaxSubjectTeacher AS
SELECT t.t_name, COUNT(st.subject) AS subject_count
FROM Teacher t
JOIN StudentTeacher st ON t.tno = st.tno
GROUP BY t.t_name
ORDER BY subject_count DESC
LIMIT 1;