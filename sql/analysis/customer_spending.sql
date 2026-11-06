-- Step 1: total paid for each order
WITH order_totals AS (
    SELECT
        order_id,
        SUM(payment_value) AS order_total   -- add up all payments for the order
    FROM order_payments
    GROUP BY order_id                       -- one row per order
),
-- Step 2: total spent and order count for each customer (uses step 1)
customer_totals AS (
    SELECT
        c.customer_unique_id,               -- the real person ID
        COUNT(o.order_id) AS num_orders,    -- how many orders they placed
        SUM(t.order_total) AS total_spent   -- how much they paid overall
    FROM orders AS o
    JOIN customers AS c
        ON o.customer_id = c.customer_id
    JOIN order_totals AS t
        ON o.order_id = t.order_id
    GROUP BY c.customer_unique_id
)
-- Step 3: show the top 10 customers by spending
SELECT
    customer_unique_id,
    num_orders,
    total_spent
FROM customer_totals
ORDER BY total_spent DESC
LIMIT 10;