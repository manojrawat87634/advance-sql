-- 1. Create the Users table
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(100)
);

-- 2. Create the Products table
CREATE TABLE products (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT
);

-- 3. Create the Enterprise-Grade Orders table
-- Note: composite keys include id, order_date, and user_id to satisfy partitioning rules
CREATE TABLE orders (
    id BIGINT NOT NULL AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2),
    status VARCHAR(30),
    PRIMARY KEY (id, order_date, user_id)
)
-- Main partition separates data by Year (Range)
PARTITION BY RANGE (YEAR(order_date))
-- Subpartition splits each year into 4 balanced chunks based on user_id (Hash)
SUBPARTITION BY HASH (user_id) SUBPARTITIONS 4 
(
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION p2026 VALUES LESS THAN (2027),
    PARTITION pFuture VALUES LESS THAN MAXVALUE
);