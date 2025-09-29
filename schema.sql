-- Create Customers table
CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product TEXT,
    amount REAL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Insert sample Customers
INSERT INTO Customers VALUES (1, 'Alice', 'New York');
INSERT INTO Customers VALUES (2, 'Bob', 'Chicago');
INSERT INTO Customers VALUES (3, 'Charlie', 'Los Angeles');
INSERT INTO Customers VALUES (4, 'Diana', 'Houston');

-- Insert sample Orders
INSERT INTO Orders VALUES (101, 1, 'Laptop', 1200);
INSERT INTO Orders VALUES (102, 1, 'Phone', 800);
INSERT INTO Orders VALUES (103, 2, 'Tablet', 600);
INSERT INTO Orders VALUES (104, 3, 'Monitor', 300);
-- Diana (id=4) has no orders
INSERT INTO Orders VALUES (105, 5, 'Headphones', 150); -- Order with no matching customer
-- Customer with id=5 does not exist
-- This will help demonstrate RIGHT JOIN and FULL OUTER JOIN scenarios
-- Note: SQLite does not enforce foreign key constraints by default; enable it if needed
PRAGMA foreign_keys = ON;
-- Indexes for performance
CREATE INDEX idx_customer_id ON Orders(customer_id);
CREATE INDEX idx_customer_name ON Customers(name);  
CREATE INDEX idx_product ON Orders(product);
CREATE INDEX idx_city ON Customers(city);
-- Indexes help speed up JOIN operations and WHERE clause filtering
-- Sample Queries to demonstrate JOINs
-- INNER JOIN (only matching rows)
SELECT Customers.name, Orders.product, Orders.amount
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;
-- LEFT JOIN (all customers, even those without orders)
SELECT Customers.name, Orders.product, Orders.amount
FROM Customers
