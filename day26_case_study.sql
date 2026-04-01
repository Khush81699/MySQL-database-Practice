USE company_db1;

DROP TABLE IF EXISTS orders_d26;
DROP TABLE IF EXISTS customers_d26;
DROP TABLE IF EXISTS products_d26;

CREATE TABLE customers_d26 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE products_d26 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price INT
);

CREATE TABLE orders_d26 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers_d26(customer_id),
    FOREIGN KEY (product_id) REFERENCES products_d26(product_id)
);

INSERT INTO customers_d26 VALUES
(1,'Khushboo','Mumbai'),
(2,'Shivam','Pune'),
(3,'Kumkum','Delhi');

INSERT INTO products_d26 VALUES
(101,'Laptop',60000),
(102,'Mobile',20000),
(103,'Tablet',30000);

INSERT INTO orders_d26 VALUES
(1,1,101,1,'2024-01-10'),
(2,2,102,2,'2024-01-11'),
(3,1,103,1,'2024-01-15'),
(4,3,101,1,'2024-01-20'),
(5,2,103,2,'2024-01-25');

SELECT * FROM customers_d26;
SELECT * FROM products_d26;
SELECT * FROM orders_d26;

SELECT 
c.customer_name,
SUM(p.price * o.quantity) AS total_spent
FROM orders_d26 o
JOIN customers_d26 c ON o.customer_id = c.customer_id
JOIN products_d26 p ON o.product_id = p.product_id
GROUP BY c.customer_name;

SELECT 
p.product_name,
SUM(o.quantity) AS total_sold
FROM orders_d26 o
JOIN products_d26 p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

SELECT 
c.customer_name,
COUNT(o.order_id) AS total_orders
FROM orders_d26 o
JOIN customers_d26 c ON o.customer_id = c.customer_id
GROUP BY c.customer_name;

SELECT 
o.order_id,
c.customer_name,
p.product_name,
o.quantity,
(p.price * o.quantity) AS total_price,
o.order_date
FROM orders_d26 o
JOIN customers_d26 c ON o.customer_id = c.customer_id
JOIN products_d26 p ON o.product_id = p.product_id;

SELECT 
c.customer_name,
SUM(p.price * o.quantity) AS revenue
FROM orders_d26 o
JOIN customers_d26 c ON o.customer_id = c.customer_id
JOIN products_d26 p ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY revenue DESC
LIMIT 1;