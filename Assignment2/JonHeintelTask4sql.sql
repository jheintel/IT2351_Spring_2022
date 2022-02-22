-- display title, artist and order_qty for items ordered 
-- using table aliases and sorting by title

select i.title, i.artist, od.order_qty
from items as i
inner join order_details as od
	on i.item_id = od.item_id
order by i.title asc