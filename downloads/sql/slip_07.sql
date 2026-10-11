CREATE TABLE Item (
    itemno INT PRIMARY KEY,
    name VARCHAR(50),
    quantity INT
);

CREATE TABLE Supplier (
    sno INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Item_Supplier (
    itemno INT,
    sno INT,
    rate NUMERIC(10,2),
    PRIMARY KEY (itemno, sno),
    FOREIGN KEY (itemno) REFERENCES Item(itemno),
    FOREIGN KEY (sno) REFERENCES Supplier(sno)
);

INSERT INTO Item VALUES
(1, 'Keyboard', 50),
(2, 'Mouse', 40),
(3, 'Monitor', 15),
(4, 'USB Cable', 5);

INSERT INTO Supplier VALUES
(101, 'Mahesh Traders', 'Pune'),

(102, 'Meera Electronics', 'Mumbai'),
(103, 'Raj Suppliers', 'Nashik'),
(104, 'Mohan Distributors', 'Nagpur');

INSERT INTO Item_Supplier VALUES
(1, 101, 500),
(2, 101, 250),
(3, 102, 7000),
(4, 103, 100),
(2, 104, 230),
(3, 104, 6800);

B. Queries (any 3)
i. Change quantity of item ‘Mouse’ to 80
UPDATE Item
SET quantity = 80
WHERE name = 'Mouse';

ii. Suppliers whose name begins with ‘M’
SELECT *
FROM Supplier
WHERE name LIKE 'M%';

iii. Total count of items
SELECT COUNT(*) AS total_items
FROM Item;

iv. Suppliers not living in Pune
SELECT name
FROM Supplier
WHERE city <> 'Pune';

v. Items with quantity < 10
SELECT name

FROM Item
WHERE quantity < 10;

C. Choice
1. Supplier who supplies Item with minimum rate
SELECT S.name
FROM Supplier S
WHERE S.sno = (
    SELECT sno
    FROM Item_Supplier
    WHERE rate = (SELECT MIN(rate) FROM Item_Supplier)
);

2. View: supplier-wise list of items
CREATE VIEW Supplier_Item_List AS
SELECT S.name AS supplier_name, I.name AS item_name, IS1.rate

FROM Supplier S, Item I, Item_Supplier IS1
WHERE S.sno = IS1.sno AND I.itemno = IS1.itemno;