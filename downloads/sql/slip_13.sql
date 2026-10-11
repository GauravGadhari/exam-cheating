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

B. Queries (Any 3)
i) List all buses at depot “Swargate”
SELECT * FROM Bus WHERE depot_name = 'Swargate';

ii) Delete Bus whose Bus number is “204”
DELETE FROM Bus WHERE Busno = 204;

iii) List all buses on route number 41
SELECT * FROM Bus WHERE Routeno = 41;

iv) List the route details having number of stations greater than 10
SELECT * FROM Route WHERE no_of_stations > 10;

v) List all routes starting from “Pune station”
SELECT * FROM Route WHERE source = 'Pune Station';

C. Two Options
Option 1: Delete buses on routes with < 3 stations
DELETE FROM Bus
WHERE Routeno IN (
    SELECT Routeno FROM Route WHERE no_of_stations < 3
);

OR
Option 2: Create a view (Pimpri → Hadapsar)
CREATE VIEW Pimpri_Hadapsar_Buses AS
SELECT b.Busno, b.capacity, b.depot_name, r.Routeno, r.source,
r.destination, r.no_of_stations
FROM Bus b
JOIN Route r ON b.Routeno = r.Routeno
WHERE r.source = 'Pimpri' AND r.destination = 'Hadapsar';