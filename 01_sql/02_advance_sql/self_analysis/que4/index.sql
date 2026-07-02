CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category_id INT
);

CREATE TABLE categories (
    id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

INSERT INTO categories VALUES
(1,'Electronics'),
(2,'Books'),
(3,'Clothing');

INSERT INTO products VALUES
(1,'Laptop',1200,1),
(2,'Phone',800,1),
(3,'Headphones',200,1),
(4,'Novel',30,2),
(5,'Dictionary',50,2),
(6,'T-Shirt',25,3),
(7,'Jacket',100,3),
(8,'Shoes',150,3);