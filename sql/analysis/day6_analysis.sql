-- Part 1: monthly revenue (GROUP BY on a date)
-- ::timestamp converts the text column into a real date value
SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp::timestamp) AS month,
    SUM(p.payment_value) AS revenue
FROM orders AS o
JOIN order_payments AS p
    ON o.order_id = p.order_id
GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp::timestamp)
ORDER BY month;

-- Part 2: sellers with more than 100 items sold (HAVING)
SELECT
    seller_id,
    COUNT(*) AS items_sold
FROM order_items
GROUP BY seller_id
HAVING COUNT(*) > 100
ORDER BY items_sold DESC
LIMIT 10;

-- Part 3: month-over-month change in revenue (window + LAG)
WITH monthly AS (
    SELECT
        DATE_TRUNC('month', o.order_purchase_timestamp::timestamp) AS month,
        SUM(p.payment_value) AS revenue
    FROM orders AS o
    JOIN order_payments AS p
        ON o.order_id = p.order_id
    GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp::timestamp)
)
SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue,
    revenue - LAG(revenue) OVER (ORDER BY month) AS change
FROM monthly
ORDER BY month;