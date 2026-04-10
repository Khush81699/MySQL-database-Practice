USE company_db1;

DROP TABLE IF EXISTS orders_d30;
DROP TABLE IF EXISTS customers_d30;
DROP TABLE IF EXISTS products_d30;

CREATE TABLE customers_d30 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE products_d30 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT
);

CREATE TABLE orders_d30 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers_d30(customer_id),
    FOREIGN KEY (product_id) REFERENCES products_d30(product_id)
);

INSERT INTO customers_d30 VALUES
(1,'Khushboo','Mumbai'),
(2,'Shivam','Pune'),
(3,'Kumkum','Delhi'),
(4,'Rahul','Bangalore');

INSERT INTO products_d30 VALUES
(101,'Laptop','Electronics',60000),
(102,'Mobile','Electronics',20000),
(103,'Tablet','Electronics',30000),
(104,'Headphones','Accessories',5000);

INSERT INTO orders_d30 VALUES
(1,1,101,1,'2024-01-10'),
(2,2,102,2,'2024-01-11'),
(3,1,103,1,'2024-01-15'),
(4,3,101,1,'2024-01-20'),
(5,2,103,2,'2024-01-25'),
(6,1,104,3,'2024-01-28'),
(7,4,102,1,'2024-02-02');

SELECT * FROM customers_d30;
SELECT * FROM products_d30;
SELECT * FROM orders_d30;

SELECT 
c.customer_name,
SUM(p.price * o.quantity) AS total_spent
FROM orders_d30 o
JOIN customers_d30 c ON o.customer_id = c.customer_id
JOIN products_d30 p ON o.product_id = p.product_id
GROUP BY c.customer_name;

SELECT 
p.category,
SUM(p.price * o.quantity) AS revenue
FROM orders_d30 o
JOIN products_d30 p ON o.product_id = p.product_id
GROUP BY p.category;

SELECT 
p.product_name,
SUM(o.quantity) AS total_sold
FROM orders_d30 o
JOIN products_d30 p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

SELECT 
DATE_FORMAT(o.order_date, '%Y-%m') AS month,
SUM(p.price * o.quantity) AS monthly_revenue
FROM orders_d30 o
JOIN products_d30 p ON o.product_id = p.product_id
GROUP BY month;

SELECT 
c.customer_name,
SUM(p.price * o.quantity) AS revenue
FROM orders_d30 o
JOIN customers_d30 c ON o.customer_id = c.customer_id
JOIN products_d30 p ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY revenue DESC
LIMIT 1;

SELECT 
c.customer_name,
COUNT(o.order_id) AS total_orders
FROM orders_d30 o
JOIN customers_d30 c ON o.customer_id = c.customer_id
GROUP BY c.customer_name;

SELECT 
p.product_name,
SUM(p.price * o.quantity) AS total_revenue
FROM orders_d30 o
JOIN products_d30 p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;