CREATE TABLE Customer (
    custno INT PRIMARY KEY,
    cust_name VARCHAR(50),
    cust_city VARCHAR(50)
);

CREATE TABLE Account (
    acctno INT PRIMARY KEY,
    acct_type VARCHAR(10) CHECK (acct_type IN ('saving','current')),
    balance NUMERIC(12,2) CHECK (balance > 0),
    branch_name VARCHAR(50),
    custno INT,
    FOREIGN KEY (custno) REFERENCES Customer(custno)
);

INSERT INTO Customer VALUES
(1, 'Ravi', 'Pune'),
(2, 'Meena', 'Mumbai'),
(3, 'Sanjay', 'Delhi'),
(4, 'Ramnath', 'Nashik');

INSERT INTO Account VALUES
(101, 'saving', 7000, 'M.G.Road', 1),
(102, 'current', 12000, 'Deccan', 2),
(103, 'saving', 3000, 'M.G.Road', 3),
(104, 'saving', 15000, 'Camp', 1),
(105, 'current', 9000, 'M.G.Road', 4);

B. Queries (any 3)
i. All saving accounts with balance > 5000
SELECT *
FROM Account
WHERE acct_type = 'saving'
  AND balance > 5000;

ii. Count customers in Pune
SELECT COUNT(*) AS pune_customers
FROM Customer
WHERE cust_city = 'Pune';

iii. Total balance at branch M.G.Road
SELECT SUM(balance) AS total_balance
FROM Account
WHERE branch_name = 'M.G.Road';

iv. Delete customer named Ramnath
DELETE FROM Customer
WHERE cust_name = 'Ramnath';

v. Change city of customer Sanjay → Pune
UPDATE Customer
SET cust_city = 'Pune'
WHERE cust_name = 'Sanjay';

C. any one
1. Number of account holders per city
SELECT C.cust_city, COUNT(A.acctno) AS total_accounts
FROM Customer C, Account A
WHERE C.custno = A.custno
GROUP BY C.cust_city;

2. View: Account details with customer + branch
CREATE VIEW AccountCustomerView AS
SELECT A.acctno, A.acct_type, A.balance, A.branch_name,
       C.cust_name, C.cust_city
FROM Account A, Customer C
WHERE A.custno = C.custno;