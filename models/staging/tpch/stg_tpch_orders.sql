with source as (

    select * from {{ source('tpch', 'cust_order') }}

),

renamed as (

    select

        order_key as order_key,
        cust_key as customer_key,
        order_status as status_code,
        total_price as total_price,
        order_date as order_date,
        order_priority as priority_code,
        clerk as clerk_name,
        shippriority as ship_priority,
        cust_comment as comment

    from source

)

select * from renamed