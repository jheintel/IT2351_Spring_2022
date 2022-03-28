create or replace view customers_purchases as
select distinct c.first_name, c.last_name, p.product_name
from customers c
join orders o on o.customer_id = c.customer_id
join order_items oi on oi.order_id = o.order_id
join products p on p.product_id = oi.product_id
;
select * from customers_purchases