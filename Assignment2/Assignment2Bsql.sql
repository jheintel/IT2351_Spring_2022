-- from customers table show first and last name as one
-- field called Contact Name, show states OH and CA
-- organize by state, last name, first name

select concat(customer_first_name, " ", customer_last_name) as "Contact Name",
	customer_state as "State"
from customers
where customer_state = "CA" or customer_state = "OH"
order by customer_state, customer_last_name, customer_first_name asc