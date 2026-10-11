CREATE TABLE Game (
    gname VARCHAR(30) PRIMARY KEY,
    noofplayers INT,
    coachname VARCHAR(30),
    captain_name VARCHAR(30) CHECK (captain_name =
UPPER(captain_name))
);

CREATE TABLE Player (
    pno INT PRIMARY KEY,
    pname VARCHAR(30),
    gname VARCHAR(30),
    FOREIGN KEY (gname) REFERENCES Game(gname)
);

INSERT INTO Game VALUES ('Cricket', 11, 'Dhoni', 'KOHLI');

INSERT INTO Game VALUES ('Hockey', 11, 'Singh', 'RAHUL');

INSERT INTO Game VALUES ('Kho Kho', 12, 'Sharma', 'AMAN');

INSERT INTO Game VALUES ('Football', 11, 'Jose', 'ROHIT');

INSERT INTO Player VALUES (1, 'Amit', 'Cricket');

INSERT INTO Player VALUES (2, 'Ravi', 'Cricket');

INSERT INTO Player VALUES (3, 'Sohan', 'Hockey');

INSERT INTO Player VALUES (4, 'Mohan', 'Hockey');

INSERT INTO Player VALUES (5, 'Raj', 'Kho Kho');

INSERT INTO Player VALUES (6, 'Anil', 'Football');

INSERT INTO Player VALUES (7, 'Sunil', 'Football');

SELECT pname FROM Player
WHERE gname = 'Hockey';

SELECT AVG(noofplayers) AS avg_players

FROM Game;

DELETE FROM Player
WHERE gname = 'Kho Kho';

SELECT pname FROM Player
WHERE gname <> 'Cricket';

Update the coach name from “Dhoni” to “Tendulkar” for game “Cricket”
UPDATE Game
SET coachname = 'Tendulkar'
WHERE gname = 'Cricket' AND coachname = 'Dhoni';

SELECT * FROM Game
WHERE noofplayers = (SELECT MAX(noofplayers) FROM Game);

CREATE VIEW GameWisePlayers AS
SELECT g.gname, p.pname
FROM Game g
JOIN Player p ON g.gname = p.gname;