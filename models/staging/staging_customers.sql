WITH raw_customers AS (
    SELECT
        customer_id,
        UPPER(TRIM(first_name)) AS first_name,
        UPPER(TRIM(last_name)) AS last_name,
        email,
        phone_number,
        country_code,
        registration_date AS signup_date
    FROM {{ source('raw_data', 'customers') }}
    WHERE email IS NOT NULL
        AND country_code IN {{ set_country_filter() }}
)
SELECT
    customer_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    email,
    phone_number,
    country_code,
    signup_date
FROM raw_customers
