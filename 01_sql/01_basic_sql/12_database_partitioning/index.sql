CREATE TABLE orders (
    id BIGSERIAL,
    order_date DATE NOT NULL,
    customer_id INT,
    amount DECIMAL(10,2)
) PARTITION BY RANGE (order_date);

-- orders of 2025
CREATE TABLE orders_2025
PARTITION OF orders
FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- orders of 2026;.
CREATE TABLE orders_2026
PARTITION OF orders
FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');


INSERT INTO orders
(order_date, customer_id, amount)
VALUES
('2025-03-10',1,1000);

INSERT INTO orders
(order_date, customer_id, amount)
VALUES
('2026-04-15',2,500);