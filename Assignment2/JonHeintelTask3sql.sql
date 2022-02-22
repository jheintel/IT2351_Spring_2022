-- show customer last name from the customers table and 
-- order date and shipped date from the orders table. 
-- sort by customer last name.

select customer_last_name, order_date, shipped_date
from customers
inner join orders on customers.customer_id = orders.customer_id
order by customer_last_name asc