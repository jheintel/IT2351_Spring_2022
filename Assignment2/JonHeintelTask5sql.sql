-- display customer id, title, artist and order_qty for items ordered 
-- using table aliases and sorting by customer id then title

select o.customer_id, i.title, i.artist, od.order_qty
from items as i

inner join order_details as od on i.item_id = od.item_id
inner join orders as o on o.order_id = od.order_id
order by o.customer_id, i.title asc