-- Part 1: RIGHT JOIN. Translation rows with no matching product.
SELECT
    p.product_id,
    t.product_category_name_english AS category
FROM products AS p
RIGHT JOIN product_category_name_translation AS t
    ON p.product_category_name = t.product_category_name
WHERE p.product_id IS NULL;

-- Part 2: FULL OUTER JOIN. Mismatches on either side.
SELECT
    p.product_id,
    p.product_category_name AS product_side,
    t.product_category_name AS translation_side
FROM products AS p
FULL OUTER JOIN product_category_name_translation AS t
    ON p.product_category_name = t.product_category_name
WHERE p.product_id IS NULL
   OR t.product_category_name IS NULL
LIMIT 10;

-- Part 3: self join. Pairs of sellers in the same city.
-- s1.seller_id < s2.seller_id avoids pairing a seller with itself
-- and avoids listing the same pair twice.
SELECT
    s1.seller_id AS seller_a,
    s2.seller_id AS seller_b,
    s1.seller_city
FROM sellers AS s1
JOIN sellers AS s2
    ON s1.seller_city = s2.seller_city
   AND s1.seller_id < s2.seller_id
LIMIT 10;