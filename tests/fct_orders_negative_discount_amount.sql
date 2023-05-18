--Testing to see any negative value for total_price_test

select *
  from {{ ref('fct_orders') }}  
 where total_price_test < 0