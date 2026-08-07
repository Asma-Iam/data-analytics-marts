WITH payments_agg AS (
    SELECT
        order_id,
        COUNT(payment_id) AS payment_count,
        SUM(amount) AS total_amount
    FROM {{ ref('stg_payments') }}
    GROUP BY order_id
)

SELECT
    orders.order_id,
    orders.customer_id,
    orders.order_date,
    orders.status,
    payments_agg.payment_count,
    payments_agg.total_amount
FROM {{ ref('stg_orders') }} AS orders
LEFT JOIN payments_agg
    ON orders.order_id = payments_agg.order_id
