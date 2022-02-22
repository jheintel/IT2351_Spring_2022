-- from orders format order date and shipped date as MM/DD/YY, include oder_id
-- from customers include first and last name concat'ed
-- from order details include quantity
-- from items include the artist and unit price
-- order by last name, order_qty

select o.order_id as "Order ID", 
	concat(c.customer_first_name, " ", c.customer_last_name) as "Contact Name",
    od.order_qty as "Order Quantity",
    i.artist as "Artist", i.unit_price as "Unit Price",
	date_format(o.order_date, "%c/%d/%y") as "Order date",
	date_format(o.shipped_date, "%c/%d/%y") as "Shipped date"
from orders o
inner join customers c      on o.customer_id = c.customer_id
inner join order_details od on o.order_id = od.order_id
inner join items i          on i.item_id = od.item_id
order by c.customer_last_name, od.order_qty asc