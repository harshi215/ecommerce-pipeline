-- Part 1: INNER JOIN. Orders with their seller, only where both match.
SELECT
    o.order_id,
    s.seller_id,
    s.seller_city
FROM orders AS o
JOIN order_items AS i
    ON o.order_id = i.order_id
JOIN sellers AS s
    ON i.seller_id = s.seller_id
LIMIT 10;

-- Part 2: LEFT JOIN. Products with their English category name.
-- Products with no category translation still appear, with NULL.
SELECT
    p.product_id,
    p.product_category_name,
    t.product_category_name_english AS category
FROM products AS p
LEFT JOIN product_category_name_translation AS t
    ON p.product_category_name = t.product_category_name
LIMIT 10;