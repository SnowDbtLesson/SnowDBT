with orders as (
    
    select * from {{ ref('stg_tpch_orders') }} 

),
order_item_summary as (

    select 
        order_key,
        total_price * 2 as total_price_test
    from orders
),
final as (

    select 

        orders.order_key, 
        orders.order_date,
        orders.customer_key,
        orders.status_code,
        orders.priority_code,
        orders.clerk_name,
        orders.ship_priority,
                
        --1 as order_count,                
        order_item_summary.total_price_test
    from
        orders
        inner join order_item_summary
            on orders.order_key = order_item_summary.order_key
)
select 
    *
from
    final
order by
    order_date