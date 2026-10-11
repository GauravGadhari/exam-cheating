CREATE TABLE Doctor (
dno INT PRIMARY KEY,
dname VARCHAR(50),
city VARCHAR(50)
);

CREATE TABLE Patient (
pno INT PRIMARY KEY,
pat_name VARCHAR(50),
city VARCHAR(50),
disease VARCHAR(50)

);

CREATE TABLE Doctor_Patient (
dno INT,
pno INT,
fees NUMERIC(10,2),
PRIMARY KEY (dno, pno),
FOREIGN KEY (dno) REFERENCES Doctor(dno),
FOREIGN KEY (pno) REFERENCES Patient(pno)
);

INSERT INTO Doctor VALUES
(1, 'Dr. Patil', 'Nagpur'),
(2, 'Dr. Kumar', 'Delhi'),
(3, 'Dr. Mehta', 'Mumbai');

INSERT INTO Patient VALUES

(101, 'Arjun', 'Nagpur', 'Asthama'),
(102, 'Asha', 'Pune', 'Cancer'),
(103, 'Ravi', 'Delhi', 'Fever'),
(104, 'Anita', 'Mumbai', 'Asthama'),
(105, 'Meena', 'Nagpur', 'Cancer');

INSERT INTO Doctor_Patient VALUES
(1, 101, 300),
(1, 102, 500),
(2, 101, 200),
(2, 103, 250),
(2, 104, 200),
(3, 105, 400);

SELECT *

FROM Doctor
WHERE city = 'Nagpur';

SELECT COUNT(*) AS total_patients
FROM Patient;

SELECT pat_name
FROM Patient
WHERE disease = 'Cancer';

UPDATE Doctor
SET city = 'Pune'
WHERE dname = 'Dr. Patil';

SELECT pat_name
FROM Patient
WHERE pat_name LIKE 'A%';

SELECT COUNT(*) AS total_patients
FROM Patient P
JOIN Doctor_Patient DP ON P.pno = DP.pno
JOIN Doctor D ON DP.dno = D.dno
WHERE P.disease = 'Asthama'
  AND DP.fees = 200
  AND D.dname = 'Dr. Kumar';

SELECT COUNT(*) AS total_patients
FROM Patient
WHERE disease = 'Asthama'
  AND pno IN (
      SELECT pno
      FROM Doctor_Patient
      WHERE fees = 200
        AND dno = (
            SELECT dno
            FROM Doctor
            WHERE dname = 'Dr. Kumar'

        )
  );

CREATE VIEW MaxPatientsDoctor AS
SELECT D.dname, COUNT(DP.pno) AS total_patients
FROM Doctor D
JOIN Doctor_Patient DP ON D.dno = DP.dno
GROUP BY D.dname
ORDER BY total_patients DESC
LIMIT 1;

CREATE VIEW MaxPatientsDoctor AS
SELECT dname,
       (SELECT COUNT(*)
        FROM Doctor_Patient DP

        WHERE DP.dno = D.dno) AS total_patients
FROM Doctor D
ORDER BY total_patients DESC
LIMIT 1;