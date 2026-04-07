-- Add row number
SELECT *,
ROW_NUMBER() OVER() AS row_num
FROM orders;

-- Rank orders by amount
SELECT *,
ROW_NUMBER() OVER(ORDER BY amount DESC) AS amount_rank
FROM orders;

-- Rank per customer
SELECT *,
ROW_NUMBER() OVER(
    PARTITION BY customer_id
) AS cutomer_rank
FROM orders;

-- Rank all customer by amount
SELECT order_id, customer_id, amount,
ROW_NUMBER() OVER(ORDER BY amount DESC) AS rank2
FROM orders;

-- Top order per customer
SELECT *
FROM (
    SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY customer_id
        ORDER BY amount DESC
    ) AS top_rank
    FROM orders
) t
WHERE top_rank = 1;

-- Second highest order per customer
SELECT *
FROM (
    SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY customer_id
        ORDER BY amount DESC
    ) AS top_rank
    FROM orders
) t
WHERE top_rank = 2;