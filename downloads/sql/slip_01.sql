CREATE TABLE Room (
    roomno INT PRIMARY KEY,
    room_name VARCHAR(50),
    room_type VARCHAR(10) CHECK (room_type IN ('AC', 'NonAC')),
    charges NUMERIC(10,2)
);


CREATE TABLE Guest (
    Guestcode INT PRIMARY KEY,
    Gname VARCHAR(50),
    city VARCHAR(50),
    roomno INT UNIQUE,
    FOREIGN KEY (roomno) REFERENCES Room(roomno)
);


INSERT INTO Room VALUES
(1, 'Deluxe1', 'AC', 8000),
(2, 'Deluxe2', 'NonAC', 6000),
(3, 'Suite1', 'AC', 12000),
(4, 'Suite2', 'NonAC', 15000);


INSERT INTO Guest VALUES
(101, 'Ravi', 'Pune', 1),
(102, 'Meena', 'Mumbai', 2),
(103, 'Arjun', 'Delhi', 3),
(104, 'Kiran', 'Bangalore', 4);




SELECT *
FROM Room
WHERE charges BETWEEN 5000 AND 10000;


SELECT Gname, city
FROM Guest
ORDER BY city;


SELECT MIN(charges) AS min_charges
FROM Room;


UPDATE Room
SET charges = charges * 1.15
WHERE room_type = 'AC';


SELECT room_name
FROM Room
WHERE room_type = 'NonAC' AND charges > 10000;




SELECT Gname
FROM Guest
WHERE roomno = (
    SELECT roomno
    FROM Room
    WHERE charges = (SELECT MAX(charges) FROM Room)
);


CREATE VIEW NonAC_View AS
SELECT room_name, charges
FROM Room
WHERE room_type = 'NonAC'
  AND charges > ANY (SELECT charges FROM Room WHERE room_type = 'AC');