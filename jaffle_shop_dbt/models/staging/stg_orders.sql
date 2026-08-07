WITH source AS (
    SELECT * FROM {{ source('jaffle_shop', 'orders') }}
)

    SELECT
    id AS order_id,
    user AS customer_id,
    order_date,
    status
FROM source
