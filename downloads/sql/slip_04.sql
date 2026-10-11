CREATE TABLE Policy (
    pno INT PRIMARY KEY,
    pname VARCHAR(50),
    premium_amt NUMERIC(10,2),
    policy_type VARCHAR(20) CHECK (policy_type IN ('Yearly', 'Half-
yearly', 'Monthly'))
);


CREATE TABLE Customer (
    cno INT PRIMARY KEY,
    cname VARCHAR(50),
    city VARCHAR(50),
    agent_name VARCHAR(50),
    pno INT,
    FOREIGN KEY (pno) REFERENCES Policy(pno)
);


INSERT INTO Policy VALUES
(1, 'Jeevan Anand', 25000, 'Yearly'),
(2, 'Health Plus', 12000, 'Half-yearly'),
(3, 'Child Secure', 2000, 'Monthly'),
(4, 'Life Secure', 5000, 'Monthly'),
(5, 'Retirement Plan', 30000, 'Yearly');


INSERT INTO Customer VALUES
(101, 'Ravi', 'Pune', 'Ajay', 1),
(102, 'Meena', 'Mumbai', 'Vikas', 2),
(103, 'Kiran', 'Delhi', 'Sonia', 3),
(104, 'Arjun', 'Pune', 'Ajay', 4),
(105, 'Sita', 'Nashik', 'Vikas', 1),
(106, 'Rohit', 'Pune', 'Sonia', 5);




SELECT *
FROM Customer
WHERE city = 'Pune';


SELECT AVG(premium_amt) AS avg_premium

FROM Policy;


SELECT COUNT(*) AS customer_count
FROM Customer
WHERE pno = (
    SELECT pno
    FROM Policy
    WHERE pname = 'Jeevan Anand'
);


UPDATE Policy
SET premium_amt = premium_amt * 1.10
WHERE policy_type = 'Monthly';


SELECT policy_type, COUNT(*) AS total_policies
FROM Policy

GROUP BY policy_type;




SELECT policy_type
FROM Policy
GROUP BY policy_type
ORDER BY AVG(premium_amt) DESC
LIMIT 1;


CREATE VIEW MaxPoliciesCustomer AS
SELECT cname, COUNT(*) AS total_policies
FROM Customer
GROUP BY cname
ORDER BY total_policies DESC

LIMIT 1;