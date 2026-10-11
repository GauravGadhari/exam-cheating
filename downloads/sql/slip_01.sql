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

B. Queries (any 3)
i. List details of rooms with charges between 5000 and 10000
SELECT *
FROM Room
WHERE charges BETWEEN 5000 AND 10000;

ii. List names of guests in sorted order by city
SELECT Gname, city
FROM Guest
ORDER BY city;

iii. List the minimum charges of a room
SELECT MIN(charges) AS min_charges
FROM Room;

iv. Increase charges of all AC rooms by 15%

UPDATE Room
SET charges = charges * 1.15
WHERE room_type = 'AC';

v. List names of all NonAC rooms with charges > 10000
SELECT room_name
FROM Room
WHERE room_type = 'NonAC' AND charges > 10000;

C. Query for highest charges room’s guest
SELECT Gname
FROM Guest
WHERE roomno = (
    SELECT roomno
    FROM Room
    WHERE charges = (SELECT MAX(charges) FROM Room)
);

Alternative C. Create a View
CREATE VIEW NonAC_View AS
SELECT room_name, charges
FROM Room
WHERE room_type = 'NonAC'
  AND charges > ANY (SELECT charges FROM Room WHERE room_type = 'AC');