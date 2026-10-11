CREATE TABLE Doctor (
    dcode INT PRIMARY KEY,
    doctor_name VARCHAR(50),
    specialization VARCHAR(50),
    address VARCHAR(100),
    phone_no VARCHAR(15),
    fees INT
);

CREATE TABLE Patient (
    pcode INT PRIMARY KEY,
    patient_name VARCHAR(50),
    symptoms VARCHAR(50),
    dcode INT,
    FOREIGN KEY (dcode) REFERENCES Doctor(dcode)
);

INSERT INTO Doctor VALUES (1, 'Dr. Patil', 'Cardiologist', 'Sadashiv
Peth', '9876543210', 500);

INSERT INTO Doctor VALUES (2, 'Dr. Joshi', 'Neurologist', 'Shivajinagar',
'9898989898', 700);

INSERT INTO Doctor VALUES (3, 'Dr. Kulkarni', 'Orthopedic',
'Shivajinagar', '9765432100', 600);

INSERT INTO Doctor VALUES (4, 'Dr. Deshmukh', 'Neurologist', 'Camp',
'9123456789', 800);

INSERT INTO Patient VALUES (101, 'Meera', 'Fever', 1);

INSERT INTO Patient VALUES (102, 'Mohan', 'Headache', 2);

INSERT INTO Patient VALUES (103, 'Sita', 'Fever', 3);

INSERT INTO Patient VALUES (104, 'Manish', 'Cough', 2);

INSERT INTO Patient VALUES (105, 'Anita', 'Cold', 4);

SELECT patient_name FROM Patient
WHERE patient_name LIKE 'M%';

SELECT COUNT(*) AS neurologist_count
FROM Doctor
WHERE specialization = 'Neurologist';

SELECT patient_name FROM Patient
WHERE symptoms = 'Fever';

SELECT specialization, phone_no FROM Doctor
WHERE address = 'Sadashiv Peth';

UPDATE Doctor
SET address = 'Camp'
WHERE doctor_name = 'Dr. Patil';

SELECT p.patient_name
FROM Patient p
JOIN Doctor d ON p.dcode = d.dcode

WHERE d.address = 'Shivajinagar'
  AND d.specialization = 'Orthopedic';

CREATE VIEW MinFeesPatients AS
SELECT p.patient_name, d.doctor_name, d.fees
FROM Patient p
JOIN Doctor d ON p.dcode = d.dcode
WHERE d.fees = (SELECT MIN(fees) FROM Doctor);