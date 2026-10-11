CREATE TABLE Customer (
    cno INT PRIMARY KEY,
    cust_name VARCHAR(50),
    cust_city VARCHAR(50)
);


CREATE TABLE Account (
    ano INT PRIMARY KEY,
    acc_type VARCHAR(10) CHECK (acc_type IN ('Saving','Current')),
    balance NUMERIC CHECK (balance >= 0),
    cno INT,
    FOREIGN KEY (cno) REFERENCES Customer(cno)
);


INSERT INTO Customer VALUES (1, 'Sahil', 'Pune');


INSERT INTO Customer VALUES (2, 'Rina', 'Mumbai');


INSERT INTO Customer VALUES (3, 'Kiran', 'Pune');


INSERT INTO Customer VALUES (4, 'Meera', 'Delhi');


INSERT INTO Customer VALUES (5, 'Ankit', 'Pune');


INSERT INTO Account VALUES (101, 'Saving', 50000, 1);


INSERT INTO Account VALUES (102, 'Current', 150000, 2);


INSERT INTO Account VALUES (103, 'Saving', 25000, 3);


INSERT INTO Account VALUES (104, 'Current', 120000, 4);


INSERT INTO Account VALUES (105, 'Saving', 70000, 5);


INSERT INTO Account VALUES (106, 'Current', 200000, 1);




SELECT COUNT(*) AS customer_count
FROM Customer

WHERE cust_name LIKE '%in%';


SELECT AVG(balance) AS avg_current_balance
FROM Account
WHERE acc_type = 'Current';


SELECT *
FROM Account
ORDER BY balance;


UPDATE Account
SET balance = balance + 10000
WHERE cno = (
    SELECT cno FROM Customer WHERE cust_name = 'Sahil'
);


ALTER TABLE Customer
ADD COLUMN phone_no VARCHAR(15);


SELECT c.cust_city, c.cust_name, a.balance
FROM Customer c
JOIN Account a ON c.cno = a.cno
WHERE a.balance = (
    SELECT MIN(a2.balance)
    FROM Account a2
    JOIN Customer c2 ON a2.cno = c2.cno
    WHERE c2.cust_city = c.cust_city

);




CREATE VIEW PuneMaxSaving AS
SELECT c.cust_name, c.cust_city, a.balance
FROM Customer c
JOIN Account a ON c.cno = a.cno
WHERE c.cust_city = 'Pune' AND a.acc_type = 'Saving'
  AND a.balance = (
      SELECT MAX(balance)
      FROM Account a2
      JOIN Customer c2 ON a2.cno = c2.cno
      WHERE c2.cust_city = 'Pune' AND a2.acc_type = 'Saving'
  );