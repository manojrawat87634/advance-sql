-- ==========================
-- ATOMICITY EXAMPLE
-- ==========================

-- Start a transaction
START TRANSACTION;

-- Step 1: Create a new order
INSERT INTO orders (
    order_id,
    user_id,
    order_date,
    order_status,
    total_amount
)
VALUES (
    'O90001',
    'U1001',
    CURDATE(),
    'processing',
    5000
);

-- Step 2: Reduce stock from products
UPDATE products
SET stock = stock - 1
WHERE product_id = 'P100';

-- If BOTH queries succeed
COMMIT;

-- If ANY query fails
-- ROLLBACK;



-- ==============================================================================
----------------------------- CONSISTENCY EXAMPLE
-- ==============================================================================

START TRANSACTION;

-- Current stock = 1

UPDATE products
SET stock = stock - 2
WHERE product_id = 'P100';

-- This would violate the business rule
-- Stock becomes -1

ROLLBACK;