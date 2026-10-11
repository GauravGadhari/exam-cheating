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


INSERT INTO Route VALUES (41, 'Pimpri', 'Vimannagar', 12);


INSERT INTO Route VALUES (42, 'Sangamner', 'Baramati', 8);


INSERT INTO Route VALUES (43, 'Pune', 'Swargate', 15);


INSERT INTO Bus VALUES (101, 30, 'Sangamner', 41);


INSERT INTO Bus VALUES (102, 15, 'Sangamner', 42);


INSERT INTO Bus VALUES (103, 25, 'Pune Depot', 41);


INSERT INTO Bus VALUES (104, 40, 'Sangamner', 43);


INSERT INTO Bus VALUES (105, 18, 'Sangamner', 42);




SELECT COUNT(*) AS total_buses
FROM Bus
WHERE depot_name = 'Sangamner';


DELETE FROM Bus
WHERE capacity < 20;


SELECT *
FROM Bus
WHERE Routeno = 41;


SELECT MAX(no_of_stations) AS max_stations
FROM Route;


SELECT *
FROM Route
WHERE source = 'Pimpri' AND destination = 'Vimannagar';




DELETE FROM Bus
WHERE Routeno IN (
    SELECT Routeno
    FROM Route
    WHERE destination = 'Baramati'
);


CREATE VIEW MaxStationRouteBuses AS
SELECT r.Routeno, r.source, r.destination, r.no_of_stations, b.Busno,
b.capacity, b.depot_name
FROM Route r
JOIN Bus b ON r.Routeno = b.Routeno
WHERE r.no_of_stations = (
    SELECT MAX(no_of_stations)

    FROM Route
);