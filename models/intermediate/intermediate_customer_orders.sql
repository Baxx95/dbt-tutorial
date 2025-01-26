{{ config(
    database='raw_data',
    materialized='table'
) }}


{% set customers_row_count = get_row_count(ref('staging_customers')) %}
{% set orders_row_count = get_row_count(ref('staging_orders')) %}

{% if customers_row_count > 0 and orders_row_count > 0 %}
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

{% else %}
    {% if customers_row_count == 0 %}
        {% do log('The staging_customers table has no rows. Skipping execution.', info=True) %}
    {% endif %}
    {% if orders_row_count == 0 %}
        {% do log('The staging_orders table has no rows. Skipping execution.', info=True) %}
    {% endif %}
    SELECT 
        NULL AS customer_id,
        NULL AS full_name,
        NULL AS country_code,
        NULL AS total_orders,
        NULL AS total_spent,
        NULL AS first_order_date,
        NULL AS last_order_date
    WHERE FALSE
{% endif %}
