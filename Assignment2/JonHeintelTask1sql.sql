-- concatenates first name and last name into a name with the column alias of Name

select concat(customer_first_name, " ",customer_last_name) as "Name"
from customers
order by customer_last_name, customer_first_name asc