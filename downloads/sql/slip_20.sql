CREATE TABLE Customer (

    cust_no INT PRIMARY KEY,
    cust_name VARCHAR(50),
    cust_city VARCHAR(50)
);

CREATE TABLE Account (
    acc_no INT PRIMARY KEY,
    acc_type VARCHAR(10) CHECK (acc_type IN ('Saving','Current')),
    balance NUMERIC CHECK (balance >= 0),
    cust_no INT,
    FOREIGN KEY (cust_no) REFERENCES Customer(cust_no)
);

INSERT INTO Customer VALUES (1, 'Amit', 'Delhi');
INSERT INTO Customer VALUES (2, 'Ravi', 'Mumbai');
INSERT INTO Customer VALUES (3, 'Sneha', 'Delhi');
INSERT INTO Customer VALUES (4, 'Meera', 'Ahilyanagar');

INSERT INTO Account VALUES (101123, 'Saving', 500000, 1);
INSERT INTO Account VALUES (101124, 'Current', 1500000, 2);
INSERT INTO Account VALUES (101125, 'Saving', 250000, 3);
INSERT INTO Account VALUES (101126, 'Current', 1200000, 4);
INSERT INTO Account VALUES (101127, 'Saving', 700000, 2);

B. Queries (Any 3)
i. Find the names of all Customers staying in “Delhi”
SELECT cust_name FROM Customer
WHERE cust_city = 'Delhi';

ii. Give the total balance of all Saving accounts
SELECT SUM(balance) AS total_saving_balance
FROM Account
WHERE acc_type = 'Saving';

iii. Find the maximum balance of an account

SELECT MAX(balance) AS max_balance
FROM Account;

iv. Increase the balance of account no 101123 by Rs 10,000/-
UPDATE Account
SET balance = balance + 10000
WHERE acc_no = 101123;

v. Add column “AADHAR number” to customer table
ALTER TABLE Customer
ADD COLUMN aadhar_no VARCHAR(12);

C. Two Options
Option 1: Customers of Current accounts with balance > 10,00,000
SELECT c.cust_name, c.cust_city
FROM Customer c
JOIN Account a ON c.cust_no = a.cust_no
WHERE a.acc_type = 'Current' AND a.balance > 1000000;

Option 2: Create a view for customers having Saving account and not in
“Ahilyanagar”
CREATE VIEW SavingCustomers AS
SELECT DISTINCT c.cust_no, c.cust_name, c.cust_city
FROM Customer c
JOIN Account a ON c.cust_no = a.cust_no
WHERE a.acc_type = 'Saving'
  AND c.cust_city <> 'Ahilyanagar';