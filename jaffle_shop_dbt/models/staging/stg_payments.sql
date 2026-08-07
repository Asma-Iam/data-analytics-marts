WITH source AS (
    SELECT * FROM {{ source('jaffle_shop', 'payments') }}
),

renamed AS (
    SELECT
        id AS payment_id,
        order_id,
        payment_method,
        CAST(amount / 100.0 AS DECIMAL(10,2)) AS amount
    FROM source
)

SELECT * FROM renamed
