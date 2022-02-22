-- from orders format order date and shipped date as MM/DD/YY
-- include oder_id and customer_id. Provide Aliases for all

select order_id as "Order ID", c.customer_last_name as "Last Name",
	date_format(order_date, "%c/%d/%y") as "Order date",
	date_format(shipped_date, "%c/%d/%y") as "Shipped date"
from orders as o
inner join customers as c on o.customer_id = c.customer_id
order by c.customer_last_name asc