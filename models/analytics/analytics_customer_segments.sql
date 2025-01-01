WITH enriched_customer_data AS (
    SELECT
        customer_id,
        full_name,
        country_code,
        total_orders,
        total_spent,
        CASE
            WHEN total_spent > 500 THEN 'High Value'
            WHEN total_spent BETWEEN 100 AND 500 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS customer_segment
    FROM {{ ref('intermediate_customer_orders') }}
)
SELECT
    customer_segment,
    COUNT(customer_id) AS customer_count,
    AVG(total_orders) AS avg_orders,
    AVG(total_spent) AS avg_spent
FROM enriched_customer_data
GROUP BY customer_segment
ORDER BY customer_count DESC
