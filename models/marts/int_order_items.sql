select
    line_item.order_item_key,
    line_item.part_key,
    line_item.line_number,
    line_item.extended_price,
    orders.order_key,
    orders.customer_key,
    orders.order_date,
    customers.customer_name,
    customers.account_balance,
    {{ discounted_amount('line_item.extended_price', 'line_item.discount_percentage') }} as item_discount_amount
from 
    {{ ref('stg_tpch_orders') }} as orders
join
    {{ ref('stg_tpch_line_item') }} as line_item
    on orders.order_key = line_item.order_key
join
    {{ ref('stg_tpch_customers') }} as customers
    on orders.customer_key = customers.customer_key
order by
    orders.order_date
