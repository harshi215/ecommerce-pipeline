-- Part 1: scalar subquery. Payments larger than the average payment.
SELECT order_id, payment_value
FROM order_payments
WHERE payment_value > (
    SELECT AVG(payment_value)
    FROM order_payments
)
ORDER BY payment_value DESC
LIMIT 10;

-- Part 2: correlated subquery. Number of products in each category.
-- The inner query uses t.product_category_name from the outer row.
SELECT
    t.product_category_name_english AS category,
    (
        SELECT COUNT(*)
        FROM products AS p
        WHERE p.product_category_name = t.product_category_name
    ) AS product_count
FROM product_category_name_translation AS t
ORDER BY product_count DESC
LIMIT 10;
--- Part 3: correlated subquery. Orders without reviews.
SELECT o.order_id
FROM orders AS o
WHERE NOT EXISTS (
    SELECT 1
    FROM order_reviews AS r
    WHERE r.order_id = o.order_id
)
LIMIT 10;