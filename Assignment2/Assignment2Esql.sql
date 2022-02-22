-- from orders format order date and shipped date as MM/DD/YY
-- include oder_id and customer_id
-- from customers include first and last name concat'ed
-- from order details include quantity
-- order by last name, order_qty

select o.order_id as "Order ID", 
	concat(c.customer_first_name, " ", c.customer_last_name) as "Contact Name",
    od.item_id,
    od.order_qty as "Order Quantity",
	date_format(o.order_date, "%c/%d/%y") as "Order date",
	date_format(o.shipped_date, "%c/%d/%y") as "Shipped date"
from orders as o
inner join customers as c on o.customer_id = c.customer_id
inner join order_details as od on o.order_id = od.order_id
order by c.customer_last_name, od.order_qty asc