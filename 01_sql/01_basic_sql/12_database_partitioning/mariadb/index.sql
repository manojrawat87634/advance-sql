CREATE TABLE orders (
    id BIGINT AUTO_INCREMENT,
    order_date DATE NOT NULL,
    customer_id INT,
    amount DECIMAL(10,2),
    PRIMARY KEY (id, order_date)
)
PARTITION BY RANGE (YEAR(order_date)) (
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION p2026 VALUES LESS THAN (2027),
    PARTITION p2027 VALUES LESS THAN (2028),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

INSERT INTO orders(order_date, customer_id, amount)
VALUES ('2025-03-10', 1, 1000);

INSERT INTO orders(order_date, customer_id, amount)
VALUES ('2026-04-15', 2, 500);