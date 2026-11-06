-- Step 1: total paid for each order
WITH order_totals AS (
    SELECT
        order_id,
        SUM(payment_value) AS order_total
    FROM order_payments
    GROUP BY order_id
),
-- Step 2: total spent and order count for each customer
customer_totals AS (
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS num_orders,
        SUM(t.order_total) AS total_spent
    FROM orders AS o
    JOIN customers AS c
        ON o.customer_id = c.customer_id
    JOIN order_totals AS t
        ON o.order_id = t.order_id
    GROUP BY c.customer_unique_id
)
-- Step 3: count customers with more than one order
SELECT COUNT(*) AS repeat_customers
FROM customer_totals
WHERE num_orders > 1;