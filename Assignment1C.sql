-- selects everything in the customers table then sorts 
-- it by State then City
-- Jon Heintel 2/13/22

select *
from customers
order by customer_state, customer_city asc