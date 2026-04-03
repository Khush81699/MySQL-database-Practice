USE company_db1;

DROP TABLE IF EXISTS sales_d28;
DROP TABLE IF EXISTS customers_d28;
DROP TABLE IF EXISTS products_d28;

CREATE TABLE customers_d28 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE products_d28 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT
);

CREATE TABLE sales_d28 (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers_d28(customer_id),
    FOREIGN KEY (product_id) REFERENCES products_d28(product_id)
);

INSERT INTO customers_d28 VALUES
(1,'Khushboo','Mumbai'),
(2,'Shivam','Pune'),
(3,'Kumkum','Delhi');

INSERT INTO products_d28 VALUES
(101,'Laptop','Electronics',60000),
(102,'Mobile','Electronics',20000),
(103,'Tablet','Electronics',30000),
(104,'Headphones','Accessories',5000);

INSERT INTO sales_d28 VALUES
(1,1,101,1,'2024-01-10'),
(2,2,102,2,'2024-01-11'),
(3,1,103,1,'2024-01-15'),
(4,3,101,1,'2024-01-20'),
(5,2,103,2,'2024-01-25'),
(6,1,104,3,'2024-01-28');

SELECT * FROM customers_d28;
SELECT * FROM products_d28;
SELECT * FROM sales_d28;

SELECT 
c.customer_name,
SUM(p.price * s.quantity) AS total_revenue
FROM sales_d28 s
JOIN customers_d28 c ON s.customer_id = c.customer_id
JOIN products_d28 p ON s.product_id = p.product_id
GROUP BY c.customer_name;

SELECT 
p.category,
SUM(p.price * s.quantity) AS category_revenue
FROM sales_d28 s
JOIN products_d28 p ON s.product_id = p.product_id
GROUP BY p.category;

SELECT 
p.product_name,
SUM(s.quantity) AS total_sold
FROM sales_d28 s
JOIN products_d28 p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

SELECT 
DATE_FORMAT(s.sale_date, '%Y-%m') AS month,
SUM(p.price * s.quantity) AS monthly_revenue
FROM sales_d28 s
JOIN products_d28 p ON s.product_id = p.product_id
GROUP BY month;

SELECT 
c.customer_name,
SUM(p.price * s.quantity) AS revenue
FROM sales_d28 s
JOIN customers_d28 c ON s.customer_id = c.customer_id
JOIN products_d28 p ON s.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY revenue DESC
LIMIT 1;