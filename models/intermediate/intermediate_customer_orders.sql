WITH customer_orders AS (
    SELECT
        c.customer_id,
        c.full_name,
        c.country_code,
        o.order_id,
        o.order_date,
        o.total_amount
    FROM {{ ref('staging_customers') }} c
    LEFT JOIN {{ ref('staging_orders') }} o
    ON c.customer_id = o.customer_id
)
SELECT
    customer_id,
    full_name,
    country_code,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_spent,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM customer_orders
GROUP BY customer_id, full_name, country_code
