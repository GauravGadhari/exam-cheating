CREATE TABLE Client (
    clientno INT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100)
);

CREATE TABLE Sales_order (
    sorderno INT PRIMARY KEY,
    s_order_date DATE,
    order_amt NUMERIC(12,2) CHECK (order_amt > 0),
    clientno INT,
    FOREIGN KEY (clientno) REFERENCES Client(clientno)
);

INSERT INTO Client VALUES
(10, 'Ravi', 'Nagpur'),
(20, 'Meena', 'Pune'),
(30, 'Amit', 'Mumbai'),
(40, 'Sonal', 'Nagpur');

INSERT INTO Sales_order VALUES
(101, '2024-02-20', 12000, 10),
(102, '2024-02-25', 15000, 20),
(103, '2024-01-15', 8000, 30),
(104, '2024-02-22', 25000, 10),
(105, '2024-03-01', 20000, 40);

B. Queries (any 3)
i. Update Nagpur → Kolhapur
UPDATE Client
SET address = 'Kolhapur'
WHERE address = 'Nagpur';

ii. Delete all sales orders for clientno = 30
DELETE FROM Sales_order
WHERE clientno = 30;

iii. Sales records before 23/02/2024
SELECT *
FROM Sales_order
WHERE s_order_date < '2024-02-23';

iv. Sales order with maximum amount
SELECT *
FROM Sales_order
WHERE order_amt = (SELECT MAX(order_amt) FROM Sales_order);

v. Add column order_status
ALTER TABLE Sales_order
ADD COLUMN order_status VARCHAR(20);

C. Choice
1. Client with maximum sales orders
SELECT C.clientno, C.name, C.address, COUNT(S.sorderno) AS
total_orders
FROM Client C, Sales_order S
WHERE C.clientno = S.clientno
GROUP BY C.clientno, C.name, C.address
ORDER BY total_orders DESC
LIMIT 1;

2. View: Clients having more than 2 sales orders
CREATE VIEW ClientsWithMoreThan2Orders AS
SELECT C.clientno, C.name, COUNT(S.sorderno) AS total_orders
FROM Client C, Sales_order S
WHERE C.clientno = S.clientno
GROUP BY C.clientno, C.name
HAVING COUNT(S.sorderno) > 2;