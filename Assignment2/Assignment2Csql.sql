-- from orders format order date and shipped date as MM/DD/YY
-- include oder_id and customer_id. Provide Aliases for all

select date_format(order_date, "%c/%d/%y") as "Order date",
	date_format(shipped_date, "%c/%d/%y") as "Shipped date",
    order_id as "Order ID", customer_id as "Customer ID"
from orders