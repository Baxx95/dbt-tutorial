WITH raw_orders AS (
    SELECT
        order_id,
        customer_id,
        order_date,
        total_amount,
        status
    FROM {{ source('raw_data', 'orders') }}
    WHERE status IN ('Completed', 'Shipped')
)
SELECT
    order_id,
    customer_id,
    order_date,
    total_amount,
    status
FROM raw_orders
