select
    id as payment_id,
    ORDERID as order_id,
    PAYMENTMETHOD,
    CREATED,
    AMOUNT,
    STATUS

from {{source('stripe','payment')}}
where status='success'