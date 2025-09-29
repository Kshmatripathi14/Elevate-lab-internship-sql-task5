-- INNER JOIN (only matching rows)
SELECT Customers.name, Orders.product, Orders.amount
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- LEFT JOIN (all customers, even those without orders)
SELECT Customers.name, Orders.product, Orders.amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- RIGHT JOIN (all orders, even if customer missing) -> SQLite doesn’t support RIGHT JOIN directly
-- Workaround: swap table order
SELECT Customers.name, Orders.product, Orders.amount
FROM Orders
LEFT JOIN Customers ON Customers.customer_id = Orders.customer_id;

-- FULL OUTER JOIN (all customers + all orders, even if no match)
-- SQLite doesn’t support FULL JOIN -> use UNION of LEFT + RIGHT
SELECT Customers.name, Orders.product, Orders.amount
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
UNION
SELECT Customers.name, Orders.product, Orders.amount
FROM Orders
LEFT JOIN Customers ON Customers.customer_id = Orders.customer_id;
