# count how many customers are in each state

select count(customer_id) as "Number of Customers",
	   state
from addresses
group by state