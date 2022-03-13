select distinct category_name
from categories
where category_id in 
	(select category_id from products)
order by category_name