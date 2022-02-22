-- show customer last name from the customers table and 
-- order date and shipped date from the orders table. 
-- sort by customer last name.

select c.customer_last_name, o.order_date, o.shipped_date
from customers as c
inner join orders as o 
	on c.customer_id = o.customer_id
order by customer_last_name asc