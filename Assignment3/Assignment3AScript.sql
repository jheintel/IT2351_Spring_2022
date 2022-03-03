select
      # Count distinct order numbers to count # of orders
       count(distinct(order_id)) as "Number of Orders",
       
       # Add up the ship_amount column
       sum(ship_amount) as "Pending Shipping Costs"
from orders