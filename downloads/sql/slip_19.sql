CREATE TABLE Client (
    cno INT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50)
);

CREATE TABLE "Order" (
    orderno INT PRIMARY KEY,
    s_order_date DATE,
    amount NUMERIC CHECK (amount > 0),
    cno INT,
    FOREIGN KEY (cno) REFERENCES Client(cno)
);

INSERT INTO Client VALUES (1, 'Amit', 'Mumbai');

INSERT INTO Client VALUES (2, 'Ravi', 'Pune');

INSERT INTO Client VALUES (3, 'Sneha', 'Delhi');

INSERT INTO Client VALUES (4, 'Meera', 'Mumbai');

INSERT INTO Client VALUES (5, 'Sohan', 'Nagpur');

INSERT INTO "Order" VALUES (101, '2025-10-05', 50000, 1);

INSERT INTO "Order" VALUES (102, '2025-10-12', 35000, 2);

INSERT INTO "Order" VALUES (103, '2025-09-15', 45000, 3);

INSERT INTO "Order" VALUES (104, '2025-10-20', 25000, 4);

INSERT INTO "Order" VALUES (105, '2025-08-10', 60000, 2);

INSERT INTO "Order" VALUES (106, '2025-10-25', 40000, 5);

INSERT INTO "Order" VALUES (107, '2025-10-18', 70000, 4);

UPDATE "Order"
SET s_order_date = '2019-04-12'
WHERE cno = 4;

SELECT * FROM "Order"
WHERE EXTRACT(MONTH FROM s_order_date) = 10;

SELECT * FROM "Order"
ORDER BY amount DESC;

DELETE FROM Client
WHERE address = 'Mumbai';

SELECT COUNT(*) AS order_count
FROM "Order"
WHERE amount > 40000;

SELECT c.name
FROM Client c
JOIN "Order" o ON c.cno = o.cno
GROUP BY c.name
ORDER BY COUNT(o.orderno) DESC
LIMIT 1;

CREATE VIEW ClientsWithMoreThanTwoOrders AS
SELECT c.name, COUNT(o.orderno) AS total_orders
FROM Client c
JOIN "Order" o ON c.cno = o.cno
GROUP BY c.name
HAVING COUNT(o.orderno) > 2;