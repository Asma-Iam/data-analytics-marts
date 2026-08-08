{{  config(schema='intermediate')  }}
WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

payments AS (
    SELECT * FROM {{ ref('stg_payments') }}
),

payment_totals AS (
    SELECT
        order_id,
        COUNT(*) AS payment_count,
        SUM(amount) AS total_amount
    FROM payments
    GROUP BY order_id
),

orders_with_payments AS (
    SELECT
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status,
        payment_totals.payment_count,
        payment_totals.total_amount
    FROM orders
    LEFT JOIN payment_totals
        ON orders.order_id = payment_totals.order_id
)

SELECT * FROM orders_with_payments
