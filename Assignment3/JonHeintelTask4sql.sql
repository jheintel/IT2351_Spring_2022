# count the unshipped orders and add up how much money I need to send them

select count(*) as "Number of Orders", 
	   sum(ship_amount) as "Order Value"
from orders
where ship_date is null