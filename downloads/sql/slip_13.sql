CREATE TABLE Route (
    Routeno INT PRIMARY KEY,
    source VARCHAR(50),
    destination VARCHAR(50),
    no_of_stations INT
);

CREATE TABLE Bus (
    Busno INT PRIMARY KEY,
    capacity INT NOT NULL,
    depot_name VARCHAR(50),
    Routeno INT,
    FOREIGN KEY (Routeno) REFERENCES Route(Routeno)
);

INSERT INTO Route VALUES (41, 'Pune Station', 'Kothrud', 12);

INSERT INTO Route VALUES (42, 'Swargate', 'Nigdi', 15);

INSERT INTO Route VALUES (43, 'Pimpri', 'Hadapsar', 18);

INSERT INTO Route VALUES (44, 'Katraj', 'Shivaji Nagar', 2);

INSERT INTO Bus VALUES (201, 50, 'Swargate', 41);

INSERT INTO Bus VALUES (202, 45, 'Nigdi', 42);

INSERT INTO Bus VALUES (203, 60, 'Swargate', 43);

INSERT INTO Bus VALUES (204, 40, 'Kothrud', 42);

INSERT INTO Bus VALUES (205, 55, 'Pune Station', 44);

SELECT * FROM Bus WHERE depot_name = 'Swargate';

DELETE FROM Bus WHERE Busno = 204;

SELECT * FROM Bus WHERE Routeno = 41;

SELECT * FROM Route WHERE no_of_stations > 10;

SELECT * FROM Route WHERE source = 'Pune Station';

DELETE FROM Bus
WHERE Routeno IN (
    SELECT Routeno FROM Route WHERE no_of_stations < 3
);

CREATE VIEW Pimpri_Hadapsar_Buses AS
SELECT b.Busno, b.capacity, b.depot_name, r.Routeno, r.source,
r.destination, r.no_of_stations
FROM Bus b
JOIN Route r ON b.Routeno = r.Routeno
WHERE r.source = 'Pimpri' AND r.destination = 'Hadapsar';