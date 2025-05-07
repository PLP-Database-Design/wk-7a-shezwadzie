-- USE SALESDB;
-- 1. Create a table named ProductDetail_1NF
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- 2. Insert data into ProductDetail_1NF
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- 3. Create a table named Orders2 achieving 2NF - this means removing partial dependencies
CREATE TABLE Orders2 (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- 4. Insert data into Orders2
INSERT INTO Orders2 (OrderID, CustomerName)
VALUES 
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- 5. create a table named OrderItems - This ensures all non-key attributes depend on the full composite key
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders2(OrderID)
);

-- 6. Insert data into OrderItems
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES 
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- Question 1: Achieving 1NF

-- Transforming ProductDetail to 1NF
SELECT 101 AS OrderID, 'John Doe' AS CustomerName, 'Laptop' AS Product
UNION ALL
SELECT 101, 'John Doe', 'Mouse'
UNION ALL
SELECT 102, 'Jane Smith', 'Tablet'
UNION ALL
SELECT 102, 'Jane Smith', 'Keyboard'
UNION ALL
SELECT 102, 'Jane Smith', 'Mouse'
UNION ALL
SELECT 103, 'Emily Clark', 'Phone';

-- Question 2: Achieving 2NF - Separate into two tables

-- Step 1: Create Orders2 table
-- Table with no partial dependency
SELECT DISTINCT OrderID, CustomerName
FROM orders2;

-- step 2: Create OrderItems table
-- Table with full dependency on composite key
SELECT OrderID, Product, Quantity
FROM Orderitems

-- Now CustomerName is stored separately, and all remaining attributes in OrderItems depend on the full primary key.









