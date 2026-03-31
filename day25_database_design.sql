USE company_db1;

DROP TABLE IF EXISTS orders_d25;
DROP TABLE IF EXISTS customers_d25;
DROP TABLE IF EXISTS products_d25;

CREATE TABLE customers_d25 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE products_d25 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price INT
);

CREATE TABLE orders_d25 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers_d25(customer_id),
    FOREIGN KEY (product_id) REFERENCES products_d25(product_id)
);

INSERT INTO customers_d25 VALUES
(1,'Khushboo','Mumbai'),
(2,'Shivam','Pune'),
(3,'Kumkum','Delhi');

INSERT INTO products_d25 VALUES
(101,'Laptop',60000),
(102,'Mobile',20000),
(103,'Tablet',30000);

INSERT INTO orders_d25 VALUES
(1,1,101,1),
(2,2,102,2),
(3,1,103,1),
(4,3,101,1);

SELECT * FROM customers_d25;
SELECT * FROM products_d25;
SELECT * FROM orders_d25;

SELECT 
c.customer_name,
p.product_name,
o.quantity,
(p.price * o.quantity) AS total_price
FROM orders_d25 o
JOIN customers_d25 c ON o.customer_id = c.customer_id
JOIN products_d25 p ON o.product_id = p.product_id;

SELECT 
c.customer_name,
SUM(p.price * o.quantity) AS total_spent
FROM orders_d25 o
JOIN customers_d25 c ON o.customer_id = c.customer_id
JOIN products_d25 p ON o.product_id = p.product_id
GROUP BY c.customer_name;