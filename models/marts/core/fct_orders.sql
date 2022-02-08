with customers as (

    select * from {{ ref('stg_customers')}}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ref('stg_payments')}}
),

final as (

    select orders.order_id,
    customers.customer_id,
    sum(payments.amount) as amount
    from  payments
    join orders using(order_id)
    join customers using (customer_id)
    group by orders.order_id,customers.customer_id
)

select * from final