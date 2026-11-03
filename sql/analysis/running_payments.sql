SELECT
    o.order_id,
    o.order_purchase_timestamp,
    p.payment_value,
    SUM(p.payment_value) OVER (
        ORDER BY o.order_purchase_timestamp
    ) AS running_total
FROM orders AS o
JOIN order_payments AS p
    ON o.order_id = p.order_id
ORDER BY o.order_purchase_timestamp
LIMIT 20;